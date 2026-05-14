#include "config.h"
#include "globals.h"
#include "buzzer.h"
#include "ir.h"

//===========================================================
// 红外接收状态变量 (模块内静态)
//===========================================================
static volatile u8  sample_cnt;   // 高电平采样计数
static u8  bit_cnt;               // 剩余位计数
static u8  user_h;                // 用户码高字节
static u8  user_l;                // 用户码低字节
static volatile u8  data_byte;    // 当前接收数据字节
static volatile u8  shift_reg;    // 移位寄存器
static volatile u8  sync;         // 同步标志
static volatile u8  pin_last;     // 上次引脚电平

//===========================================================
// IR_Sample — NEC 协议采样状态机 (每 250us 由 Timer1 ISR 调用)
//
// NEC 格式:
//   同步头: 9ms 低 + 4.5ms 高 (重复码: 9ms 低 + 2.25ms 高)
//   数据位:
//     逻辑 "0": 560us 低 + 560us 高  (~1.12ms 周期)
//     逻辑 "1": 560us 低 + 1.69ms 高 (~2.25ms 周期)
//   数据格式: 用户码(8bit) + 用户码反码(8bit) + 键值(8bit) + 键值反码(8bit)
//
// 本函数检测高电平持续时间 (下降沿时采样)
//===========================================================
void IR_Sample(void)
{
    u8 sample;
    u8 cur_level;

    sample_cnt++;

    cur_level = IR_PIN;

    // 下降沿检测: 上次高电平 → 当前低电平
    if (pin_last && !cur_level) {
        sample     = sample_cnt;  // 记录高电平持续时间
        sample_cnt = 0;

        //--- 同步头检测 ---
        if (sample > IR_SYNC_MAX) {
            sync = 0;       // 超时, 无效
        } else if (sample >= IR_SYNC_MIN) {
            // 检测到同步头
            if (sample >= IR_SYNC_DIVIDE) {
                // 普通帧同步头 (4.5ms 高电平)
                sync    = 1;
                bit_cnt = IR_BIT_COUNT;
            }
            // 否则为重复码 (2.25ms 高电平), 忽略, 保持上次键值
        }
        //--- 数据位接收 ---
        else if (sync) {
            if (sample < IR_DATA_MIN || sample > IR_DATA_MAX) {
                sync = 0;   // 脉宽异常, 放弃
            } else {
                shift_reg >>= 1;
                if (sample >= IR_DATA_DIVIDE) {
                    shift_reg |= 0x80;  // 高电平长 → 逻辑 "1"
                }

                bit_cnt--;
                if (bit_cnt == 0) {
                    // 32 位接收完毕
                    sync = 0;
                    // 校验: 数据与反码应互补
                    if ((shift_reg | data_byte) == 0xFF) {
                        IR_code = data_byte;
                        IR_OK   = 1;
                    }
                } else if ((bit_cnt & 0x07) == 0) {
                    // 每 8 位保存一个字节
                    user_l    = user_h;
                    user_h    = data_byte;
                    data_byte = shift_reg;
                }
            }
        }
    }

    pin_last = cur_level;
}

//===========================================================
// IR_Process — 遥控键值处理 (主循环中调用)
//===========================================================
void IR_Process(void)
{
    if (IR_OK == 0) return;

    IR_OK = 0;
    Buzzer_Beep();

    switch (IR_code) {
    case 0x01:  // 开关键
        KeyPress = KEY_VAL_ON;
        break;

    case 0x06:  // 加键
        KeyPress = KEY_VAL_INC;
        break;

    case 0x04:  // 减键
        KeyPress = KEY_VAL_DEC;
        break;

    case 0x16:  // 直达 20%
        DIS_NUM      = 20;
        USER_SET_VAL = 20;
        break;

    case 0x0C:  // 直达 40%
        DIS_NUM      = 40;
        USER_SET_VAL = 40;
        break;

    case 0x0E:  // 直达 60%
        DIS_NUM      = 60;
        USER_SET_VAL = 60;
        break;

    case 0x14:  // 直达 80%
        DIS_NUM      = 80;
        USER_SET_VAL = 80;
        break;

    case 0x09:  // 直达 100%
        DIS_NUM      = 100;
        USER_SET_VAL = 100;
        break;

    default:
        break;  // 未知键值, 忽略
    }

    IR_code = 0;
}
