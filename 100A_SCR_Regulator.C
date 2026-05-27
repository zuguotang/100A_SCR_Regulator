//Project: 100A_SCR_Regulator.prj
// Device: FT61F14X
// Memory: Flash 4KX14b, EEPROM 128X8b, SRAM 512X8b
// Author: 
//Company: 
//Version:
//   Date: 
//===========================================================
//===========================================================
#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "hardware.h"
#include "display.h"
#include "key.h"
#include "ir.h"
#include "scr.h"
#include "storage.h"
//===========================================================
//Variable definition
volatile char W_TMP  @ 0x70 ;//系统占用不可以删除和修改
volatile char BSR_TMP  @ 0x71 ;//系统占用不可以删除和修改

//===========================================================
//===========================================================
//Function name：main
//parameters：无
//returned value：无
//===========================================================

// 电压控制
volatile u16 DIS_NUM       = 0;
volatile u8  USER_SET_VAL  = DEFAULT_VOLTAGE;
volatile u8  LED_DIS       = 0;
volatile u8  SOFT          = 0;
volatile u8  SOFT_FLAG     = 0;
volatile u8  DIS_NUM_TEMP  = 0;
volatile u8  soft_start_timer = 0;

// 按键
volatile u8 KeyPress  = 0;
volatile u8 key_count = 0;
volatile s8  KEY_ON_num = 0;

// 蜂鸣器
volatile u8 buzzer_flag  = 0;
volatile u8 buzzer_count = 0;

// 掉电检测
volatile u8 DIAO_DIAN = 0;
volatile u8 power_loss_saved = 0;

// 红外遥控
volatile u8 IR_OK   = 0;
volatile u8 IR_code = 0;

// 可控硅延时
volatile u16 inc     = 0;




//===========================================================
// 主函数
//===========================================================
void main(void)
{
    //--- 上电初始化 ---
    __delay_ms(100);             // 等待电源稳定
    Device_Init();              // 系统时钟 + IO

    Storage_Init();             // EEPROM 读取/初始化

    Timer4_Init();              // 2ms 系统时基
    Timer1_Init();              // 红外采样 250us
    Timer2_Init();              // 可控硅触发 (基础配置)
    IO_Int_Init();              // 过零检测外部中断

    INTCON = 0B11000000;        // 使能全局中断 + 外设中断

    //--- 上电默认: 关机状态, 等待用户按开关键 ---
    LED_DIS     = 0;
    DIS_NUM     = 0;
    SOFT        = 0;
    KEY_ON_num  = 0;

    //--- 主循环 ---
    while (1) {
        CLRWDT();   // 喂狗, 防止正常运行时 WDT 复位

        // 按键扫描 (~18ms 执行一次)
        if (key_count >= KEY_SCAN_PERIOD) {
            key_count = 0;
            KEY_Scan();
        }

        // 按键处理
        KEY_Process();

        // 红外处理
        IR_Process();

        // LED 显示刷新
        if (LED_DIS == 1) {
            Display_Update();
        } else {
            Display_Off();
        }

        // 掉电检测: 过零信号丢失超过 100ms
        if (DIAO_DIAN < POWER_LOSS_TICK) {
            power_loss_saved = 0;
        }

        if (DIAO_DIAN >= POWER_LOSS_TICK && power_loss_saved == 0) {
            SCR_OFF();                          // 关断输出
            Storage_SaveOnPowerLoss();          // 保存到 EEPROM
            LED_DIS     = 0;
            SOFT        = 0;
            KEY_ON_num  = 0;
            power_loss_saved = 1;                // 防止掉电期间重复写 EEPROM
        }
    }
}
//===========================================================
