#ifndef __SCR_H__
#define __SCR_H__

#include "types.h"

// 可控硅调压控制模块

u16 SCR_LookupAngle(u8 dis_num);    // 查表获取导通角对应 Timer2 ARR 值
void SCR_OnZeroCross(void);         // 过零时调用, 配置 Timer2 触发延时
void SoftStart_Process(void);       // 软启动/软停止步进 (每 100ms 调用)

#endif
