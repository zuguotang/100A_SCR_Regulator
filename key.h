#ifndef __KEY_H__
#define __KEY_H__

// 按键模块 — 状态机消抖 + 长按连发

void KEY_Scan(void);      // 按键扫描状态机 (~18ms 调用一次)
void KEY_Process(void);   // 按键动作处理

#endif
