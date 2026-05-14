#ifndef __BUZZER_H__
#define __BUZZER_H__

// 蜂鸣器模块
// 波形: Timer1 ISR 中翻转引脚 → 2kHz 方波
// 时长: Timer4 ISR 中计时 80ms

void Buzzer_Beep(void);         // 触发一声蜂鸣
void Buzzer_Toggle(void);       // 波形翻转 (Timer1 ISR 中每 250us 调用)
void Buzzer_Tick(void);         // 时长计时 (Timer4 ISR 中每 2ms 调用)

#endif
