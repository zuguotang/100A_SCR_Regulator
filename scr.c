#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "hardware.h"
#include "scr.h"

//===========================================================
// 导通角 → ARR 映射表 (硬件校准后的实测值, 非线性)
// 索引 = DIS_NUM / 5 (0~20)
// Timer2 时钟 = 4MHz, 1 tick = 0.25us
// ARR 越大 = 延时越长 = 功率越小
//===========================================================
static const u16 AngleTable[21] = {
    40000,  // 0%   - 全关 (延时 ≥ 10ms, 等于半波周期)
    34000,  // 5%
    33000,  // 10%
    32000,  // 15%
    31000,  // 20%
    30000,  // 25%
    28000,  // 30%
    26000,  // 35%
    24000,  // 40%
    22000,  // 45%
    20000,  // 50%  - 半功率
    18000,  // 55%
    16000,  // 60%
    14000,  // 65%
    12000,  // 70%
    10000,  // 75%
     8000,  // 80%
     7000,  // 85%
     6000,  // 90%
     5000,  // 95%
        0,  // 100% - 全导通
};

//===========================================================
// 查表: DIS_NUM → Timer2 ARR
//===========================================================
u16 SCR_LookupAngle(u8 dis_num)
{
    u8 idx;

    if (dis_num > 100) dis_num = 100;

    // 对齐到 5 的倍数
    idx = (dis_num + 2) / 5;    // 四舍五入到最近的 5%
    if (idx > 20) idx = 20;

    return AngleTable[idx];
}

//===========================================================
// 过零时调用 — 根据当前 DIS_NUM 配置 Timer2
// 每半波调用一次 (50Hz → 100Hz, 60Hz → 120Hz)
//===========================================================
void SCR_OnZeroCross(void)
{
    // 显示关闭或全关状态 → 关闭输出
    if (LED_DIS == 0) {
        SCR_OFF();
        T2CEN    = 0;
        TIM2IER  = 0;
        return;
    }

    T2CEN = 0;

    // 查表获取延时值
    inc = SCR_LookupAngle(DIS_NUM);

    // DIS_NUM == 0: 全关, 等待软启动进入 5% 后再启动 Timer2
    if (DIS_NUM == 0) {
        SCR_OFF();
        T2CEN   = 0;
        TIM2IER = 0;
        return;
    }

    // DIS_NUM == 100: 全导通, 每个半波过零后给一个短触发脉冲
    if (DIS_NUM == 100) {
        T2CEN   = 0;
        TIM2IER = 0;
        EPIE0   = 0B00000010;
        SCR_ON();
        __delay_us(20);
        SCR_OFF();
        return;
    }

    // 正常调压: 装载 ARR, 启动 Timer2

    TIM2ARRH    = (u8)(inc >> 8);
    TIM2ARRL    = (u8)(inc);
    TIM2CNTRH   = 0;
    TIM2CNTRL   = 0;
    T2UIF       = 1;            // clear pending Timer2 flag
    TIM2SR1     = 0B00000000;   // clear status register
    TIM2EGR     = 0B00000000;   // clear event register
    TIM2IER     = 0B00000001;   // enable overflow interrupt
    EPIE0       = 0B00000010;   // re-enable external interrupt
    T2CEN       = 1;            // 启动计数
}

//===========================================================
// 软启动/软停止步进 (每 100ms 由 Timer4 ISR 调用一次)
// SOFT_FLAG=0: 升压, SOFT_FLAG=1: 降压
//===========================================================
void SoftStart_Process(void)
{
    if (SOFT == 0) return;

    if (SOFT_FLAG == 0) {
        //========== 软启动 (升压) ==========
        DIS_NUM += SOFT_STEP;
        if (DIS_NUM >= DIS_NUM_TEMP) {
            DIS_NUM = DIS_NUM_TEMP;
            SOFT    = 0;
        }
    } else {
        //========== 软停止 (降压) ==========
        if (DIS_NUM >= SOFT_STEP) {
            DIS_NUM -= SOFT_STEP;
        } else {
            DIS_NUM = 0;
        }

        // 降到 0 时关机
        if (DIS_NUM == 0) {
            SOFT        = 0;
            KEY_ON_num  = 0;
            SCR_OFF();
            T2CEN       = 0;
            TIM2IER     = 0;
            LED_DIS     = 0;
        }
    }
}
