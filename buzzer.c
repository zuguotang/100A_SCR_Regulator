//===========================================================
// 蜂鸣器模块
//
// 若软件调频后仍不够响亮, 硬件改进方案:
//   1. 加一个 NPN 三极管 (S8050/2N2222) 驱动蜂鸣器
//      - 蜂鸣器一端接 VCC, 另一端接三极管集电极
//      - 三极管发射极接 GND
//      - RA3 经 1K 电阻接基极
//      - 三极管可提供 100mA+ 驱动电流, 远超 GPIO 的 25mA
//   2. 如果蜂鸣器是压电陶瓷片, 用两个 GPIO 推挽驱动:
//      - 蜂鸣器两端分别接两个 GPIO 引脚
//      - 两个引脚输出反相方波 → 10Vpp 摆幅, 音量翻倍
//
// 软件调谐振频率:
//   修改 config.h 中 BUZZER_FREQ_DIV: 1=2kHz, 2=1kHz, 4=500Hz
//   逐个尝试, 找到最响的那个值
//===========================================================
#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "buzzer.h"

//===========================================================
// 蜂鸣器触发 — 启动 80ms 蜂鸣 (2kHz 驱动)
//===========================================================
void Buzzer_Beep(void)
{
    if (buzzer_flag) return;

    buzzer_flag  = 1;
    buzzer_count = 0;
}

//===========================================================
// 波形生成 (每 250us 由 Timer1 ISR 调用)
// 每 tick 翻转 → 500us 周期 = 2kHz
// 2kHz 接近压电蜂鸣器谐振频率, 响度远大于 125Hz/250Hz
//===========================================================
void Buzzer_Toggle(void)
{
    static u8 div = 0;

    if (!buzzer_flag) {
        div = 0;
        BUZZER_OFF();
        return;
    }

    div++;
    if (div >= BUZZER_FREQ_DIV) {
        div = 0;
        BUZZER_PIN = !BUZZER_PIN;
    }
}

//===========================================================
// 时长计时 (每 2ms 由 Timer4 ISR 调用)
// BUZZER_DURATION_TICK * 2ms = 总持续时间
//===========================================================
void Buzzer_Tick(void)
{
    if (!buzzer_flag) return;

    buzzer_count++;
    if (buzzer_count >= BUZZER_DURATION_TICK) {
        buzzer_count = 0;
        buzzer_flag  = 0;
        BUZZER_OFF();
    }
}
