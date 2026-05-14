#ifndef __CONFIG_H__
#define __CONFIG_H__
#include "SYSCFG.h"
//===========================================================
// 系统时钟: IRC 2倍频 = 32MHz, 系统时钟 = 16MHz
//===========================================================

#define _XTAL_FREQ 32000000 // 系统主频32MHz，参考MS_Q&A_Sheet
//===========================================================
// 频率选择: 取消注释启用 60Hz 模式
//===========================================================
//#define FREQ_60HZ

// 半波周期 (Timer2 时钟 = 16MHz/4分频 = 4MHz, 1 tick = 0.25us)
#ifdef FREQ_60HZ
    #define HALF_WAVE_TICKS   33333   // 60Hz: 8.33ms / 0.25us
#else
    #define HALF_WAVE_TICKS   40000   // 50Hz: 10ms / 0.25us
#endif

//===========================================================
// 看门狗 (WDT)
// WDT 时钟源: 内部 32KHz, 超时约 2s
// 需在 IDE 配置字中启用 WDT
// 代码中 CLRWDT() 位置:
//   1. 主循环开头 — 每次迭代喂狗
//   2. ISR 开头 — 防止多中断源累积触发
//   3. EEPROM 写入等待循环 — 防止写等待阻塞喂狗
//===========================================================

//===========================================================
// 红外遥控参数 (NEC 协议)
//===========================================================
#define IR_SAMPLE_US        250     // 采样周期 us
#define IR_USER_CODE_H      0xBF    // 用户码高字节
#define IR_USER_CODE_L      0x00    // 用户码低字节

// 同步头判断阈值 (单位: IR采样次数)
#define IR_SYNC_MAX         61      // 15ms / 250us = 60, 取61
#define IR_SYNC_MIN         40      // ~9.7ms / 250us
#define IR_SYNC_DIVIDE      51      // 重复码分界: ~12.375ms / 250us
#define IR_DATA_MAX         14      // 数据位最大: 3ms / 250us
#define IR_DATA_MIN         4       // 数据位最小: 0.6ms / 250us
#define IR_DATA_DIVIDE      8       // 0/1 分界: ~1.685ms / 250us
#define IR_BIT_COUNT        32      // 32位数据

//===========================================================
// 按键参数
//===========================================================
#define KEY_SCAN_PERIOD     10       // 按键扫描周期 (9 x 2ms = 18ms)
#define KEY_LONG_TIME       6      // 长按判定 (10 x ~10ms = 100ms)

// 按键值定义
#define KEY_VAL_ON          0x01
#define KEY_VAL_INC         0x02
#define KEY_VAL_DEC         0x03
#define KEY_VAL_LONG        0x04

//===========================================================
// 软启动/软停止参数
//===========================================================
#define SOFT_TICK_MS        100     // 每步间隔 100ms
#define SOFT_TICK_COUNT     50      // 50 x 2ms = 100ms
#define SOFT_STEP           5       // 每步变化 5%
#define VOLTAGE_MAX         100
#define VOLTAGE_MIN         0
#define VOLTAGE_STEP        5

//===========================================================
// 蜂鸣器参数
// 波形: Timer1 ISR (250us) 驱动
// 时长: Timer4 ISR (2ms) 计时
// BUZZER_FREQ_DIV: 1=2kHz, 2=1kHz, 4=500Hz — 调到最响的那个
// 如仍不够响, 需加三极管驱动 (见 buzzer.c 顶部说明)
//===========================================================
#define BUZZER_DURATION_TICK 50     // 50 x 2ms = 100ms 持续时间
#define BUZZER_FREQ_DIV      1      // Timer1 分频: 1=2kHz, 2=1kHz, 4=500Hz

//===========================================================
// EEPROM 地址定义
//===========================================================
#define EE_ADDR_MAIN        0x01    // 电压值主存储
#define EE_ADDR_INIT        0x02    // 初始化标志
#define EE_ADDR_BACKUP      0x03    // 电压值备份

#define EE_INIT_MAGIC       0xF1    // 已初始化魔数

//===========================================================
// 默认参数
//===========================================================
#define DEFAULT_VOLTAGE     50      // 默认 50%

//===========================================================
// 掉电检测
//===========================================================
#define POWER_LOSS_TICK     50      // 50 x 2ms = 100ms 无过零 = 掉电

//===========================================================
// IO 引脚宏定义
//===========================================================
// 可控硅触发输出 RA0
#define SCR_OUT             LATA0
#define SCR_ON()            (LATA0 = 1)
#define SCR_OFF()           (LATA0 = 0)

// 继电器 RB1
#define RELAY               LATB1
#define RELAY_ON()          (LATB1 = 1)
#define RELAY_OFF()         (LATB1 = 0)

// 蜂鸣器 RA3
#define BUZZER_PIN          LATA3
#define BUZZER_ON()         (LATA3 = 1)
#define BUZZER_OFF()        (LATA3 = 0)

// 按键 IO
#define KEY_ON_PIN          RB2     // 开关键
#define KEY_INC_PIN         RA4     // 加键
#define KEY_DEC_PIN         RB5     // 减键

// 红外接收 RC0
#define IR_PIN              RC0

//===========================================================
// 数码管段选 (高电平有效, 共阴数码管)
//===========================================================
#define SEG_A_ON()          (LATB7 = 1)
#define SEG_A_OFF()         (LATB7 = 0)
#define SEG_B_ON()          (LATA5 = 1)
#define SEG_B_OFF()         (LATA5 = 0)
#define SEG_C_ON()          (LATA2 = 1)
#define SEG_C_OFF()         (LATA2 = 0)
#define SEG_D_ON()          (LATB4 = 1)
#define SEG_D_OFF()         (LATB4 = 0)
#define SEG_E_ON()          (LATB3 = 1)
#define SEG_E_OFF()         (LATB3 = 0)
#define SEG_F_ON()          (LATC1 = 1)
#define SEG_F_OFF()         (LATC1 = 0)
#define SEG_G_ON()          (LATB0 = 1)
#define SEG_G_OFF()         (LATB0 = 0)

// 数码管位选 (低电平选通)
#define DIG1_SEL()          (LATB6 = 0); (LATA7 = 1); (LATA6 = 1)
#define DIG2_SEL()          (LATB6 = 1); (LATA7 = 0); (LATA6 = 1)
#define DIG3_SEL()          (LATB6 = 1); (LATA7 = 1); (LATA6 = 0)
#define DIG_ALL_OFF()       (LATB6 = 1); (LATA7 = 1); (LATA6 = 1)

#endif
