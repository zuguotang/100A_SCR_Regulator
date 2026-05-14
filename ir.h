#ifndef __IR_H__
#define __IR_H__

// 红外遥控模块 — NEC 协议

void IR_Sample(void);     // 每 250us 调用一次 (Timer1 ISR 中)
void IR_Process(void);    // 解码结果处理 (主循环中)

#endif
