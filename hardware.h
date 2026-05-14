#ifndef __HARDWARE_H__
#define __HARDWARE_H__

#include "types.h"

//===========================================================
// 硬件抽象层 — 系统时钟、GPIO、定时器、EEPROM、外部中断
//===========================================================

void Device_Init(void);
void Timer1_Init(void);
void Timer2_Init(void);
void Timer4_Init(void);
void IO_Int_Init(void);

u8   EEPROM_Read(u8 addr);
void EEPROM_Write(u8 addr, u8 data);

#endif
