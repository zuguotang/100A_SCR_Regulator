#include "SYSCFG.h"
#include "config.h"
#include "globals.h"
#include "hardware.h"

//===========================================================
// 系统时钟和 IO 初始化
//===========================================================
void Device_Init(void)
{
    OSCCON = 0B01110001;    // WDT 32KHz, IRCF=111=16MHz, 内部振荡
    MISC0  = 0B00000000;    // WDT clock = 32KHz
    WDTCON = 0B00001011;   // SWDTEN=1, WDTPS=1:1024, timeout=32ms;   // SWDTEN=1, WDTPS=1:1024, timeout=32ms
    INTCON = 0B00000000;    // 关闭所有中断

    //--- PORTA ---
    ANSELA = 0B00000001;    // RA0 使能数字输出, 与工作版保持一致
    PORTA  = 0B00000000;
    TRISA  = 0B00010010;    // RA1(过零), RA4(加键)=输入
    WPUA   = 0B00010010;    // RA1, RA4 上拉使能
    WPDA   = 0B00000000;

    //--- PORTB ---
    PORTB  = 0B00000000;
    TRISB  = 0B00100110;    // RB1(NTC/AN0), RB2(开关键), RB5(减键)=输入
    WPUB   = 0B00100100;    // RB2, RB5 上拉使能
    WPDB   = 0B00000000;

    //--- PORTC ---
    PORTC  = 0B00000000;
    TRISC  = 0B00000001;    // RC0(红外)=输入
    WPUC   = 0B00000001;    // RC0 上拉使能
    WPDC   = 0B00000000;

    // 驱动能力配置 (1=增强)
    PSRC0  = 0B11111111;
    PSRC1  = 0B11111111;
    PSRC2  = 0B00001111;
    PSINK0 = 0B11111111;
    PSINK1 = 0B11111111;
    PSINK2 = 0B11111111;
}

//===========================================================
// 定时器4 — 系统时基 (2ms)
// Fck = 16MHz / 128 = 125KHz
// ARR = 250 → 250/125KHz = 2ms
//===========================================================
void Timer4_Init(void)
{
    TIM4EN   = 1;
    TIM4CR1  = 0B10000100;  // 自动预装载
    TIM4PSCR = 0x07;        // 2^7 = 128 分频
    TIM4CNTR = 0;
    TIM4ARR  = 250;         // 2ms 周期
    TIM4IER  = 0B00000001;  // 使能溢出中断
    T4CEN    = 1;           // 启动
}

//===========================================================
// 定时器1 — 红外接收采样 (250us)
// Fck = 16MHz / 8 = 2MHz
// ARR = 500 → 500/2MHz = 250us = IR_sample
//===========================================================
void Timer1_Init(void)
{
    TIM1EN     = 1;
    CKOCON     = 0B00100000;
    TCKSRC     = 0B00000000;    // 时钟源 = 系统时钟 16MHz
    TIM1CR1    = 0B10000100;
    TIM1PSCRH  = 0B00000000;
    TIM1PSCRL  = 0B00000111;    // 8 分频 → 2MHz
    TIM1CNTRH  = 0;
    TIM1CNTRL  = 0;
    TIM1ARRH   = 0x01;
    TIM1ARRL   = 0xF4;          // 500 → 250us
    TIM1IER    = 0B00000001;
    TIM1SR1    = 0B00000000;
    TIM1SR2    = 0B00000000;
    TIM1EGR    = 0B00000000;
    T1CEN      = 1;
}

//===========================================================
// 定时器2 — 可控硅触发延迟 (可变周期)
// Fck = 16MHz / 4 = 4MHz, 1 tick = 0.25us
// 由函数内部根据 DIS_NUM 查表设定 ARR
//===========================================================
void Timer2_Init(void)
{
    TIM2EN   = 1;
    T2CEN    = 0;
    T2UIF    = 1;           // 清除中断标志
    CKOCON   = 0B00100000;
    TCKSRC   = 0B00000000;  // 时钟源 = 16MHz
    TIM2CR1  = 0B10000100;
    TIM2PSCR = 0B00000010;  // 4 分频 → 4MHz
    TIM2CNTRH = 0;
    TIM2CNTRL = 0;
    TIM2SR1  = 0B00000000;
    TIM2EGR  = 0B00000000;
}

//===========================================================
// 外部中断初始化 — 过零检测 (PA1/PB1/PC1)
//===========================================================
void IO_Int_Init(void)
{
    EPS0   = 0B00000000;
    ITYPE0 = 0B00001000;    // 上升沿触发
    EPIE0  = 0B00000010;    // 使能 PA1/PB1/PC1 中断
}

//===========================================================
// EEPROM 读取
//===========================================================
u8 EEPROM_Read(u8 addr)
{
    EEADRL = addr;
    CFGS   = 0;
    EEPGD  = 0;
    RD     = 1;
    NOP();
    NOP();
    NOP();
    NOP();
    return EEDATL;
}

//===========================================================
// EEPROM 写入 (操作期间关全局中断)
//===========================================================
void EEPROM_Write(u8 addr, u8 data)
{
    GIE = 0;
    while (GIE) CLRWDT();

    EEADRL = addr;
    EEDATL = data;
    CFGS   = 0;
    EEPGD  = 0;
    WREN   = 1;
    EEIF   = 0;
    EECON2 = 0x55;
    EECON2 = 0xAA;
    WR     = 1;
    while (WR) CLRWDT();
    WREN   = 0;

    GIE = 1;
}
