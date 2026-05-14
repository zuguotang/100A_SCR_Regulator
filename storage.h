#ifndef __STORAGE_H__
#define __STORAGE_H__

#include "types.h"

// EEPROM 存储管理

void Storage_Init(void);                         // 上电初始化: 读取或初始化 EEPROM
void Storage_SaveOnPowerLoss(void);              // 掉电时保存当前设定值

#endif
