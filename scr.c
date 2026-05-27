#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "hardware.h"
#include "scr.h"

//===========================================================
// µ¼Í¨½Ç ¡ú ARR Ó³Éä±í (Ó²¼þÐ£×¼ºóµÄÊµ²âÖµ, ·ÇÏßÐÔ)
// Ë÷Òý = DIS_NUM / 5 (0~20)
// Timer2 Ê±ÖÓ = 4MHz, 1 tick = 0.25us
// ARR Ô½´ó = ÑÓÊ±Ô½³¤ = ¹¦ÂÊÔ½Ð¡
//===========================================================
static const u16 AngleTable[21] = {
    40000,  // 0%   - È«¹Ø (ÑÓÊ± ¡Ý 10ms, µÈÓÚ°ë²¨ÖÜÆÚ)
    34000,  // 5%
    33000,  // 10%
    32000,  // 15%
    31000,  // 20%
    30000,  // 25%
    28000,  // 30%
    26000,  // 35%
    24000,  // 40%
    22000,  // 45%
    20000,  // 50%  - °ë¹¦ÂÊ
    18000,  // 55%
    16000,  // 60%
    14000,  // 65%
    12000,  // 70%
    10000,  // 75%
     8000,  // 80%
     7000,  // 85%
     6000,  // 90%
     5000,  // 95%
   200,  // 100% - È«µ¼Í¨
};

//===========================================================
// ²é±í: DIS_NUM ¡ú Timer2 ARR
//===========================================================
u16 SCR_LookupAngle(u8 dis_num)
{
    u8 idx;

    if (dis_num > 100) dis_num = 100;

    // ¶ÔÆëµ½ 5 µÄ±¶Êý
    idx = (dis_num + 2) / 5;    // ËÄÉáÎåÈëµ½×î½üµÄ 5%
    if (idx > 20) idx = 20;

    return AngleTable[idx];
}

//===========================================================
// ¹ýÁãÊ±µ÷ÓÃ ¡ª ¸ù¾Ýµ±Ç° DIS_NUM ÅäÖÃ Timer2
// Ã¿°ë²¨µ÷ÓÃÒ»´Î (50Hz ¡ú 100Hz, 60Hz ¡ú 120Hz)
//===========================================================
void SCR_OnZeroCross(void)
{
    // ÏÔÊ¾¹Ø±Õ»òÈ«¹Ø×´Ì¬ ¡ú ¹Ø±ÕÊä³ö
    if (LED_DIS == 0) {
        SCR_OFF();
        T2CEN    = 0;
        TIM2IER  = 0;
        return;
    }

    T2CEN = 0;

    // ²é±í»ñÈ¡ÑÓÊ±Öµ
    inc = SCR_LookupAngle(DIS_NUM);

    // DIS_NUM == 0: È«¹Ø, µÈ´ýÈíÆô¶¯½øÈë 5% ºóÔÙÆô¶¯ Timer2
    if (DIS_NUM == 0) {
        SCR_OFF();
        T2CEN   = 0;
        TIM2IER = 0;
        return;
    }

    // DIS_NUM == 100: å…³é—­å®šæ—¶å™¨, æŒç»­è¾“å‡ºé«˜ç”µå¹³
    if (DIS_NUM == 100) {
        T2CEN   = 0;
        TIM2IER = 0;
        SCR_ON();
        return;
    }

    SCR_OFF();
    TIM2ARRH    = (u8)(inc >> 8);
    TIM2ARRL    = (u8)(inc);
    TIM2CNTRH   = 0;
    TIM2CNTRL   = 0;
    T2UIF       = 1;            // clear pending Timer2 flag
    TIM2SR1     = 0B00000000;   // clear status register
    TIM2EGR     = 0B00000000;   // clear event register
    TIM2IER     = 0B00000001;   // enable overflow interrupt
    EPIE0       = 0B00000010;   // re-enable external interrupt
    T2CEN       = 1;            // Æô¶¯¼ÆÊý
}

//===========================================================
// ÈíÆô¶¯/ÈíÍ£Ö¹²½½ø (Ã¿ 100ms ÓÉ Timer4 ISR µ÷ÓÃÒ»´Î)
// SOFT_FLAG=0: ÉýÑ¹, SOFT_FLAG=1: ½µÑ¹
//===========================================================
void SoftStart_Process(void)
{
    if (SOFT == 0) return;

    if (SOFT_FLAG == 0) {
        //========== ÈíÆô¶¯ (ÉýÑ¹) ==========
        DIS_NUM += SOFT_STEP;
        if (DIS_NUM >= DIS_NUM_TEMP) {
            DIS_NUM = DIS_NUM_TEMP;
            SOFT    = 0;
        }
    } else {
        //========== ÈíÍ£Ö¹ (½µÑ¹) ==========
        if (DIS_NUM >= SOFT_STEP) {
            DIS_NUM -= SOFT_STEP;
        } else {
            DIS_NUM = 0;
        }

        // ½µµ½ 0 Ê±¹Ø»ú
        if (DIS_NUM == 0) {
            SOFT        = 0;
            KEY_ON_num  = 0;
            SCR_OFF();
            T2CEN       = 0;
            TIM2IER     = 0;
            LED_DIS     = 0;
        }
    }
}
