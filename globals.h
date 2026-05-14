#ifndef __GLOBALS_H__
#define __GLOBALS_H__

#include "types.h"

//===========================================================
// 全局状态变量 (在 main.c 中定义, 各模块 extern 引用)
//===========================================================

// 电压控制
extern volatile u16 DIS_NUM;             // 当前电压值 (0~100, 步进5)
extern volatile u8  USER_SET_VAL;        // 用户设定值 (用于 EEPROM 保存)
extern volatile u8  LED_DIS;             // LED 显示使能标志

// 软启动/软停止
extern volatile u8  SOFT;                // 软启停状态: 0=空闲 1=运行中
extern volatile u8  SOFT_FLAG;           // 0=软启动(升压) 1=软停止(降压)
extern volatile u8  DIS_NUM_TEMP;        // 软启动目标值
extern volatile u8  soft_start_timer;    // 软启动时基计数器 (在 isr 中累加)

// 按键状态
extern volatile u8 KeyPress;    // 按键输出值 (KEY_VAL_ON/INC/DEC)
extern volatile u8 key_count;   // 按键扫描时基 (在 isr 中累加)
extern volatile s8  KEY_ON_num;          // 开关键按下次数 (0/1/2)

// 蜂鸣器
extern volatile u8 buzzer_flag; // 蜂鸣器触发标志
extern volatile u8 buzzer_count;// 蜂鸣器持续时间计数

// 掉电检测
extern volatile u8 DIAO_DIAN;   // 掉电计数器 (isr 累加, 过零清零)
extern volatile u8 power_loss_saved; // 掉电保存已执行标志

// 红外遥控
extern volatile u8 IR_OK;       // 红外解码完成标志
extern volatile u8 IR_code;     // 红外键值

// 可控硅触发延时值 (当前半波的 Timer2 ARR)
extern volatile u16 inc;

#endif
