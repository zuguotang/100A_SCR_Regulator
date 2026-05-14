#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "hardware.h"
#include "buzzer.h"
#include "ir.h"
#include "scr.h"

void user_isr();

void interrupt ISR(void)
{
#asm
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
#endasm
	user_isr();
}

void user_isr(void)
{
    CLRWDT();

    // Timer1 - IR + Buzzer (250us)
    if (T1UIE && T1UIF) {
        T1UIF = 1;
        IR_Sample();
        Buzzer_Toggle();
    }

    // Timer4 - system timebase (2ms)
    if (T4UIE && T4UIF) {
        T4UIF = 1;
        key_count++;
        if (DIAO_DIAN < POWER_LOSS_TICK) DIAO_DIAN++;
        Buzzer_Tick();
        if (SOFT == 1) {
            soft_start_timer++;
            if (soft_start_timer >= SOFT_TICK_COUNT) {
                soft_start_timer = 0;
                SoftStart_Process();
            }
        }
    }

    // External - zero cross (PA1/PB1/PC1)
    if ((EPIE0 & 0x02) && (EPIF0 & 0x02)) {
        DIAO_DIAN = 0;
        power_loss_saved = 0;
        EPIF0 |= 0B00000010;
        SCR_OnZeroCross();
    }

    // Timer2 - SCR trigger pulse
    if (T2UIE && T2UIF) {
        T2UIF = 1;
        T2CEN = 0;
        SCR_ON();
        __delay_us(20);
        SCR_OFF();
    }
}