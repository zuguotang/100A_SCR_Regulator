#include "config.h"
#include "globals.h"
#include "display.h"

//===========================================================
// 段码表 — 共阴数码管, 高电平有效
//===========================================================
static void Seg_Set(u8 digit)
{
    // 先清所有段
    SEG_A_OFF(); SEG_B_OFF(); SEG_C_OFF(); SEG_D_OFF();
    SEG_E_OFF(); SEG_F_OFF(); SEG_G_OFF();

    switch (digit) {
        case 0:  SEG_A_ON(); SEG_B_ON(); SEG_C_ON(); SEG_D_ON(); SEG_E_ON(); SEG_F_ON();                break;
        case 1:              SEG_B_ON(); SEG_C_ON();                                                     break;
        case 2:  SEG_A_ON(); SEG_B_ON();             SEG_D_ON(); SEG_E_ON();             SEG_G_ON();      break;
        case 3:  SEG_A_ON(); SEG_B_ON(); SEG_C_ON(); SEG_D_ON();                         SEG_G_ON();      break;
        case 4:              SEG_B_ON(); SEG_C_ON();                         SEG_F_ON(); SEG_G_ON();      break;
        case 5:  SEG_A_ON();             SEG_C_ON(); SEG_D_ON();             SEG_F_ON(); SEG_G_ON();      break;
        case 6:  SEG_A_ON();             SEG_C_ON(); SEG_D_ON(); SEG_E_ON(); SEG_F_ON(); SEG_G_ON();      break;
        case 7:  SEG_A_ON(); SEG_B_ON(); SEG_C_ON();                                                     break;
        case 8:  SEG_A_ON(); SEG_B_ON(); SEG_C_ON(); SEG_D_ON(); SEG_E_ON(); SEG_F_ON(); SEG_G_ON();      break;
        case 9:  SEG_A_ON(); SEG_B_ON(); SEG_C_ON(); SEG_D_ON();             SEG_F_ON(); SEG_G_ON();      break;
        default: break;  // 全灭
    }
}

//===========================================================
// 简单的软件延时 (用于数码管扫描)
//===========================================================
static void DelayShort(u16 n)
{
    u16 i, j;
    for (i = 0; i < n; i++)
        for (j = 0; j < 50; j++);
}

//===========================================================
// 3 位动态扫描显示
// DIS_NUM: 0~99 显示数值, 100 显示 "100"
//===========================================================
void Display_Update(void)
{
    u16 val = DIS_NUM;
    u8  bai, shi, ge;

    if (val < 100) {
        bai = 0x0A;         // 百位灭 (不显示前导零)
        shi = val / 10;
        ge  = val % 10;
    } else {
        bai = 1;
        shi = 0;
        ge  = 0;
    }

    //--- 百位 ---
    DIG_ALL_OFF();
    Seg_Set(bai);
    DIG1_SEL();
    DelayShort(8);

    //--- 十位 ---
    DIG_ALL_OFF();
    Seg_Set(shi);
    DIG2_SEL();
    DelayShort(8);

    //--- 个位 ---
    DIG_ALL_OFF();
    Seg_Set(ge);
    DIG3_SEL();
    DelayShort(8);

    DIG_ALL_OFF();
}

//===========================================================
// 关闭显示
//===========================================================
void Display_Off(void)
{
    DIG_ALL_OFF();
    // 灭所有段
    SEG_A_OFF(); SEG_B_OFF(); SEG_C_OFF(); SEG_D_OFF();
    SEG_E_OFF(); SEG_F_OFF(); SEG_G_OFF();
}
