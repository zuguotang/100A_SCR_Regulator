#include "config.h"
#include "globals.h"
#include "buzzer.h"
#include "key.h"

//===========================================================
// 按键扫描状态机
// 状态0: 等待按下 → 状态1: 15ms 确认 → 状态2: 等待释放/长按
//===========================================================
void KEY_Scan(void)
{
    static u16 key_time  = 0;    // 长按计时
    static u8  state     = 0;    // 状态机
    static u8  temp      = 0;    // 第一次按键值
    static u8  temp2     = 0;    // 确认按键值
    static u8  confirmed = 0;    // 确认的按键值

    switch (state) {

    case 0:  // 等待按键按下
        KEY_ON_PIN  = 1;
        KEY_DEC_PIN = 1;

        if (KEY_ON_PIN  == 0)       temp = KEY_VAL_ON;
        else if (KEY_DEC_PIN == 0)  temp = KEY_VAL_DEC;
        else if (KEY_INC_PIN == 0)  temp = KEY_VAL_INC;
        else                        temp = 0;

        if (temp != 0) state = 1;
        break;

    case 1:  // 再次读取确认
        KEY_ON_PIN  = 1;
        KEY_DEC_PIN = 1;

        if (KEY_ON_PIN  == 0)       temp2 = KEY_VAL_ON;
        else if (KEY_DEC_PIN == 0)  temp2 = KEY_VAL_DEC;
        else if (KEY_INC_PIN == 0)  temp2 = KEY_VAL_INC;
        else                        temp2 = 0;

        if (temp2 == temp) {
            confirmed = temp2;  // 两次一致, 确认有效
            state = 2;
        } else {
            state = 0;          // 不一致, 视为干扰
        }
        break;

    case 2:  // 等待释放 / 长按检测
        KEY_ON_PIN  = 1;
        KEY_DEC_PIN = 1;

        if (KEY_ON_PIN  == 0)       temp2 = KEY_VAL_ON;
        else if (KEY_DEC_PIN == 0)  temp2 = KEY_VAL_DEC;
        else if (KEY_INC_PIN == 0)  temp2 = KEY_VAL_INC;
        else                        temp2 = 0;

        if (temp2 != 0) {
            // 仍按下
            if (temp2 != KEY_VAL_ON) {
                // 加减键支持长按连发
                if (++key_time >= KEY_LONG_TIME) {
                    key_time = 0;
                    KeyPress = confirmed;
                    state    = 0;
                }
            }
        } else {
            // 已释放 → 短按
            key_time = 0;
            KeyPress = confirmed;
            state    = 0;
        }
        break;
    }
}

//===========================================================
// 按键处理 — 将 KeyPress 转换为控制动作
//===========================================================
void KEY_Process(void)
{
    if (KeyPress == KEY_VAL_ON) {
        KeyPress = 0;
        Buzzer_Beep();
        KEY_ON_num++;

        switch (KEY_ON_num) {

        case 1:  // 第一次按开关键 → 开机, 软启动到目标值
            LED_DIS = 1;
            T2CEN   = 0;
            TIM2IER = 0;
            SCR_OFF();
            DIS_NUM = 0;
            inc     = HALF_WAVE_TICKS;

            {
                u8 target = USER_SET_VAL;
                if (target > 100) target = DEFAULT_VOLTAGE;
                if (target > 0)
                    target = ((target + 4) / 5) * 5;
                DIS_NUM_TEMP = target;
            }

            if (DIS_NUM_TEMP == 0) {
                DIS_NUM = 0;
                SOFT    = 0;
                SCR_OFF();
                T2CEN   = 0;
                TIM2IER = 0;
                return;
            }

            SOFT             = 1;
            SOFT_FLAG        = 0;
            soft_start_timer = 0;
            break;

        case 2:  // 第二次按开关键 → 关机, 软停止降压
            if (LED_DIS == 1 && DIS_NUM > 0) {
                SOFT             = 1;
                SOFT_FLAG        = 1;
                DIS_NUM_TEMP     = 0;
                soft_start_timer = 0;
            } else {
                LED_DIS    = 0;
                KEY_ON_num = 0;
                SOFT       = 0;
            }
            break;

        default:  // KEY_ON_num > 2, 忽略 (等待软停止完成后归零)
            break;
        }
    }

    if (KeyPress == KEY_VAL_INC) {
        KeyPress = 0;
        Buzzer_Beep();
        if (LED_DIS == 1 && DIS_NUM < VOLTAGE_MAX) {
            DIS_NUM      += VOLTAGE_STEP;
            USER_SET_VAL  = DIS_NUM;
        }
    }

    if (KeyPress == KEY_VAL_DEC) {
        KeyPress = 0;
        Buzzer_Beep();
        if (LED_DIS == 1 && DIS_NUM > VOLTAGE_MIN) {
            DIS_NUM      -= VOLTAGE_STEP;
            USER_SET_VAL  = DIS_NUM;
        }
    }
}
