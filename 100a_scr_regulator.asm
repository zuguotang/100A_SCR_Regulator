//Deviec:FT61F14X
//-----------------------Variable---------------------------------
		_W_TMP		EQU		70H
		_BSR_TMP		EQU		71H
		_DIS_NUM		EQU		24H
		_USER_SET_VAL		EQU		52H
		_LED_DIS		EQU		3EH
		_SOFT		EQU		3DH
		_SOFT_FLAG		EQU		3CH
		_DIS_NUM_TEMP		EQU		3BH
		_soft_start_timer		EQU		3AH
		_KeyPress		EQU		39H
		_key_count		EQU		38H
		_KEY_ON_num		EQU		37H
		_buzzer_flag		EQU		36H
		_buzzer_count		EQU		35H
		_DIAO_DIAN		EQU		34H
		_power_loss_saved		EQU		33H
		_IR_OK		EQU		32H
		_IR_code		EQU		31H
		_inc		EQU		22H
		_EEIF		EQU		0BH
		_GIE		EQU		0BH
		_RA4		EQU		0CH
		_RB2		EQU		0DH
		_RB5		EQU		0DH
		_RC0		EQU		0EH
		_TIM1EN		EQU		9AH
		_TIM2EN		EQU		9AH
		_TIM4EN		EQU		9AH
		_LATA0		EQU		10CH
		_LATA2		EQU		10CH
		_LATA3		EQU		10CH
		_LATA5		EQU		10CH
		_LATA6		EQU		10CH
		_LATA7		EQU		10CH
		_LATB0		EQU		10DH
		_LATB3		EQU		10DH
		_LATB4		EQU		10DH
		_LATB6		EQU		10DH
		_LATB7		EQU		10DH
		_LATC1		EQU		10EH
		_T4CEN		EQU		111H
		_T4UIE		EQU		112H
		_T4UIF		EQU		113H
		_RD		EQU		195H
		_WR		EQU		195H
		_WREN		EQU		195H
		_CFGS		EQU		195H
		_EEPGD		EQU		195H
		_T1CEN		EQU		211H
		_T1UIE		EQU		215H
		_T1UIF		EQU		216H
		_T2CEN		EQU		30CH
		_T2UIE		EQU		30DH
		_T2UIF		EQU		30EH
		_sample_cnt		EQU		2FH
		_bit_cnt		EQU		2EH
		_data_byte		EQU		2DH
		_shift_reg		EQU		2CH
		_sync		EQU		2BH
		_pin_last		EQU		2AH
//		Storage_SaveOnPowerLoss@save_val		EQU		4CH
//		Storage_Init@backup_val		EQU		50H
//		Storage_Init@main_val		EQU		4FH
//		Storage_Init@init_flag		EQU		4EH
//		___wmul@product		EQU		4CH
//		___wmul@multiplier		EQU		48H
//		___wmul@multiplicand		EQU		4AH
//		EEPROM_Write@addr		EQU		42H
//		EEPROM_Write@addr		EQU		42H
//		EEPROM_Write@data		EQU		41H
//		EEPROM_Write@addr		EQU		42H
//		EEPROM_Read@addr		EQU		41H
//		EEPROM_Read@addr		EQU		41H
//		EEPROM_Read@addr		EQU		41H
//		KEY_Scan@key_time		EQU		20H
//		KEY_Scan@state		EQU		29H
//		KEY_Scan@temp		EQU		28H
//		KEY_Scan@temp2		EQU		27H
//		KEY_Scan@confirmed		EQU		26H
//		KEY_Process@target		EQU		4CH
//		___bmul@multiplier		EQU		4BH
//		___bmul@product		EQU		4AH
//		___bmul@multiplier		EQU		4BH
//		___bmul@multiplicand		EQU		49H
//		___bmul@multiplier		EQU		4BH
//		___awdiv@quotient		EQU		47H
//		___awdiv@sign		EQU		46H
//		___awdiv@counter		EQU		45H
//		___awdiv@divisor		EQU		41H
//		___awdiv@dividend		EQU		43H
//		Display_Update@val		EQU		4BH
//		Display_Update@ge		EQU		4AH
//		Display_Update@shi		EQU		49H
//		Display_Update@bai		EQU		48H
//		___lwmod@counter		EQU		45H
//		___lwmod@divisor		EQU		41H
//		___lwmod@dividend		EQU		43H
//		___lwdiv@quotient		EQU		45H
//		___lwdiv@counter		EQU		47H
//		___lwdiv@divisor		EQU		41H
//		___lwdiv@dividend		EQU		43H
//		Seg_Set@digit		EQU		41H
//		Seg_Set@digit		EQU		41H
//		Seg_Set@digit		EQU		41H
//		DelayShort@j		EQU		45H
//		DelayShort@i		EQU		43H
//		DelayShort@n		EQU		41H
//		SCR_LookupAngle@dis_num		EQU		3FH
//		SCR_LookupAngle@idx		EQU		40H
//		SCR_LookupAngle@dis_num		EQU		3FH
//		SCR_LookupAngle@dis_num		EQU		3FH
//		i1___awdiv@quotient		EQU		78H
//		i1___awdiv@sign		EQU		77H
//		i1___awdiv@counter		EQU		76H
//		i1___awdiv@divisor		EQU		72H
//		i1___awdiv@dividend		EQU		74H
//		IR_Sample@sample		EQU		74H
//		IR_Sample@cur_level		EQU		73H
//		Buzzer_Toggle@div		EQU		30H
//-----------------------Variable END---------------------------------

		MOVLP 	0H 			//0000 	0180
		LJUMP 	20H 			//0001 	3820
		ORG		0004H
		STR 	70H 			//0004 	10F0
		SWAPR 	8H, 0H 		//0005 	1E08
		STR 	71H 			//0006 	10F1
		MOVLB 	1FH 			//0007 	103F
		SWAPR 	71H, 0H 		//0008 	1E71
		STR 	66H 			//0009 	10E6
		SWAPR 	3H, 0H 		//000A 	1E03
		SWAPR 	9H, 0H 		//000B 	1E09
		STR 	64H 			//000C 	10E4
		LDR 	AH, 0H 			//000D 	180A
		STR 	67H 			//000E 	10E7
		LDR 	4H, 0H 			//000F 	1804
		STR 	68H 			//0010 	10E8
		LDR 	5H, 0H 			//0011 	1805
		STR 	69H 			//0012 	10E9
		LDR 	6H, 0H 			//0013 	1806
		STR 	6AH 			//0014 	10EA
		LDR 	7H, 0H 			//0015 	1807
		STR 	6BH 			//0016 	10EB
		LDR 	70H, 0H 			//0017 	1870
		STR 	65H 			//0018 	10E5
		BSR 	7EH, 0H 			//0019 	247E
		MOVLP 	0H 			//001A 	0180
		NOP 					//001B 	1000

		//;isr.c: 37: user_isr();
		MOVLP 	4H 			//001C 	0184
		LCALL 	429H 			//001D 	3429
		BCR 	7EH, 0H 			//001E 	207E
		RETI 					//001F 	1009
		MOVLP 	0H 			//0020 	0180
		LJUMP 	22H 			//0021 	3822
		LDWI 	32H 			//0022 	0032
		STR 	52H 			//0023 	10D2
		LDWI 	20H 			//0024 	0020
		STR 	4H 			//0025 	1084
		LDWI 	0H 			//0026 	0000
		STR 	5H 			//0027 	1085
		LDWI 	1FH 			//0028 	001F
		MOVLP 	6H 			//0029 	0186
		LCALL 	608H 			//002A 	3608
		BCR 	7EH, 0H 			//002B 	207E
		MOVLB 	0H 			//002C 	1020
		MOVLP 	0H 			//002D 	0180
		LJUMP 	2FH 			//002E 	382F

		//;100A_SCR_Regulator.C: 69: _delay((unsigned long)((10)*(32000000/4000.0)));
		LDWI 	68H 			//002F 	0068
		MOVLB 	0H 			//0030 	1020
		STR 	51H 			//0031 	10D1
		LDWI 	E4H 			//0032 	00E4
		DECRSZ 	9H, 1H 		//0033 	1B89
		LJUMP 	33H 			//0034 	3833
		DECRSZ 	51H, 1H 		//0035 	1BD1
		LJUMP 	33H 			//0036 	3833
		NOP 					//0037 	1000

		//;100A_SCR_Regulator.C: 70: Device_Init();
		LCALL 	2EEH 			//0038 	32EE
		MOVLP 	0H 			//0039 	0180

		//;100A_SCR_Regulator.C: 72: Storage_Init();
		LCALL 	16FH 			//003A 	316F

		//;100A_SCR_Regulator.C: 74: Timer4_Init();
		MOVLP 	5H 			//003B 	0185
		LCALL 	5FAH 			//003C 	35FA
		MOVLP 	0H 			//003D 	0180

		//;100A_SCR_Regulator.C: 75: Timer1_Init();
		LCALL 	3CEH 			//003E 	33CE
		MOVLP 	0H 			//003F 	0180

		//;100A_SCR_Regulator.C: 76: Timer2_Init();
		LCALL 	416H 			//0040 	3416
		MOVLP 	0H 			//0041 	0180

		//;100A_SCR_Regulator.C: 77: IO_Int_Init();
		LCALL 	328H 			//0042 	3328
		MOVLP 	0H 			//0043 	0180

		//;100A_SCR_Regulator.C: 79: INTCON = 0B11000000;
		LDWI 	C0H 			//0044 	00C0
		STR 	BH 			//0045 	108B

		//;100A_SCR_Regulator.C: 82: LED_DIS = 0;
		MOVLB 	0H 			//0046 	1020
		CLRF 	3EH 			//0047 	11BE

		//;100A_SCR_Regulator.C: 83: DIS_NUM = 0;
		CLRF 	24H 			//0048 	11A4
		CLRF 	25H 			//0049 	11A5

		//;100A_SCR_Regulator.C: 84: SOFT = 0;
		CLRF 	3DH 			//004A 	11BD

		//;100A_SCR_Regulator.C: 85: KEY_ON_num = 0;
		CLRF 	37H 			//004B 	11B7

		//;100A_SCR_Regulator.C: 88: while (1) {
		CLRWDT 			//004C 	1064

		//;100A_SCR_Regulator.C: 92: if (key_count >= 10) {
		LDWI 	AH 			//004D 	000A
		MOVLB 	0H 			//004E 	1020
		SUBWR 	38H, 0H 		//004F 	1238
		BTSS 	3H, 0H 			//0050 	2C03
		LJUMP 	55H 			//0051 	3855

		//;100A_SCR_Regulator.C: 93: key_count = 0;
		CLRF 	38H 			//0052 	11B8

		//;100A_SCR_Regulator.C: 94: KEY_Scan();
		LCALL 	368H 			//0053 	3368
		MOVLP 	0H 			//0054 	0180

		//;100A_SCR_Regulator.C: 95: }
		//;100A_SCR_Regulator.C: 98: KEY_Process();
		LCALL 	A1H 			//0055 	30A1
		MOVLP 	0H 			//0056 	0180

		//;100A_SCR_Regulator.C: 101: IR_Process();
		LCALL 	330H 			//0057 	3330
		MOVLP 	0H 			//0058 	0180

		//;100A_SCR_Regulator.C: 104: if (LED_DIS == 1) {
		DECRSZ 	3EH, 0H 		//0059 	1B3E
		LJUMP 	5EH 			//005A 	385E

		//;100A_SCR_Regulator.C: 105: Display_Update();
		LCALL 	1FBH 			//005B 	31FB
		MOVLP 	0H 			//005C 	0180

		//;100A_SCR_Regulator.C: 106: } else {
		LJUMP 	60H 			//005D 	3860

		//;100A_SCR_Regulator.C: 107: Display_Off();
		LCALL 	322H 			//005E 	3322
		MOVLP 	0H 			//005F 	0180

		//;100A_SCR_Regulator.C: 108: }
		//;100A_SCR_Regulator.C: 111: if (DIAO_DIAN < 50) {
		LDWI 	32H 			//0060 	0032
		MOVLB 	0H 			//0061 	1020
		SUBWR 	34H, 0H 		//0062 	1234
		BTSS 	3H, 0H 			//0063 	2C03

		//;100A_SCR_Regulator.C: 112: power_loss_saved = 0;
		CLRF 	33H 			//0064 	11B3

		//;100A_SCR_Regulator.C: 113: }
		//;100A_SCR_Regulator.C: 115: if (DIAO_DIAN >= 50 && power_loss_saved == 0) {
		LDWI 	32H 			//0065 	0032
		SUBWR 	34H, 0H 		//0066 	1234
		BTSS 	3H, 0H 			//0067 	2C03
		LJUMP 	4CH 			//0068 	384C
		LDR 	33H, 0H 			//0069 	1833
		BTSS 	3H, 2H 			//006A 	2D03
		LJUMP 	4CH 			//006B 	384C

		//;100A_SCR_Regulator.C: 116: (LATA0 = 0);
		MOVLB 	2H 			//006C 	1022
		BCR 	CH, 0H 			//006D 	200C

		//;100A_SCR_Regulator.C: 117: Storage_SaveOnPowerLoss();
		LCALL 	77H 			//006E 	3077
		MOVLP 	0H 			//006F 	0180

		//;100A_SCR_Regulator.C: 118: LED_DIS = 0;
		MOVLB 	0H 			//0070 	1020
		CLRF 	3EH 			//0071 	11BE

		//;100A_SCR_Regulator.C: 119: SOFT = 0;
		CLRF 	3DH 			//0072 	11BD

		//;100A_SCR_Regulator.C: 120: KEY_ON_num = 0;
		CLRF 	37H 			//0073 	11B7

		//;100A_SCR_Regulator.C: 121: power_loss_saved = 1;
		LDWI 	1H 			//0074 	0001
		STR 	33H 			//0075 	10B3
		LJUMP 	4CH 			//0076 	384C

		//;storage.c: 50: u8 save_val;
		//;storage.c: 52: if (SOFT == 1) {
		MOVLB 	0H 			//0077 	1020
		DECRSZ 	3DH, 0H 		//0078 	1B3D
		LJUMP 	81H 			//0079 	3881

		//;storage.c: 54: if (SOFT_FLAG == 0)
		LDR 	3CH, 0H 			//007A 	183C
		BTSS 	3H, 2H 			//007B 	2D03
		LJUMP 	7FH 			//007C 	387F

		//;storage.c: 55: save_val = DIS_NUM_TEMP;
		LDR 	3BH, 0H 			//007D 	183B
		LJUMP 	82H 			//007E 	3882

		//;storage.c: 56: else
		//;storage.c: 57: save_val = DIS_NUM;
		LDR 	24H, 0H 			//007F 	1824
		LJUMP 	82H 			//0080 	3882

		//;storage.c: 60: save_val = USER_SET_VAL;
		LDR 	52H, 0H 			//0081 	1852
		STR 	4CH 			//0082 	10CC

		//;storage.c: 61: }
		//;storage.c: 64: if (save_val > 100) save_val = 100;
		LDWI 	65H 			//0083 	0065
		SUBWR 	4CH, 0H 		//0084 	124C
		BTSS 	3H, 0H 			//0085 	2C03
		LJUMP 	89H 			//0086 	3889
		LDWI 	64H 			//0087 	0064
		STR 	4CH 			//0088 	10CC

		//;storage.c: 65: if (save_val > 0)
		LDR 	4CH, 0H 			//0089 	184C
		BTSC 	3H, 2H 			//008A 	2903
		LJUMP 	97H 			//008B 	3897

		//;storage.c: 66: save_val = ((save_val + 4) / 5) * 5;
		LDWI 	5H 			//008C 	0005
		STR 	49H 			//008D 	10C9
		LDR 	4CH, 0H 			//008E 	184C
		LCALL 	3E9H 			//008F 	33E9
		MOVLP 	0H 			//0090 	0180
		LCALL 	123H 			//0091 	3123
		MOVLP 	0H 			//0092 	0180
		LDR 	41H, 0H 			//0093 	1841
		LCALL 	163H 			//0094 	3163
		MOVLP 	0H 			//0095 	0180
		STR 	4CH 			//0096 	10CC

		//;storage.c: 69: EEPROM_Write(0x03, save_val);
		LDR 	4CH, 0H 			//0097 	184C
		STR 	41H 			//0098 	10C1
		LDWI 	3H 			//0099 	0003
		LCALL 	1CEH 			//009A 	31CE
		MOVLP 	0H 			//009B 	0180

		//;storage.c: 70: EEPROM_Write(0x01, save_val);
		MOVLB 	0H 			//009C 	1020
		LDR 	4CH, 0H 			//009D 	184C
		STR 	41H 			//009E 	10C1
		LDWI 	1H 			//009F 	0001
		LJUMP 	1CEH 			//00A0 	39CE

		//;key.c: 83: if (KeyPress == 0x01) {
		DECRSZ 	39H, 0H 		//00A1 	1B39
		LJUMP 	F2H 			//00A2 	38F2

		//;key.c: 84: KeyPress = 0;
		CLRF 	39H 			//00A3 	11B9

		//;key.c: 85: Buzzer_Beep();
		LCALL 	11CH 			//00A4 	311C
		MOVLP 	0H 			//00A5 	0180

		//;key.c: 86: KEY_ON_num++;
		INCR 	37H, 1H 		//00A6 	1AB7

		//;key.c: 88: switch (KEY_ON_num) {
		LJUMP 	EAH 			//00A7 	38EA

		//;key.c: 91: LED_DIS = 1;
		LDWI 	1H 			//00A8 	0001
		STR 	3EH 			//00A9 	10BE

		//;key.c: 92: T2CEN = 0;
		MOVLB 	6H 			//00AA 	1026
		BCR 	CH, 0H 			//00AB 	200C

		//;key.c: 93: TIM2IER = 0;
		CLRF 	DH 			//00AC 	118D

		//;key.c: 94: (LATA0 = 0);
		MOVLB 	2H 			//00AD 	1022
		BCR 	CH, 0H 			//00AE 	200C

		//;key.c: 95: DIS_NUM = 0;
		MOVLB 	0H 			//00AF 	1020
		CLRF 	24H 			//00B0 	11A4
		CLRF 	25H 			//00B1 	11A5

		//;key.c: 96: inc = 40000;
		LDWI 	40H 			//00B2 	0040
		STR 	22H 			//00B3 	10A2
		LDWI 	9CH 			//00B4 	009C
		STR 	23H 			//00B5 	10A3

		//;key.c: 98: {
		//;key.c: 99: u8 target = USER_SET_VAL;
		LDR 	52H, 0H 			//00B6 	1852
		STR 	4CH 			//00B7 	10CC

		//;key.c: 100: if (target > 100) target = 50;
		LDWI 	65H 			//00B8 	0065
		SUBWR 	4CH, 0H 		//00B9 	124C
		BTSS 	3H, 0H 			//00BA 	2C03
		LJUMP 	BEH 			//00BB 	38BE
		LDWI 	32H 			//00BC 	0032
		STR 	4CH 			//00BD 	10CC

		//;key.c: 101: if (target > 0)
		LDR 	4CH, 0H 			//00BE 	184C
		BTSC 	3H, 2H 			//00BF 	2903
		LJUMP 	CCH 			//00C0 	38CC

		//;key.c: 102: target = ((target + 4) / 5) * 5;
		LDWI 	5H 			//00C1 	0005
		STR 	49H 			//00C2 	10C9
		LDR 	4CH, 0H 			//00C3 	184C
		LCALL 	3E9H 			//00C4 	33E9
		MOVLP 	0H 			//00C5 	0180
		LCALL 	123H 			//00C6 	3123
		MOVLP 	0H 			//00C7 	0180
		LDR 	41H, 0H 			//00C8 	1841
		LCALL 	163H 			//00C9 	3163
		MOVLP 	0H 			//00CA 	0180
		STR 	4CH 			//00CB 	10CC

		//;key.c: 103: DIS_NUM_TEMP = target;
		LDR 	4CH, 0H 			//00CC 	184C
		STR 	3BH 			//00CD 	10BB

		//;key.c: 104: }
		//;key.c: 106: if (DIS_NUM_TEMP == 0) {
		LDR 	3BH, 0H 			//00CE 	183B
		BTSS 	3H, 2H 			//00CF 	2D03
		LJUMP 	D6H 			//00D0 	38D6

		//;key.c: 107: DIS_NUM = 0;
		CLRF 	24H 			//00D1 	11A4
		CLRF 	25H 			//00D2 	11A5

		//;key.c: 108: SOFT = 0;
		CLRF 	3DH 			//00D3 	11BD

		//;key.c: 109: (LATA0 = 0);
		MOVLB 	2H 			//00D4 	1022

		//;key.c: 110: T2CEN = 0;
		//;key.c: 111: TIM2IER = 0;
		LJUMP 	407H 			//00D5 	3C07

		//;key.c: 113: }
		//;key.c: 115: SOFT = 1;
		LDWI 	1H 			//00D6 	0001
		STR 	3DH 			//00D7 	10BD

		//;key.c: 116: SOFT_FLAG = 0;
		CLRF 	3CH 			//00D8 	11BC

		//;key.c: 117: soft_start_timer = 0;
		CLRF 	3AH 			//00D9 	11BA

		//;key.c: 118: break;
		LJUMP 	F2H 			//00DA 	38F2

		//;key.c: 121: if (LED_DIS == 1 && DIS_NUM > 0) {
		DECRSZ 	3EH, 0H 		//00DB 	1B3E
		LJUMP 	E6H 			//00DC 	38E6
		LDR 	24H, 0H 			//00DD 	1824
		IORWR 	25H, 0H 		//00DE 	1425
		BTSC 	3H, 2H 			//00DF 	2903
		LJUMP 	E6H 			//00E0 	38E6

		//;key.c: 122: SOFT = 1;
		LDWI 	1H 			//00E1 	0001
		STR 	3DH 			//00E2 	10BD

		//;key.c: 123: SOFT_FLAG = 1;
		STR 	3CH 			//00E3 	10BC

		//;key.c: 124: DIS_NUM_TEMP = 0;
		CLRF 	3BH 			//00E4 	11BB
		LJUMP 	D9H 			//00E5 	38D9

		//;key.c: 127: LED_DIS = 0;
		CLRF 	3EH 			//00E6 	11BE

		//;key.c: 128: KEY_ON_num = 0;
		CLRF 	37H 			//00E7 	11B7

		//;key.c: 129: SOFT = 0;
		CLRF 	3DH 			//00E8 	11BD
		LJUMP 	F2H 			//00E9 	38F2
		LDR 	37H, 0H 			//00EA 	1837
		XORWI 	1H 			//00EB 	0A01
		BTSC 	3H, 2H 			//00EC 	2903
		LJUMP 	A8H 			//00ED 	38A8
		XORWI 	3H 			//00EE 	0A03
		BTSC 	3H, 2H 			//00EF 	2903
		LJUMP 	DBH 			//00F0 	38DB
		LJUMP 	F2H 			//00F1 	38F2

		//;key.c: 136: }
		//;key.c: 138: if (KeyPress == 0x02) {
		LDWI 	2H 			//00F2 	0002
		XORWR 	39H, 0H 		//00F3 	1639
		BTSS 	3H, 2H 			//00F4 	2D03
		LJUMP 	108H 			//00F5 	3908

		//;key.c: 139: KeyPress = 0;
		CLRF 	39H 			//00F6 	11B9

		//;key.c: 140: Buzzer_Beep();
		LCALL 	11CH 			//00F7 	311C
		MOVLP 	0H 			//00F8 	0180

		//;key.c: 141: if (LED_DIS == 1 && DIS_NUM < 100) {
		DECRSZ 	3EH, 0H 		//00F9 	1B3E
		LJUMP 	108H 			//00FA 	3908
		LDWI 	0H 			//00FB 	0000
		SUBWR 	25H, 0H 		//00FC 	1225
		LDWI 	64H 			//00FD 	0064
		BTSC 	3H, 2H 			//00FE 	2903
		SUBWR 	24H, 0H 		//00FF 	1224
		BTSC 	3H, 0H 			//0100 	2803
		LJUMP 	108H 			//0101 	3908

		//;key.c: 142: DIS_NUM += 5;
		LDWI 	5H 			//0102 	0005
		ADDWR 	24H, 1H 		//0103 	17A4
		BTSC 	3H, 0H 			//0104 	2803
		INCR 	25H, 1H 		//0105 	1AA5

		//;key.c: 143: USER_SET_VAL = DIS_NUM;
		LDR 	24H, 0H 			//0106 	1824
		STR 	52H 			//0107 	10D2

		//;key.c: 144: }
		//;key.c: 145: }
		//;key.c: 147: if (KeyPress == 0x03) {
		LDWI 	3H 			//0108 	0003
		XORWR 	39H, 0H 		//0109 	1639
		BTSS 	3H, 2H 			//010A 	2D03
		RET 					//010B 	1008

		//;key.c: 148: KeyPress = 0;
		CLRF 	39H 			//010C 	11B9

		//;key.c: 149: Buzzer_Beep();
		LCALL 	11CH 			//010D 	311C
		MOVLP 	0H 			//010E 	0180

		//;key.c: 150: if (LED_DIS == 1 && DIS_NUM > 0) {
		DECRSZ 	3EH, 0H 		//010F 	1B3E
		RET 					//0110 	1008
		LDR 	24H, 0H 			//0111 	1824
		IORWR 	25H, 0H 		//0112 	1425
		BTSC 	3H, 2H 			//0113 	2903
		RET 					//0114 	1008

		//;key.c: 151: DIS_NUM -= 5;
		LDWI 	5H 			//0115 	0005
		SUBWR 	24H, 1H 		//0116 	12A4
		LDWI 	0H 			//0117 	0000
		SUBWFB 	25H, 1H 		//0118 	0BA5

		//;key.c: 152: USER_SET_VAL = DIS_NUM;
		LDR 	24H, 0H 			//0119 	1824
		STR 	52H 			//011A 	10D2
		RET 					//011B 	1008

		//;buzzer.c: 28: if (buzzer_flag) return;
		LDR 	36H, 0H 			//011C 	1836
		BTSS 	3H, 2H 			//011D 	2D03
		RET 					//011E 	1008

		//;buzzer.c: 30: buzzer_flag = 1;
		LDWI 	1H 			//011F 	0001
		STR 	36H 			//0120 	10B6

		//;buzzer.c: 31: buzzer_count = 0;
		CLRF 	35H 			//0121 	11B5
		RET 					//0122 	1008
		CLRF 	46H 			//0123 	11C6
		BTSS 	42H, 7H 		//0124 	2FC2
		LJUMP 	12DH 			//0125 	392D
		COMR 	41H, 1H 		//0126 	19C1
		COMR 	42H, 1H 		//0127 	19C2
		INCR 	41H, 1H 		//0128 	1AC1
		BTSC 	3H, 2H 			//0129 	2903
		INCR 	42H, 1H 		//012A 	1AC2
		CLRF 	46H 			//012B 	11C6
		INCR 	46H, 1H 		//012C 	1AC6
		BTSS 	44H, 7H 		//012D 	2FC4
		LJUMP 	136H 			//012E 	3936
		COMR 	43H, 1H 		//012F 	19C3
		COMR 	44H, 1H 		//0130 	19C4
		INCR 	43H, 1H 		//0131 	1AC3
		BTSC 	3H, 2H 			//0132 	2903
		INCR 	44H, 1H 		//0133 	1AC4
		LDWI 	1H 			//0134 	0001
		XORWR 	46H, 1H 		//0135 	16C6
		CLRF 	47H 			//0136 	11C7
		CLRF 	48H 			//0137 	11C8
		LDR 	41H, 0H 			//0138 	1841
		IORWR 	42H, 0H 		//0139 	1442
		BTSC 	3H, 2H 			//013A 	2903
		LJUMP 	156H 			//013B 	3956
		CLRF 	45H 			//013C 	11C5
		INCR 	45H, 1H 		//013D 	1AC5
		BTSC 	42H, 7H 		//013E 	2BC2
		LJUMP 	143H 			//013F 	3943
		LSLF 	41H, 1H 		//0140 	05C1
		RLR 	42H, 1H 			//0141 	1DC2
		LJUMP 	13DH 			//0142 	393D
		LSLF 	47H, 1H 		//0143 	05C7
		RLR 	48H, 1H 			//0144 	1DC8
		LDR 	42H, 0H 			//0145 	1842
		SUBWR 	44H, 0H 		//0146 	1244
		BTSS 	3H, 2H 			//0147 	2D03
		LJUMP 	14BH 			//0148 	394B
		LDR 	41H, 0H 			//0149 	1841
		SUBWR 	43H, 0H 		//014A 	1243
		BTSS 	3H, 0H 			//014B 	2C03
		LJUMP 	152H 			//014C 	3952
		LDR 	41H, 0H 			//014D 	1841
		SUBWR 	43H, 1H 		//014E 	12C3
		LDR 	42H, 0H 			//014F 	1842
		SUBWFB 	44H, 1H 		//0150 	0BC4
		BSR 	47H, 0H 			//0151 	2447
		LSRF 	42H, 1H 		//0152 	06C2
		RRR 	41H, 1H 			//0153 	1CC1
		DECRSZ 	45H, 1H 		//0154 	1BC5
		LJUMP 	143H 			//0155 	3943
		LDR 	46H, 0H 			//0156 	1846
		BTSC 	3H, 2H 			//0157 	2903
		LJUMP 	15EH 			//0158 	395E
		COMR 	47H, 1H 		//0159 	19C7
		COMR 	48H, 1H 		//015A 	19C8
		INCR 	47H, 1H 		//015B 	1AC7
		BTSC 	3H, 2H 			//015C 	2903
		INCR 	48H, 1H 		//015D 	1AC8
		LDR 	48H, 0H 			//015E 	1848
		STR 	42H 			//015F 	10C2
		LDR 	47H, 0H 			//0160 	1847
		STR 	41H 			//0161 	10C1
		RET 					//0162 	1008
		STR 	4BH 			//0163 	10CB
		CLRF 	4AH 			//0164 	11CA
		LDR 	49H, 0H 			//0165 	1849
		BTSC 	4BH, 0H 		//0166 	284B
		ADDWR 	4AH, 1H 		//0167 	17CA
		LSLF 	49H, 1H 		//0168 	05C9
		LSRF 	4BH, 1H 		//0169 	06CB
		LDR 	4BH, 0H 			//016A 	184B
		BTSS 	3H, 2H 			//016B 	2D03
		LJUMP 	165H 			//016C 	3965
		LDR 	4AH, 0H 			//016D 	184A
		RET 					//016E 	1008

		//;storage.c: 11: u8 init_flag = EEPROM_Read(0x02);
		LDWI 	2H 			//016F 	0002
		LCALL 	1EDH 			//0170 	31ED
		MOVLP 	0H 			//0171 	0180
		MOVLB 	0H 			//0172 	1020
		STR 	4EH 			//0173 	10CE

		//;storage.c: 13: if (init_flag != 0xF1) {
		XORWI 	F1H 			//0174 	0AF1
		BTSC 	3H, 2H 			//0175 	2903
		LJUMP 	18BH 			//0176 	398B

		//;storage.c: 15: DIS_NUM = 50;
		LDWI 	32H 			//0177 	0032
		STR 	24H 			//0178 	10A4
		CLRF 	25H 			//0179 	11A5

		//;storage.c: 16: USER_SET_VAL = 50;
		STR 	52H 			//017A 	10D2

		//;storage.c: 17: EEPROM_Write(0x01, 50);
		LDWI 	32H 			//017B 	0032
		STR 	41H 			//017C 	10C1
		LDWI 	1H 			//017D 	0001
		LCALL 	1CEH 			//017E 	31CE
		MOVLP 	0H 			//017F 	0180

		//;storage.c: 18: EEPROM_Write(0x03, 50);
		LDWI 	32H 			//0180 	0032
		MOVLB 	0H 			//0181 	1020
		STR 	41H 			//0182 	10C1
		LDWI 	3H 			//0183 	0003
		LCALL 	1CEH 			//0184 	31CE
		MOVLP 	0H 			//0185 	0180

		//;storage.c: 19: EEPROM_Write(0x02, 0xF1);
		LDWI 	F1H 			//0186 	00F1
		MOVLB 	0H 			//0187 	1020
		STR 	41H 			//0188 	10C1
		LDWI 	2H 			//0189 	0002
		LJUMP 	1CEH 			//018A 	39CE

		//;storage.c: 20: } else {
		//;storage.c: 22: u8 main_val = EEPROM_Read(0x01);
		LDWI 	1H 			//018B 	0001
		LCALL 	1EDH 			//018C 	31ED
		MOVLP 	0H 			//018D 	0180
		MOVLB 	0H 			//018E 	1020
		STR 	4FH 			//018F 	10CF

		//;storage.c: 23: u8 backup_val = EEPROM_Read(0x03);
		LDWI 	3H 			//0190 	0003
		LCALL 	1EDH 			//0191 	31ED
		MOVLP 	0H 			//0192 	0180
		MOVLB 	0H 			//0193 	1020
		STR 	50H 			//0194 	10D0

		//;storage.c: 25: if (main_val == backup_val) {
		XORWR 	4FH, 0H 		//0195 	164F
		BTSS 	3H, 2H 			//0196 	2D03
		LJUMP 	19CH 			//0197 	399C

		//;storage.c: 26: DIS_NUM = main_val;
		LDR 	4FH, 0H 			//0198 	184F
		STR 	24H 			//0199 	10A4
		CLRF 	25H 			//019A 	11A5

		//;storage.c: 27: } else {
		LJUMP 	1A4H 			//019B 	39A4

		//;storage.c: 29: DIS_NUM = backup_val;
		LDR 	50H, 0H 			//019C 	1850
		STR 	24H 			//019D 	10A4
		CLRF 	25H 			//019E 	11A5

		//;storage.c: 30: EEPROM_Write(0x01, backup_val);
		LDR 	50H, 0H 			//019F 	1850
		STR 	41H 			//01A0 	10C1
		LDWI 	1H 			//01A1 	0001
		LCALL 	1CEH 			//01A2 	31CE
		MOVLP 	0H 			//01A3 	0180

		//;storage.c: 31: }
		//;storage.c: 34: if (DIS_NUM > 100) {
		LDWI 	0H 			//01A4 	0000
		MOVLB 	0H 			//01A5 	1020
		SUBWR 	25H, 0H 		//01A6 	1225
		LDWI 	65H 			//01A7 	0065
		BTSC 	3H, 2H 			//01A8 	2903
		SUBWR 	24H, 0H 		//01A9 	1224
		BTSS 	3H, 0H 			//01AA 	2C03
		LJUMP 	1B0H 			//01AB 	39B0

		//;storage.c: 35: DIS_NUM = 100;
		LDWI 	64H 			//01AC 	0064
		STR 	24H 			//01AD 	10A4
		CLRF 	25H 			//01AE 	11A5

		//;storage.c: 36: } else if (DIS_NUM > 0) {
		LJUMP 	1CBH 			//01AF 	39CB
		LDR 	24H, 0H 			//01B0 	1824
		IORWR 	25H, 0H 		//01B1 	1425
		BTSC 	3H, 2H 			//01B2 	2903
		LJUMP 	1CBH 			//01B3 	39CB

		//;storage.c: 37: DIS_NUM = ((DIS_NUM + 4) / 5) * 5;
		LDWI 	5H 			//01B4 	0005
		STR 	41H 			//01B5 	10C1
		CLRF 	42H 			//01B6 	11C2
		LDR 	24H, 0H 			//01B7 	1824
		ADDWI 	4H 			//01B8 	0E04
		STR 	43H 			//01B9 	10C3
		LDWI 	0H 			//01BA 	0000
		ADDWFC 	25H, 0H 		//01BB 	0D25
		STR 	44H 			//01BC 	10C4
		LCALL 	2A9H 			//01BD 	32A9
		LDR 	42H, 0H 			//01BE 	1842
		STR 	49H 			//01BF 	10C9
		LDR 	41H, 0H 			//01C0 	1841
		STR 	48H 			//01C1 	10C8
		LDWI 	5H 			//01C2 	0005
		STR 	4AH 			//01C3 	10CA
		CLRF 	4BH 			//01C4 	11CB
		MOVLP 	5H 			//01C5 	0185
		LCALL 	5D1H 			//01C6 	35D1
		LDR 	49H, 0H 			//01C7 	1849
		STR 	25H 			//01C8 	10A5
		LDR 	48H, 0H 			//01C9 	1848
		STR 	24H 			//01CA 	10A4

		//;storage.c: 38: }
		//;storage.c: 40: USER_SET_VAL = DIS_NUM;
		LDR 	24H, 0H 			//01CB 	1824
		STR 	52H 			//01CC 	10D2
		RET 					//01CD 	1008
		STR 	42H 			//01CE 	10C2

		//;hardware.c: 135: GIE = 0;
		BCR 	BH, 7H 			//01CF 	238B

		//;hardware.c: 136: while (GIE) asm("clrwdt");
		BTSS 	BH, 7H 			//01D0 	2F8B
		LJUMP 	1D4H 			//01D1 	39D4
		CLRWDT 			//01D2 	1064
		LJUMP 	1D0H 			//01D3 	39D0

		//;hardware.c: 138: EEADRL = addr;
		MOVLB 	0H 			//01D4 	1020
		LDR 	42H, 0H 			//01D5 	1842
		MOVLB 	3H 			//01D6 	1023
		STR 	11H 			//01D7 	1091

		//;hardware.c: 139: EEDATL = data;
		MOVLB 	0H 			//01D8 	1020
		LDR 	41H, 0H 			//01D9 	1841
		MOVLB 	3H 			//01DA 	1023
		STR 	13H 			//01DB 	1093

		//;hardware.c: 140: CFGS = 0;
		BCR 	15H, 6H 			//01DC 	2315

		//;hardware.c: 141: EEPGD = 0;
		BCR 	15H, 7H 			//01DD 	2395

		//;hardware.c: 142: WREN = 1;
		BSR 	15H, 2H 			//01DE 	2515

		//;hardware.c: 143: EEIF = 0;
		BCR 	BH, 2H 			//01DF 	210B

		//;hardware.c: 144: EECON2 = 0x55;
		LDWI 	55H 			//01E0 	0055
		STR 	16H 			//01E1 	1096

		//;hardware.c: 145: EECON2 = 0xAA;
		LDWI 	AAH 			//01E2 	00AA
		STR 	16H 			//01E3 	1096

		//;hardware.c: 146: WR = 1;
		BSR 	15H, 1H 			//01E4 	2495

		//;hardware.c: 147: while (WR) asm("clrwdt");
		LJUMP 	1E7H 			//01E5 	39E7
		CLRWDT 			//01E6 	1064
		MOVLB 	3H 			//01E7 	1023
		BTSC 	15H, 1H 		//01E8 	2895
		LJUMP 	1E6H 			//01E9 	39E6

		//;hardware.c: 148: WREN = 0;
		BCR 	15H, 2H 			//01EA 	2115

		//;hardware.c: 150: GIE = 1;
		BSR 	BH, 7H 			//01EB 	278B
		RET 					//01EC 	1008
		MOVLB 	0H 			//01ED 	1020
		STR 	41H 			//01EE 	10C1

		//;hardware.c: 119: EEADRL = addr;
		MOVLB 	3H 			//01EF 	1023
		STR 	11H 			//01F0 	1091

		//;hardware.c: 120: CFGS = 0;
		BCR 	15H, 6H 			//01F1 	2315

		//;hardware.c: 121: EEPGD = 0;
		BCR 	15H, 7H 			//01F2 	2395

		//;hardware.c: 122: RD = 1;
		BSR 	15H, 0H 			//01F3 	2415

		//;hardware.c: 123: __nop();
		NOP 					//01F4 	1000

		//;hardware.c: 124: __nop();
		NOP 					//01F5 	1000

		//;hardware.c: 125: __nop();
		NOP 					//01F6 	1000

		//;hardware.c: 126: __nop();
		NOP 					//01F7 	1000

		//;hardware.c: 127: return EEDATL;
		MOVLB 	3H 			//01F8 	1023
		LDR 	13H, 0H 			//01F9 	1813
		RET 					//01FA 	1008

		//;display.c: 45: u16 val = DIS_NUM;
		LDR 	25H, 0H 			//01FB 	1825
		STR 	4CH 			//01FC 	10CC
		LDR 	24H, 0H 			//01FD 	1824
		STR 	4BH 			//01FE 	10CB

		//;display.c: 46: u8 bai, shi, ge;
		//;display.c: 48: if (val < 100) {
		LDWI 	0H 			//01FF 	0000
		SUBWR 	4CH, 0H 		//0200 	124C
		LDWI 	64H 			//0201 	0064
		BTSC 	3H, 2H 			//0202 	2903
		SUBWR 	4BH, 0H 		//0203 	124B
		BTSC 	3H, 0H 			//0204 	2803
		LJUMP 	21FH 			//0205 	3A1F

		//;display.c: 49: bai = 0x0A;
		LDWI 	AH 			//0206 	000A
		STR 	48H 			//0207 	10C8

		//;display.c: 50: shi = val / 10;
		LDWI 	AH 			//0208 	000A
		STR 	41H 			//0209 	10C1
		CLRF 	42H 			//020A 	11C2
		LDR 	4CH, 0H 			//020B 	184C
		STR 	44H 			//020C 	10C4
		LDR 	4BH, 0H 			//020D 	184B
		STR 	43H 			//020E 	10C3
		LCALL 	2A9H 			//020F 	32A9
		MOVLP 	0H 			//0210 	0180
		LDR 	41H, 0H 			//0211 	1841
		STR 	49H 			//0212 	10C9

		//;display.c: 51: ge = val % 10;
		LDWI 	AH 			//0213 	000A
		STR 	41H 			//0214 	10C1
		CLRF 	42H 			//0215 	11C2
		LDR 	4CH, 0H 			//0216 	184C
		STR 	44H 			//0217 	10C4
		LDR 	4BH, 0H 			//0218 	184B
		STR 	43H 			//0219 	10C3
		LCALL 	2CEH 			//021A 	32CE
		MOVLP 	0H 			//021B 	0180
		LDR 	41H, 0H 			//021C 	1841
		STR 	4AH 			//021D 	10CA

		//;display.c: 52: } else {
		LJUMP 	223H 			//021E 	3A23

		//;display.c: 53: bai = 1;
		CLRF 	48H 			//021F 	11C8
		INCR 	48H, 1H 		//0220 	1AC8

		//;display.c: 54: shi = 0;
		CLRF 	49H 			//0221 	11C9

		//;display.c: 55: ge = 0;
		CLRF 	4AH 			//0222 	11CA

		//;display.c: 56: }
		//;display.c: 59: (LATB6 = 1); (LATA7 = 1); (LATA6 = 1);
		//;display.c: 60: Seg_Set(bai);
		LCALL 	401H 			//0223 	3401
		MOVLP 	0H 			//0224 	0180
		LDR 	48H, 0H 			//0225 	1848
		LCALL 	24EH 			//0226 	324E
		MOVLP 	0H 			//0227 	0180

		//;display.c: 61: (LATB6 = 0); (LATA7 = 1); (LATA6 = 1);
		MOVLB 	2H 			//0228 	1022
		BCR 	DH, 6H 			//0229 	230D
		BSR 	CH, 7H 			//022A 	278C

		//;display.c: 62: DelayShort(8);
		LCALL 	40CH 			//022B 	340C
		MOVLP 	0H 			//022C 	0180
		LCALL 	28FH 			//022D 	328F
		MOVLP 	0H 			//022E 	0180

		//;display.c: 65: (LATB6 = 1); (LATA7 = 1); (LATA6 = 1);
		//;display.c: 66: Seg_Set(shi);
		LCALL 	401H 			//022F 	3401
		MOVLP 	0H 			//0230 	0180
		LDR 	49H, 0H 			//0231 	1849
		LCALL 	24EH 			//0232 	324E
		MOVLP 	0H 			//0233 	0180

		//;display.c: 67: (LATB6 = 1); (LATA7 = 0); (LATA6 = 1);
		MOVLB 	2H 			//0234 	1022
		BSR 	DH, 6H 			//0235 	270D
		BCR 	CH, 7H 			//0236 	238C

		//;display.c: 68: DelayShort(8);
		LCALL 	40CH 			//0237 	340C
		MOVLP 	0H 			//0238 	0180
		LCALL 	28FH 			//0239 	328F
		MOVLP 	0H 			//023A 	0180

		//;display.c: 71: (LATB6 = 1); (LATA7 = 1); (LATA6 = 1);
		//;display.c: 72: Seg_Set(ge);
		LCALL 	401H 			//023B 	3401
		MOVLP 	0H 			//023C 	0180
		LDR 	4AH, 0H 			//023D 	184A
		LCALL 	24EH 			//023E 	324E
		MOVLP 	0H 			//023F 	0180

		//;display.c: 73: (LATB6 = 1); (LATA7 = 1); (LATA6 = 0);
		MOVLB 	2H 			//0240 	1022
		BSR 	DH, 6H 			//0241 	270D
		BSR 	CH, 7H 			//0242 	278C
		BCR 	CH, 6H 			//0243 	230C

		//;display.c: 74: DelayShort(8);
		LDWI 	8H 			//0244 	0008
		MOVLB 	0H 			//0245 	1020
		STR 	41H 			//0246 	10C1
		CLRF 	42H 			//0247 	11C2
		LCALL 	28FH 			//0248 	328F

		//;display.c: 76: (LATB6 = 1); (LATA7 = 1); (LATA6 = 1);
		MOVLB 	2H 			//0249 	1022
		BSR 	DH, 6H 			//024A 	270D
		BSR 	CH, 7H 			//024B 	278C
		BSR 	CH, 6H 			//024C 	270C
		RET 					//024D 	1008
		STR 	41H 			//024E 	10C1

		//;display.c: 11: (LATB7 = 0); (LATA5 = 0); (LATA2 = 0); (LATB4 = 0);
		MOVLB 	2H 			//024F 	1022

		//;display.c: 12: (LATB3 = 0); (LATC1 = 0); (LATB0 = 0);
		LCALL 	3F9H 			//0250 	33F9
		MOVLP 	0H 			//0251 	0180

		//;display.c: 14: switch (digit) {
		LJUMP 	283H 			//0252 	3A83

		//;display.c: 15: case 0: (LATB7 = 1); (LATA5 = 1); (LATA2 = 1); (LATB4 = 1); (LATB3 = 1);
		//+                           (LATC1 = 1); break;
		LCALL 	3F3H 			//0253 	33F3
		BSR 	DH, 3H 			//0254 	258D
		BSR 	EH, 1H 			//0255 	248E
		RET 					//0256 	1008

		//;display.c: 16: case 1: (LATA5 = 1); (LATA2 = 1); break;
		MOVLB 	2H 			//0257 	1022
		BSR 	CH, 5H 			//0258 	268C
		BSR 	CH, 2H 			//0259 	250C
		RET 					//025A 	1008

		//;display.c: 17: case 2: (LATB7 = 1); (LATA5 = 1); (LATB4 = 1); (LATB3 = 1); (LATB0 = 1);
		//+                           break;
		MOVLB 	2H 			//025B 	1022
		BSR 	DH, 7H 			//025C 	278D
		BSR 	CH, 5H 			//025D 	268C
		BSR 	DH, 4H 			//025E 	260D
		BSR 	DH, 3H 			//025F 	258D
		BSR 	DH, 0H 			//0260 	240D
		RET 					//0261 	1008

		//;display.c: 18: case 3: (LATB7 = 1); (LATA5 = 1); (LATA2 = 1); (LATB4 = 1); (LATB0 = 1);
		//+                           break;
		LCALL 	3F3H 			//0262 	33F3
		BSR 	DH, 0H 			//0263 	240D
		RET 					//0264 	1008

		//;display.c: 19: case 4: (LATA5 = 1); (LATA2 = 1); (LATC1 = 1); (LATB0 = 1); break;
		MOVLB 	2H 			//0265 	1022
		BSR 	CH, 5H 			//0266 	268C
		BSR 	CH, 2H 			//0267 	250C
		BSR 	EH, 1H 			//0268 	248E
		BSR 	DH, 0H 			//0269 	240D
		RET 					//026A 	1008

		//;display.c: 20: case 5: (LATB7 = 1); (LATA2 = 1); (LATB4 = 1); (LATC1 = 1); (LATB0 = 1);
		//+                           break;
		MOVLB 	2H 			//026B 	1022
		BSR 	DH, 7H 			//026C 	278D
		BSR 	CH, 2H 			//026D 	250C
		BSR 	DH, 4H 			//026E 	260D
		BSR 	EH, 1H 			//026F 	248E
		BSR 	DH, 0H 			//0270 	240D
		RET 					//0271 	1008

		//;display.c: 21: case 6: (LATB7 = 1); (LATA2 = 1); (LATB4 = 1); (LATB3 = 1); (LATC1 = 1);
		//+                           (LATB0 = 1); break;
		MOVLB 	2H 			//0272 	1022
		BSR 	DH, 7H 			//0273 	278D
		BSR 	CH, 2H 			//0274 	250C
		BSR 	DH, 4H 			//0275 	260D
		LJUMP 	412H 			//0276 	3C12

		//;display.c: 22: case 7: (LATB7 = 1); (LATA5 = 1); (LATA2 = 1); break;
		MOVLB 	2H 			//0277 	1022
		BSR 	DH, 7H 			//0278 	278D
		BSR 	CH, 5H 			//0279 	268C
		BSR 	CH, 2H 			//027A 	250C
		RET 					//027B 	1008

		//;display.c: 23: case 8: (LATB7 = 1); (LATA5 = 1); (LATA2 = 1); (LATB4 = 1); (LATB3 = 1);
		//+                           (LATC1 = 1); (LATB0 = 1); break;
		LCALL 	3F3H 			//027C 	33F3
		MOVLP 	0H 			//027D 	0180
		LJUMP 	412H 			//027E 	3C12

		//;display.c: 24: case 9: (LATB7 = 1); (LATA5 = 1); (LATA2 = 1); (LATB4 = 1); (LATC1 = 1);
		//+                           (LATB0 = 1); break;
		LCALL 	3F3H 			//027F 	33F3
		BSR 	EH, 1H 			//0280 	248E
		BSR 	DH, 0H 			//0281 	240D
		RET 					//0282 	1008
		MOVLB 	0H 			//0283 	1020
		LDR 	41H, 0H 			//0284 	1841
		STR 	4H 			//0285 	1084
		LDWI 	AH 			//0286 	000A
		SUBWR 	4H, 0H 		//0287 	1204
		BTSC 	3H, 0H 			//0288 	2803
		RET 					//0289 	1008
		MOVLP 	5H 			//028A 	0185
		LSLF 	4H, 0H 			//028B 	0504
		ADDWI 	E6H 			//028C 	0EE6
		STR 	2H 			//028D 	1082
		RET 					//028E 	1008

		//;display.c: 34: u16 i, j;
		//;display.c: 35: for (i = 0; i < n; i++)
		CLRF 	43H 			//028F 	11C3
		CLRF 	44H 			//0290 	11C4
		LDR 	42H, 0H 			//0291 	1842
		SUBWR 	44H, 0H 		//0292 	1244
		BTSS 	3H, 2H 			//0293 	2D03
		LJUMP 	297H 			//0294 	3A97
		LDR 	41H, 0H 			//0295 	1841
		SUBWR 	43H, 0H 		//0296 	1243
		BTSC 	3H, 0H 			//0297 	2803
		RET 					//0298 	1008

		//;display.c: 36: for (j = 0; j < 50; j++);
		CLRF 	45H 			//0299 	11C5
		CLRF 	46H 			//029A 	11C6
		INCR 	45H, 1H 		//029B 	1AC5
		BTSC 	3H, 2H 			//029C 	2903
		INCR 	46H, 1H 		//029D 	1AC6
		LDWI 	0H 			//029E 	0000
		SUBWR 	46H, 0H 		//029F 	1246
		LDWI 	32H 			//02A0 	0032
		BTSC 	3H, 2H 			//02A1 	2903
		SUBWR 	45H, 0H 		//02A2 	1245
		BTSS 	3H, 0H 			//02A3 	2C03
		LJUMP 	29BH 			//02A4 	3A9B
		INCR 	43H, 1H 		//02A5 	1AC3
		BTSC 	3H, 2H 			//02A6 	2903
		INCR 	44H, 1H 		//02A7 	1AC4
		LJUMP 	291H 			//02A8 	3A91
		CLRF 	45H 			//02A9 	11C5
		CLRF 	46H 			//02AA 	11C6
		LDR 	41H, 0H 			//02AB 	1841
		IORWR 	42H, 0H 		//02AC 	1442
		BTSC 	3H, 2H 			//02AD 	2903
		LJUMP 	2C9H 			//02AE 	3AC9
		CLRF 	47H 			//02AF 	11C7
		INCR 	47H, 1H 		//02B0 	1AC7
		BTSC 	42H, 7H 		//02B1 	2BC2
		LJUMP 	2B6H 			//02B2 	3AB6
		LSLF 	41H, 1H 		//02B3 	05C1
		RLR 	42H, 1H 			//02B4 	1DC2
		LJUMP 	2B0H 			//02B5 	3AB0
		LSLF 	45H, 1H 		//02B6 	05C5
		RLR 	46H, 1H 			//02B7 	1DC6
		LDR 	42H, 0H 			//02B8 	1842
		SUBWR 	44H, 0H 		//02B9 	1244
		BTSS 	3H, 2H 			//02BA 	2D03
		LJUMP 	2BEH 			//02BB 	3ABE
		LDR 	41H, 0H 			//02BC 	1841
		SUBWR 	43H, 0H 		//02BD 	1243
		BTSS 	3H, 0H 			//02BE 	2C03
		LJUMP 	2C5H 			//02BF 	3AC5
		LDR 	41H, 0H 			//02C0 	1841
		SUBWR 	43H, 1H 		//02C1 	12C3
		LDR 	42H, 0H 			//02C2 	1842
		SUBWFB 	44H, 1H 		//02C3 	0BC4
		BSR 	45H, 0H 			//02C4 	2445
		LSRF 	42H, 1H 		//02C5 	06C2
		RRR 	41H, 1H 			//02C6 	1CC1
		DECRSZ 	47H, 1H 		//02C7 	1BC7
		LJUMP 	2B6H 			//02C8 	3AB6
		LDR 	46H, 0H 			//02C9 	1846
		STR 	42H 			//02CA 	10C2
		LDR 	45H, 0H 			//02CB 	1845
		STR 	41H 			//02CC 	10C1
		RET 					//02CD 	1008
		LDR 	41H, 0H 			//02CE 	1841
		IORWR 	42H, 0H 		//02CF 	1442
		BTSC 	3H, 2H 			//02D0 	2903
		LJUMP 	2E9H 			//02D1 	3AE9
		CLRF 	45H 			//02D2 	11C5
		INCR 	45H, 1H 		//02D3 	1AC5
		BTSC 	42H, 7H 		//02D4 	2BC2
		LJUMP 	2D9H 			//02D5 	3AD9
		LSLF 	41H, 1H 		//02D6 	05C1
		RLR 	42H, 1H 			//02D7 	1DC2
		LJUMP 	2D3H 			//02D8 	3AD3
		LDR 	42H, 0H 			//02D9 	1842
		SUBWR 	44H, 0H 		//02DA 	1244
		BTSS 	3H, 2H 			//02DB 	2D03
		LJUMP 	2DFH 			//02DC 	3ADF
		LDR 	41H, 0H 			//02DD 	1841
		SUBWR 	43H, 0H 		//02DE 	1243
		BTSS 	3H, 0H 			//02DF 	2C03
		LJUMP 	2E5H 			//02E0 	3AE5
		LDR 	41H, 0H 			//02E1 	1841
		SUBWR 	43H, 1H 		//02E2 	12C3
		LDR 	42H, 0H 			//02E3 	1842
		SUBWFB 	44H, 1H 		//02E4 	0BC4
		LSRF 	42H, 1H 		//02E5 	06C2
		RRR 	41H, 1H 			//02E6 	1CC1
		DECRSZ 	45H, 1H 		//02E7 	1BC5
		LJUMP 	2D9H 			//02E8 	3AD9
		LDR 	44H, 0H 			//02E9 	1844
		STR 	42H 			//02EA 	10C2
		LDR 	43H, 0H 			//02EB 	1843
		STR 	41H 			//02EC 	10C1
		RET 					//02ED 	1008

		//;hardware.c: 11: OSCCON = 0B01110001;
		LDWI 	71H 			//02EE 	0071
		MOVLB 	1H 			//02EF 	1021
		STR 	19H 			//02F0 	1099

		//;hardware.c: 12: MISC0 = 0B00000000;
		MOVLB 	3H 			//02F1 	1023
		CLRF 	1DH 			//02F2 	119D

		//;hardware.c: 13: WDTCON = 0B00001011;
		LDWI 	BH 			//02F3 	000B
		MOVLB 	1H 			//02F4 	1021
		STR 	17H 			//02F5 	1097

		//;hardware.c: 14: INTCON = 0B00000000;
		CLRF 	BH 			//02F6 	118B

		//;hardware.c: 17: ANSELA = 0B00000001;
		LDWI 	1H 			//02F7 	0001
		MOVLB 	3H 			//02F8 	1023
		STR 	17H 			//02F9 	1097

		//;hardware.c: 18: PORTA = 0B00000000;
		MOVLB 	0H 			//02FA 	1020
		CLRF 	CH 			//02FB 	118C

		//;hardware.c: 19: TRISA = 0B00010010;
		LDWI 	12H 			//02FC 	0012
		MOVLB 	1H 			//02FD 	1021
		STR 	CH 			//02FE 	108C

		//;hardware.c: 20: WPUA = 0B00010010;
		MOVLB 	3H 			//02FF 	1023
		STR 	CH 			//0300 	108C

		//;hardware.c: 21: WPDA = 0B00000000;
		MOVLB 	4H 			//0301 	1024
		CLRF 	CH 			//0302 	118C

		//;hardware.c: 24: PORTB = 0B00000000;
		MOVLB 	0H 			//0303 	1020
		CLRF 	DH 			//0304 	118D

		//;hardware.c: 25: TRISB = 0B00100110;
		LDWI 	26H 			//0305 	0026
		MOVLB 	1H 			//0306 	1021
		STR 	DH 			//0307 	108D

		//;hardware.c: 26: WPUB = 0B00100100;
		LDWI 	24H 			//0308 	0024
		MOVLB 	3H 			//0309 	1023
		STR 	DH 			//030A 	108D

		//;hardware.c: 27: WPDB = 0B00000000;
		MOVLB 	4H 			//030B 	1024
		CLRF 	DH 			//030C 	118D

		//;hardware.c: 30: PORTC = 0B00000000;
		MOVLB 	0H 			//030D 	1020
		CLRF 	EH 			//030E 	118E

		//;hardware.c: 31: TRISC = 0B00000001;
		LDWI 	1H 			//030F 	0001
		MOVLB 	1H 			//0310 	1021
		STR 	EH 			//0311 	108E

		//;hardware.c: 32: WPUC = 0B00000001;
		MOVLB 	3H 			//0312 	1023
		STR 	EH 			//0313 	108E

		//;hardware.c: 33: WPDC = 0B00000000;
		MOVLB 	4H 			//0314 	1024
		CLRF 	EH 			//0315 	118E

		//;hardware.c: 36: PSRC0 = 0B11111111;
		LDWI 	FFH 			//0316 	00FF
		MOVLB 	2H 			//0317 	1022
		STR 	1AH 			//0318 	109A

		//;hardware.c: 37: PSRC1 = 0B11111111;
		STR 	1BH 			//0319 	109B

		//;hardware.c: 38: PSRC2 = 0B00001111;
		LDWI 	FH 			//031A 	000F
		STR 	1CH 			//031B 	109C

		//;hardware.c: 39: PSINK0 = 0B11111111;
		LDWI 	FFH 			//031C 	00FF
		MOVLB 	3H 			//031D 	1023
		STR 	1AH 			//031E 	109A

		//;hardware.c: 40: PSINK1 = 0B11111111;
		STR 	1BH 			//031F 	109B

		//;hardware.c: 41: PSINK2 = 0B11111111;
		STR 	1CH 			//0320 	109C
		RET 					//0321 	1008

		//;display.c: 84: (LATB6 = 1); (LATA7 = 1); (LATA6 = 1);
		MOVLB 	2H 			//0322 	1022
		BSR 	DH, 6H 			//0323 	270D
		BSR 	CH, 7H 			//0324 	278C
		BSR 	CH, 6H 			//0325 	270C

		//;display.c: 86: (LATB7 = 0); (LATA5 = 0); (LATA2 = 0); (LATB4 = 0);
		//;display.c: 87: (LATB3 = 0); (LATC1 = 0); (LATB0 = 0);
		LCALL 	3F9H 			//0326 	33F9
		RET 					//0327 	1008

		//;hardware.c: 109: EPS0 = 0B00000000;
		MOVLB 	2H 			//0328 	1022
		CLRF 	18H 			//0329 	1198

		//;hardware.c: 110: ITYPE0 = 0B00001000;
		LDWI 	8H 			//032A 	0008
		STR 	1EH 			//032B 	109E

		//;hardware.c: 111: EPIE0 = 0B00000010;
		LDWI 	2H 			//032C 	0002
		MOVLB 	1H 			//032D 	1021
		STR 	14H 			//032E 	1094
		RET 					//032F 	1008

		//;ir.c: 93: if (IR_OK == 0) return;
		MOVLB 	0H 			//0330 	1020
		LDR 	32H, 0H 			//0331 	1832
		BTSC 	3H, 2H 			//0332 	2903
		RET 					//0333 	1008

		//;ir.c: 95: IR_OK = 0;
		CLRF 	32H 			//0334 	11B2

		//;ir.c: 96: Buzzer_Beep();
		LCALL 	11CH 			//0335 	311C
		MOVLP 	0H 			//0336 	0180

		//;ir.c: 98: switch (IR_code) {
		LJUMP 	34CH 			//0337 	3B4C

		//;ir.c: 100: KeyPress = 0x01;
		LDWI 	1H 			//0338 	0001
		LJUMP 	33DH 			//0339 	3B3D

		//;ir.c: 101: break;
		//;ir.c: 104: KeyPress = 0x02;
		LDWI 	2H 			//033A 	0002
		LJUMP 	33DH 			//033B 	3B3D

		//;ir.c: 105: break;
		//;ir.c: 108: KeyPress = 0x03;
		LDWI 	3H 			//033C 	0003
		STR 	39H 			//033D 	10B9

		//;ir.c: 109: break;
		LJUMP 	366H 			//033E 	3B66

		//;ir.c: 112: DIS_NUM = 20;
		LDWI 	14H 			//033F 	0014
		LJUMP 	348H 			//0340 	3B48

		//;ir.c: 114: break;
		//;ir.c: 113: USER_SET_VAL = 20;
		//;ir.c: 117: DIS_NUM = 40;
		LDWI 	28H 			//0341 	0028
		LJUMP 	348H 			//0342 	3B48

		//;ir.c: 119: break;
		//;ir.c: 118: USER_SET_VAL = 40;
		//;ir.c: 122: DIS_NUM = 60;
		LDWI 	3CH 			//0343 	003C
		LJUMP 	348H 			//0344 	3B48

		//;ir.c: 124: break;
		//;ir.c: 123: USER_SET_VAL = 60;
		//;ir.c: 127: DIS_NUM = 80;
		LDWI 	50H 			//0345 	0050
		LJUMP 	348H 			//0346 	3B48

		//;ir.c: 129: break;
		//;ir.c: 128: USER_SET_VAL = 80;
		//;ir.c: 132: DIS_NUM = 100;
		LDWI 	64H 			//0347 	0064
		STR 	24H 			//0348 	10A4
		CLRF 	25H 			//0349 	11A5

		//;ir.c: 133: USER_SET_VAL = 100;
		STR 	52H 			//034A 	10D2

		//;ir.c: 134: break;
		LJUMP 	366H 			//034B 	3B66
		LDR 	31H, 0H 			//034C 	1831
		XORWI 	1H 			//034D 	0A01
		BTSC 	3H, 2H 			//034E 	2903
		LJUMP 	338H 			//034F 	3B38
		XORWI 	5H 			//0350 	0A05
		BTSC 	3H, 2H 			//0351 	2903
		LJUMP 	33CH 			//0352 	3B3C
		XORWI 	2H 			//0353 	0A02
		BTSC 	3H, 2H 			//0354 	2903
		LJUMP 	33AH 			//0355 	3B3A
		XORWI 	FH 			//0356 	0A0F
		BTSC 	3H, 2H 			//0357 	2903
		LJUMP 	347H 			//0358 	3B47
		XORWI 	5H 			//0359 	0A05
		BTSC 	3H, 2H 			//035A 	2903
		LJUMP 	341H 			//035B 	3B41
		XORWI 	2H 			//035C 	0A02
		BTSC 	3H, 2H 			//035D 	2903
		LJUMP 	343H 			//035E 	3B43
		XORWI 	1AH 			//035F 	0A1A
		BTSC 	3H, 2H 			//0360 	2903
		LJUMP 	345H 			//0361 	3B45
		XORWI 	2H 			//0362 	0A02
		BTSC 	3H, 2H 			//0363 	2903
		LJUMP 	33FH 			//0364 	3B3F
		LJUMP 	366H 			//0365 	3B66

		//;ir.c: 140: IR_code = 0;
		CLRF 	31H 			//0366 	11B1
		RET 					//0367 	1008

		//;key.c: 12: static u16 key_time = 0;
		//;key.c: 13: static u8 state = 0;
		//;key.c: 14: static u8 temp = 0;
		//;key.c: 15: static u8 temp2 = 0;
		//;key.c: 16: static u8 confirmed = 0;
		//;key.c: 18: switch (state) {
		LJUMP 	3C2H 			//0368 	3BC2

		//;key.c: 20: case 0:
		//;key.c: 21: RB2 = 1;
		BSR 	DH, 2H 			//0369 	250D

		//;key.c: 22: RB5 = 1;
		BSR 	DH, 5H 			//036A 	268D

		//;key.c: 24: if (RB2 == 0) temp = 0x01;
		BTSC 	DH, 2H 			//036B 	290D
		LJUMP 	370H 			//036C 	3B70
		CLRF 	28H 			//036D 	11A8
		INCR 	28H, 1H 		//036E 	1AA8
		LJUMP 	37AH 			//036F 	3B7A

		//;key.c: 25: else if (RB5 == 0) temp = 0x03;
		BTSC 	DH, 5H 			//0370 	2A8D
		LJUMP 	374H 			//0371 	3B74
		LDWI 	3H 			//0372 	0003
		LJUMP 	377H 			//0373 	3B77

		//;key.c: 26: else if (RA4 == 0) temp = 0x02;
		BTSC 	CH, 4H 			//0374 	2A0C
		LJUMP 	379H 			//0375 	3B79
		LDWI 	2H 			//0376 	0002
		STR 	28H 			//0377 	10A8
		LJUMP 	37AH 			//0378 	3B7A

		//;key.c: 27: else temp = 0;
		CLRF 	28H 			//0379 	11A8

		//;key.c: 29: if (temp != 0) state = 1;
		LDR 	28H, 0H 			//037A 	1828
		BTSC 	3H, 2H 			//037B 	2903
		RET 					//037C 	1008
		CLRF 	29H 			//037D 	11A9
		INCR 	29H, 1H 		//037E 	1AA9
		RET 					//037F 	1008

		//;key.c: 32: case 1:
		//;key.c: 33: RB2 = 1;
		BSR 	DH, 2H 			//0380 	250D

		//;key.c: 34: RB5 = 1;
		BSR 	DH, 5H 			//0381 	268D

		//;key.c: 36: if (RB2 == 0) temp2 = 0x01;
		BTSC 	DH, 2H 			//0382 	290D
		LJUMP 	387H 			//0383 	3B87
		CLRF 	27H 			//0384 	11A7
		INCR 	27H, 1H 		//0385 	1AA7
		LJUMP 	391H 			//0386 	3B91

		//;key.c: 37: else if (RB5 == 0) temp2 = 0x03;
		BTSC 	DH, 5H 			//0387 	2A8D
		LJUMP 	38BH 			//0388 	3B8B
		LDWI 	3H 			//0389 	0003
		LJUMP 	38EH 			//038A 	3B8E

		//;key.c: 38: else if (RA4 == 0) temp2 = 0x02;
		BTSC 	CH, 4H 			//038B 	2A0C
		LJUMP 	390H 			//038C 	3B90
		LDWI 	2H 			//038D 	0002
		STR 	27H 			//038E 	10A7
		LJUMP 	391H 			//038F 	3B91

		//;key.c: 39: else temp2 = 0;
		CLRF 	27H 			//0390 	11A7

		//;key.c: 41: if (temp2 == temp) {
		LDR 	27H, 0H 			//0391 	1827
		XORWR 	28H, 0H 		//0392 	1628
		BTSS 	3H, 2H 			//0393 	2D03
		LJUMP 	39AH 			//0394 	3B9A

		//;key.c: 42: confirmed = temp2;
		LDR 	27H, 0H 			//0395 	1827
		STR 	26H 			//0396 	10A6

		//;key.c: 43: state = 2;
		LDWI 	2H 			//0397 	0002
		STR 	29H 			//0398 	10A9

		//;key.c: 44: } else {
		RET 					//0399 	1008

		//;key.c: 45: state = 0;
		CLRF 	29H 			//039A 	11A9
		RET 					//039B 	1008

		//;key.c: 49: case 2:
		//;key.c: 50: RB2 = 1;
		BSR 	DH, 2H 			//039C 	250D

		//;key.c: 51: RB5 = 1;
		BSR 	DH, 5H 			//039D 	268D

		//;key.c: 53: if (RB2 == 0) temp2 = 0x01;
		BTSC 	DH, 2H 			//039E 	290D
		LJUMP 	3A3H 			//039F 	3BA3
		CLRF 	27H 			//03A0 	11A7
		INCR 	27H, 1H 		//03A1 	1AA7
		LJUMP 	3ADH 			//03A2 	3BAD

		//;key.c: 54: else if (RB5 == 0) temp2 = 0x03;
		BTSC 	DH, 5H 			//03A3 	2A8D
		LJUMP 	3A7H 			//03A4 	3BA7
		LDWI 	3H 			//03A5 	0003
		LJUMP 	3AAH 			//03A6 	3BAA

		//;key.c: 55: else if (RA4 == 0) temp2 = 0x02;
		BTSC 	CH, 4H 			//03A7 	2A0C
		LJUMP 	3ACH 			//03A8 	3BAC
		LDWI 	2H 			//03A9 	0002
		STR 	27H 			//03AA 	10A7
		LJUMP 	3ADH 			//03AB 	3BAD

		//;key.c: 56: else temp2 = 0;
		CLRF 	27H 			//03AC 	11A7

		//;key.c: 58: if (temp2 != 0) {
		LDR 	27H, 0H 			//03AD 	1827
		BTSC 	3H, 2H 			//03AE 	2903
		LJUMP 	3BDH 			//03AF 	3BBD

		//;key.c: 60: if (temp2 != 0x01) {
		DECR 	27H, 0H 		//03B0 	1327
		BTSC 	3H, 2H 			//03B1 	2903
		RET 					//03B2 	1008

		//;key.c: 62: if (++key_time >= 6) {
		INCR 	20H, 1H 		//03B3 	1AA0
		BTSC 	3H, 2H 			//03B4 	2903
		INCR 	21H, 1H 		//03B5 	1AA1
		LDWI 	0H 			//03B6 	0000
		SUBWR 	21H, 0H 		//03B7 	1221
		LDWI 	6H 			//03B8 	0006
		BTSC 	3H, 2H 			//03B9 	2903
		SUBWR 	20H, 0H 		//03BA 	1220
		BTSS 	3H, 0H 			//03BB 	2C03
		RET 					//03BC 	1008

		//;key.c: 63: key_time = 0;
		CLRF 	20H 			//03BD 	11A0
		CLRF 	21H 			//03BE 	11A1

		//;key.c: 64: KeyPress = confirmed;
		LDR 	26H, 0H 			//03BF 	1826
		STR 	39H 			//03C0 	10B9
		LJUMP 	39AH 			//03C1 	3B9A
		LDR 	29H, 0H 			//03C2 	1829
		XORWI 	0H 			//03C3 	0A00
		BTSC 	3H, 2H 			//03C4 	2903
		LJUMP 	369H 			//03C5 	3B69
		XORWI 	1H 			//03C6 	0A01
		BTSC 	3H, 2H 			//03C7 	2903
		LJUMP 	380H 			//03C8 	3B80
		XORWI 	3H 			//03C9 	0A03
		BTSC 	3H, 2H 			//03CA 	2903
		LJUMP 	39CH 			//03CB 	3B9C
		LJUMP 	3CDH 			//03CC 	3BCD
		RET 					//03CD 	1008

		//;hardware.c: 67: TIM1EN = 1;
		MOVLB 	1H 			//03CE 	1021
		BSR 	1AH, 1H 			//03CF 	249A

		//;hardware.c: 68: CKOCON = 0B00100000;
		LDWI 	20H 			//03D0 	0020
		STR 	15H 			//03D1 	1095

		//;hardware.c: 69: TCKSRC = 0B00000000;
		MOVLB 	6H 			//03D2 	1026
		CLRF 	1FH 			//03D3 	119F

		//;hardware.c: 70: TIM1CR1 = 0B10000100;
		LDWI 	84H 			//03D4 	0084
		MOVLB 	4H 			//03D5 	1024
		STR 	11H 			//03D6 	1091

		//;hardware.c: 71: TIM1PSCRH = 0B00000000;
		MOVLB 	5H 			//03D7 	1025
		CLRF 	EH 			//03D8 	118E

		//;hardware.c: 72: TIM1PSCRL = 0B00000111;
		LDWI 	7H 			//03D9 	0007
		STR 	FH 			//03DA 	108F

		//;hardware.c: 73: TIM1CNTRH = 0;
		CLRF 	CH 			//03DB 	118C

		//;hardware.c: 74: TIM1CNTRL = 0;
		CLRF 	DH 			//03DC 	118D

		//;hardware.c: 75: TIM1ARRH = 0x01;
		LDWI 	1H 			//03DD 	0001
		STR 	10H 			//03DE 	1090

		//;hardware.c: 76: TIM1ARRL = 0xF4;
		LDWI 	F4H 			//03DF 	00F4
		STR 	11H 			//03E0 	1091

		//;hardware.c: 77: TIM1IER = 0B00000001;
		LDWI 	1H 			//03E1 	0001
		MOVLB 	4H 			//03E2 	1024
		STR 	15H 			//03E3 	1095

		//;hardware.c: 78: TIM1SR1 = 0B00000000;
		CLRF 	16H 			//03E4 	1196

		//;hardware.c: 79: TIM1SR2 = 0B00000000;
		CLRF 	17H 			//03E5 	1197

		//;hardware.c: 80: TIM1EGR = 0B00000000;
		CLRF 	18H 			//03E6 	1198

		//;hardware.c: 81: T1CEN = 1;
		BSR 	11H, 0H 			//03E7 	2411
		RET 					//03E8 	1008
		STR 	43H 			//03E9 	10C3
		LDWI 	4H 			//03EA 	0004
		CLRF 	44H 			//03EB 	11C4
		ADDWR 	43H, 1H 		//03EC 	17C3
		BTSC 	3H, 0H 			//03ED 	2803
		INCR 	44H, 1H 		//03EE 	1AC4
		LDWI 	5H 			//03EF 	0005
		STR 	41H 			//03F0 	10C1
		CLRF 	42H 			//03F1 	11C2
		RET 					//03F2 	1008
		MOVLB 	2H 			//03F3 	1022
		BSR 	DH, 7H 			//03F4 	278D
		BSR 	CH, 5H 			//03F5 	268C
		BSR 	CH, 2H 			//03F6 	250C
		BSR 	DH, 4H 			//03F7 	260D
		RET 					//03F8 	1008
		BCR 	DH, 7H 			//03F9 	238D
		BCR 	CH, 5H 			//03FA 	228C
		BCR 	CH, 2H 			//03FB 	210C
		BCR 	DH, 4H 			//03FC 	220D
		BCR 	DH, 3H 			//03FD 	218D
		BCR 	EH, 1H 			//03FE 	208E
		BCR 	DH, 0H 			//03FF 	200D
		RET 					//0400 	1008
		MOVLB 	2H 			//0401 	1022
		BSR 	DH, 6H 			//0402 	270D
		BSR 	CH, 7H 			//0403 	278C
		BSR 	CH, 6H 			//0404 	270C
		MOVLB 	0H 			//0405 	1020
		RET 					//0406 	1008
		BCR 	CH, 0H 			//0407 	200C
		MOVLB 	6H 			//0408 	1026
		BCR 	CH, 0H 			//0409 	200C
		CLRF 	DH 			//040A 	118D
		RET 					//040B 	1008
		BSR 	CH, 6H 			//040C 	270C
		LDWI 	8H 			//040D 	0008
		MOVLB 	0H 			//040E 	1020
		STR 	41H 			//040F 	10C1
		CLRF 	42H 			//0410 	11C2
		RET 					//0411 	1008
		BSR 	DH, 3H 			//0412 	258D
		BSR 	EH, 1H 			//0413 	248E
		BSR 	DH, 0H 			//0414 	240D
		RET 					//0415 	1008

		//;hardware.c: 91: TIM2EN = 1;
		MOVLB 	1H 			//0416 	1021
		BSR 	1AH, 2H 			//0417 	251A

		//;hardware.c: 92: T2CEN = 0;
		MOVLB 	6H 			//0418 	1026
		BCR 	CH, 0H 			//0419 	200C

		//;hardware.c: 93: T2UIF = 1;
		BSR 	EH, 0H 			//041A 	240E

		//;hardware.c: 94: CKOCON = 0B00100000;
		LDWI 	20H 			//041B 	0020
		MOVLB 	1H 			//041C 	1021
		STR 	15H 			//041D 	1095

		//;hardware.c: 95: TCKSRC = 0B00000000;
		MOVLB 	6H 			//041E 	1026
		CLRF 	1FH 			//041F 	119F

		//;hardware.c: 96: TIM2CR1 = 0B10000100;
		LDWI 	84H 			//0420 	0084
		STR 	CH 			//0421 	108C

		//;hardware.c: 97: TIM2PSCR = 0B00000010;
		LDWI 	2H 			//0422 	0002
		STR 	18H 			//0423 	1098

		//;hardware.c: 98: TIM2CNTRH = 0;
		CLRF 	16H 			//0424 	1196

		//;hardware.c: 99: TIM2CNTRL = 0;
		CLRF 	17H 			//0425 	1197

		//;hardware.c: 100: TIM2SR1 = 0B00000000;
		CLRF 	EH 			//0426 	118E

		//;hardware.c: 101: TIM2EGR = 0B00000000;
		CLRF 	10H 			//0427 	1190
		RET 					//0428 	1008
		CLRWDT 			//0429 	1064

		//;isr.c: 45: if (T1UIE && T1UIF) {
		MOVLB 	4H 			//042A 	1024
		BTSC 	15H, 0H 		//042B 	2815
		BTSS 	16H, 0H 		//042C 	2C16
		LJUMP 	433H 			//042D 	3C33

		//;isr.c: 46: T1UIF = 1;
		BSR 	16H, 0H 			//042E 	2416

		//;isr.c: 47: IR_Sample();
		LCALL 	482H 			//042F 	3482
		MOVLP 	4H 			//0430 	0184

		//;isr.c: 48: Buzzer_Toggle();
		LCALL 	472H 			//0431 	3472
		MOVLP 	4H 			//0432 	0184

		//;isr.c: 49: }
		//;isr.c: 52: if (T4UIE && T4UIF) {
		MOVLB 	2H 			//0433 	1022
		BTSC 	12H, 0H 		//0434 	2812
		BTSS 	13H, 0H 		//0435 	2C13
		LJUMP 	44BH 			//0436 	3C4B

		//;isr.c: 53: T4UIF = 1;
		BSR 	13H, 0H 			//0437 	2413

		//;isr.c: 54: key_count++;
		MOVLB 	0H 			//0438 	1020
		INCR 	38H, 1H 		//0439 	1AB8

		//;isr.c: 55: if (DIAO_DIAN < 50) DIAO_DIAN++;
		LDWI 	32H 			//043A 	0032
		SUBWR 	34H, 0H 		//043B 	1234
		BTSS 	3H, 0H 			//043C 	2C03
		INCR 	34H, 1H 		//043D 	1AB4

		//;isr.c: 56: Buzzer_Tick();
		LCALL 	465H 			//043E 	3465
		MOVLP 	4H 			//043F 	0184

		//;isr.c: 57: if (SOFT == 1) {
		MOVLB 	0H 			//0440 	1020
		DECRSZ 	3DH, 0H 		//0441 	1B3D
		LJUMP 	44BH 			//0442 	3C4B

		//;isr.c: 58: soft_start_timer++;
		INCR 	3AH, 1H 		//0443 	1ABA

		//;isr.c: 59: if (soft_start_timer >= 50) {
		LDWI 	32H 			//0444 	0032
		SUBWR 	3AH, 0H 		//0445 	123A
		BTSS 	3H, 0H 			//0446 	2C03
		LJUMP 	44BH 			//0447 	3C4B

		//;isr.c: 60: soft_start_timer = 0;
		CLRF 	3AH 			//0448 	11BA

		//;isr.c: 61: SoftStart_Process();
		LCALL 	571H 			//0449 	3571
		MOVLP 	4H 			//044A 	0184

		//;isr.c: 62: }
		//;isr.c: 63: }
		//;isr.c: 64: }
		//;isr.c: 67: if ((EPIE0 & 0x02) && (EPIF0 & 0x02)) {
		MOVLB 	1H 			//044B 	1021
		BTSS 	14H, 1H 		//044C 	2C94
		LJUMP 	456H 			//044D 	3C56
		MOVLB 	0H 			//044E 	1020
		BTSS 	14H, 1H 		//044F 	2C94
		LJUMP 	456H 			//0450 	3C56

		//;isr.c: 68: DIAO_DIAN = 0;
		CLRF 	34H 			//0451 	11B4

		//;isr.c: 69: power_loss_saved = 0;
		CLRF 	33H 			//0452 	11B3

		//;isr.c: 70: EPIF0 |= 0B00000010;
		BSR 	14H, 1H 			//0453 	2494

		//;isr.c: 71: SCR_OnZeroCross();
		LCALL 	4CAH 			//0454 	34CA
		MOVLP 	4H 			//0455 	0184

		//;isr.c: 72: }
		//;isr.c: 75: if (T2UIE && T2UIF) {
		MOVLB 	6H 			//0456 	1026
		BTSC 	DH, 0H 			//0457 	280D
		BTSS 	EH, 0H 			//0458 	2C0E
		RET 					//0459 	1008

		//;isr.c: 76: T2UIF = 1;
		BSR 	EH, 0H 			//045A 	240E

		//;isr.c: 77: T2CEN = 0;
		BCR 	CH, 0H 			//045B 	200C

		//;isr.c: 78: (LATA0 = 1);
		MOVLB 	2H 			//045C 	1022
		BSR 	CH, 0H 			//045D 	240C

		//;isr.c: 79: _delay((unsigned long)((20)*(32000000/4000000.0)));
		LDWI 	35H 			//045E 	0035
		DECRSZ 	9H, 1H 		//045F 	1B89
		LJUMP 	45FH 			//0460 	3C5F
		NOP 					//0461 	1000

		//;isr.c: 80: (LATA0 = 0);
		MOVLB 	2H 			//0462 	1022
		BCR 	CH, 0H 			//0463 	200C
		RET 					//0464 	1008

		//;buzzer.c: 62: if (!buzzer_flag) return;
		LDR 	36H, 0H 			//0465 	1836
		BTSC 	3H, 2H 			//0466 	2903
		RET 					//0467 	1008

		//;buzzer.c: 64: buzzer_count++;
		INCR 	35H, 1H 		//0468 	1AB5

		//;buzzer.c: 65: if (buzzer_count >= 50) {
		LDWI 	32H 			//0469 	0032
		SUBWR 	35H, 0H 		//046A 	1235
		BTSS 	3H, 0H 			//046B 	2C03
		RET 					//046C 	1008

		//;buzzer.c: 66: buzzer_count = 0;
		CLRF 	35H 			//046D 	11B5

		//;buzzer.c: 67: buzzer_flag = 0;
		CLRF 	36H 			//046E 	11B6

		//;buzzer.c: 68: (LATA3 = 0);
		MOVLB 	2H 			//046F 	1022
		BCR 	CH, 3H 			//0470 	218C
		RET 					//0471 	1008

		//;buzzer.c: 41: static u8 div = 0;
		//;buzzer.c: 43: if (!buzzer_flag) {
		LDR 	36H, 0H 			//0472 	1836
		BTSS 	3H, 2H 			//0473 	2D03
		LJUMP 	479H 			//0474 	3C79

		//;buzzer.c: 44: div = 0;
		CLRF 	30H 			//0475 	11B0

		//;buzzer.c: 45: (LATA3 = 0);
		MOVLB 	2H 			//0476 	1022
		BCR 	CH, 3H 			//0477 	218C
		RET 					//0478 	1008

		//;buzzer.c: 47: }
		//;buzzer.c: 49: div++;
		INCR 	30H, 1H 		//0479 	1AB0

		//;buzzer.c: 50: if (div >= 1) {
		LDR 	30H, 0H 			//047A 	1830
		BTSC 	3H, 2H 			//047B 	2903
		RET 					//047C 	1008
		LDWI 	8H 			//047D 	0008

		//;buzzer.c: 51: div = 0;
		CLRF 	30H 			//047E 	11B0

		//;buzzer.c: 52: LATA3 = !LATA3;
		MOVLB 	2H 			//047F 	1022
		XORWR 	CH, 1H 		//0480 	168C
		RET 					//0481 	1008

		//;ir.c: 32: u8 sample;
		//;ir.c: 33: u8 cur_level;
		//;ir.c: 35: sample_cnt++;
		MOVLB 	0H 			//0482 	1020
		INCR 	2FH, 1H 		//0483 	1AAF

		//;ir.c: 37: cur_level = RC0;
		LDWI 	0H 			//0484 	0000
		BTSC 	EH, 0H 			//0485 	280E
		LDWI 	1H 			//0486 	0001
		STR 	73H 			//0487 	10F3

		//;ir.c: 40: if (pin_last && !cur_level) {
		LDR 	2AH, 0H 			//0488 	182A
		BTSC 	3H, 2H 			//0489 	2903
		LJUMP 	4C7H 			//048A 	3CC7
		LDR 	73H, 0H 			//048B 	1873
		BTSS 	3H, 2H 			//048C 	2D03
		LJUMP 	4C7H 			//048D 	3CC7

		//;ir.c: 41: sample = sample_cnt;
		LDR 	2FH, 0H 			//048E 	182F
		STR 	74H 			//048F 	10F4

		//;ir.c: 42: sample_cnt = 0;
		CLRF 	2FH 			//0490 	11AF

		//;ir.c: 45: if (sample > 61) {
		LDWI 	3EH 			//0491 	003E
		SUBWR 	74H, 0H 		//0492 	1274
		BTSS 	3H, 0H 			//0493 	2C03
		LJUMP 	497H 			//0494 	3C97

		//;ir.c: 46: sync = 0;
		CLRF 	2BH 			//0495 	11AB

		//;ir.c: 47: } else if (sample >= 40) {
		LJUMP 	4C7H 			//0496 	3CC7
		LDWI 	28H 			//0497 	0028
		SUBWR 	74H, 0H 		//0498 	1274
		BTSS 	3H, 0H 			//0499 	2C03
		LJUMP 	4A4H 			//049A 	3CA4

		//;ir.c: 49: if (sample >= 51) {
		LDWI 	33H 			//049B 	0033
		SUBWR 	74H, 0H 		//049C 	1274
		BTSS 	3H, 0H 			//049D 	2C03
		LJUMP 	4C7H 			//049E 	3CC7

		//;ir.c: 51: sync = 1;
		LDWI 	1H 			//049F 	0001
		STR 	2BH 			//04A0 	10AB

		//;ir.c: 52: bit_cnt = 32;
		LDWI 	20H 			//04A1 	0020
		STR 	2EH 			//04A2 	10AE

		//;ir.c: 53: }
		//;ir.c: 55: }
		LJUMP 	4C7H 			//04A3 	3CC7

		//;ir.c: 57: else if (sync) {
		LDR 	2BH, 0H 			//04A4 	182B
		BTSC 	3H, 2H 			//04A5 	2903
		LJUMP 	4C7H 			//04A6 	3CC7

		//;ir.c: 58: if (sample < 4 || sample > 14) {
		LDWI 	4H 			//04A7 	0004
		SUBWR 	74H, 0H 		//04A8 	1274
		BTSS 	3H, 0H 			//04A9 	2C03
		LJUMP 	495H 			//04AA 	3C95
		LDWI 	FH 			//04AB 	000F
		SUBWR 	74H, 0H 		//04AC 	1274
		BTSC 	3H, 0H 			//04AD 	2803
		LJUMP 	495H 			//04AE 	3C95

		//;ir.c: 61: shift_reg >>= 1;
		LSRF 	2CH, 1H 		//04AF 	06AC

		//;ir.c: 62: if (sample >= 8) {
		LDWI 	8H 			//04B0 	0008
		SUBWR 	74H, 0H 		//04B1 	1274
		BTSC 	3H, 0H 			//04B2 	2803

		//;ir.c: 63: shift_reg |= 0x80;
		BSR 	2CH, 7H 			//04B3 	27AC

		//;ir.c: 64: }
		//;ir.c: 66: bit_cnt--;
		DECRSZ 	2EH, 1H 		//04B4 	1BAE

		//;ir.c: 67: if (bit_cnt == 0) {
		LJUMP 	4C1H 			//04B5 	3CC1

		//;ir.c: 69: sync = 0;
		CLRF 	2BH 			//04B6 	11AB

		//;ir.c: 71: if ((shift_reg | data_byte) == 0xFF) {
		LDR 	2DH, 0H 			//04B7 	182D
		IORWR 	2CH, 0H 		//04B8 	142C
		STR 	72H 			//04B9 	10F2
		INCRSZ 	72H, 0H 		//04BA 	1F72
		LJUMP 	4C7H 			//04BB 	3CC7

		//;ir.c: 72: IR_code = data_byte;
		LDR 	2DH, 0H 			//04BC 	182D
		STR 	31H 			//04BD 	10B1

		//;ir.c: 73: IR_OK = 1;
		LDWI 	1H 			//04BE 	0001
		STR 	32H 			//04BF 	10B2
		LJUMP 	4C7H 			//04C0 	3CC7

		//;ir.c: 78: user_h = data_byte;
		LDR 	2EH, 0H 			//04C1 	182E
		ANDWI 	7H 			//04C2 	0907
		BTSS 	3H, 2H 			//04C3 	2D03
		LJUMP 	4C7H 			//04C4 	3CC7

		//;ir.c: 79: data_byte = shift_reg;
		LDR 	2CH, 0H 			//04C5 	182C
		STR 	2DH 			//04C6 	10AD

		//;ir.c: 80: }
		//;ir.c: 81: }
		//;ir.c: 82: }
		//;ir.c: 83: }
		//;ir.c: 85: pin_last = cur_level;
		LDR 	73H, 0H 			//04C7 	1873
		STR 	2AH 			//04C8 	10AA
		RET 					//04C9 	1008

		//;scr.c: 60: if (LED_DIS == 0) {
		LDR 	3EH, 0H 			//04CA 	183E
		BTSS 	3H, 2H 			//04CB 	2D03
		LJUMP 	4D0H 			//04CC 	3CD0

		//;scr.c: 61: (LATA0 = 0);
		MOVLB 	2H 			//04CD 	1022

		//;scr.c: 62: T2CEN = 0;
		//;scr.c: 63: TIM2IER = 0;
		MOVLP 	4H 			//04CE 	0184
		LJUMP 	407H 			//04CF 	3C07

		//;scr.c: 65: }
		//;scr.c: 67: T2CEN = 0;
		MOVLB 	6H 			//04D0 	1026
		BCR 	CH, 0H 			//04D1 	200C

		//;scr.c: 70: inc = SCR_LookupAngle(DIS_NUM);
		MOVLB 	0H 			//04D2 	1020
		LDR 	24H, 0H 			//04D3 	1824
		LCALL 	506H 			//04D4 	3506
		MOVLP 	4H 			//04D5 	0184
		LDR 	7BH, 0H 			//04D6 	187B
		STR 	23H 			//04D7 	10A3
		LDR 	7AH, 0H 			//04D8 	187A
		STR 	22H 			//04D9 	10A2

		//;scr.c: 73: if (DIS_NUM == 0) {
		LDR 	24H, 0H 			//04DA 	1824
		IORWR 	25H, 0H 		//04DB 	1425
		BTSC 	3H, 2H 			//04DC 	2903
		LJUMP 	4CDH 			//04DD 	3CCD

		//;scr.c: 78: }
		//;scr.c: 81: if (DIS_NUM == 100) {
		LDWI 	64H 			//04DE 	0064
		XORWR 	24H, 0H 		//04DF 	1624
		IORWR 	25H, 0H 		//04E0 	1425
		BTSS 	3H, 2H 			//04E1 	2D03
		LJUMP 	4F2H 			//04E2 	3CF2

		//;scr.c: 82: T2CEN = 0;
		MOVLB 	6H 			//04E3 	1026
		BCR 	CH, 0H 			//04E4 	200C

		//;scr.c: 83: TIM2IER = 0;
		CLRF 	DH 			//04E5 	118D

		//;scr.c: 84: EPIE0 = 0B00000010;
		LDWI 	2H 			//04E6 	0002
		MOVLB 	1H 			//04E7 	1021
		STR 	14H 			//04E8 	1094

		//;scr.c: 85: (LATA0 = 1);
		MOVLB 	2H 			//04E9 	1022
		BSR 	CH, 0H 			//04EA 	240C

		//;scr.c: 86: _delay((unsigned long)((20)*(32000000/4000000.0)));
		LDWI 	35H 			//04EB 	0035
		DECRSZ 	9H, 1H 		//04EC 	1B89
		LJUMP 	4ECH 			//04ED 	3CEC
		NOP 					//04EE 	1000

		//;scr.c: 87: (LATA0 = 0);
		MOVLB 	2H 			//04EF 	1022
		BCR 	CH, 0H 			//04F0 	200C
		RET 					//04F1 	1008

		//;scr.c: 89: }
		//;scr.c: 93: TIM2ARRH = (u8)(inc >> 8);
		LDR 	23H, 0H 			//04F2 	1823
		MOVLB 	6H 			//04F3 	1026
		STR 	19H 			//04F4 	1099

		//;scr.c: 94: TIM2ARRL = (u8)(inc);
		MOVLB 	0H 			//04F5 	1020
		LDR 	22H, 0H 			//04F6 	1822
		MOVLB 	6H 			//04F7 	1026
		STR 	1AH 			//04F8 	109A

		//;scr.c: 95: TIM2CNTRH = 0;
		CLRF 	16H 			//04F9 	1196

		//;scr.c: 96: TIM2CNTRL = 0;
		CLRF 	17H 			//04FA 	1197

		//;scr.c: 97: T2UIF = 1;
		BSR 	EH, 0H 			//04FB 	240E

		//;scr.c: 98: TIM2SR1 = 0B00000000;
		CLRF 	EH 			//04FC 	118E

		//;scr.c: 99: TIM2EGR = 0B00000000;
		CLRF 	10H 			//04FD 	1190

		//;scr.c: 100: TIM2IER = 0B00000001;
		LDWI 	1H 			//04FE 	0001
		STR 	DH 			//04FF 	108D

		//;scr.c: 101: EPIE0 = 0B00000010;
		LDWI 	2H 			//0500 	0002
		MOVLB 	1H 			//0501 	1021
		STR 	14H 			//0502 	1094

		//;scr.c: 102: T2CEN = 1;
		MOVLB 	6H 			//0503 	1026
		BSR 	CH, 0H 			//0504 	240C
		RET 					//0505 	1008
		STR 	3FH 			//0506 	10BF

		//;scr.c: 42: u8 idx;
		//;scr.c: 44: if (dis_num > 100) dis_num = 100;
		LDWI 	65H 			//0507 	0065
		SUBWR 	3FH, 0H 		//0508 	123F
		BTSS 	3H, 0H 			//0509 	2C03
		LJUMP 	50DH 			//050A 	3D0D
		LDWI 	64H 			//050B 	0064
		STR 	3FH 			//050C 	10BF

		//;scr.c: 47: idx = (dis_num + 2) / 5;
		LDR 	3FH, 0H 			//050D 	183F
		STR 	74H 			//050E 	10F4
		LDWI 	2H 			//050F 	0002
		CLRF 	75H 			//0510 	11F5
		ADDWR 	74H, 1H 		//0511 	17F4
		BTSC 	3H, 0H 			//0512 	2803
		INCR 	75H, 1H 		//0513 	1AF5
		LDWI 	5H 			//0514 	0005
		STR 	72H 			//0515 	10F2
		CLRF 	73H 			//0516 	11F3
		LCALL 	531H 			//0517 	3531
		MOVLP 	4H 			//0518 	0184
		LDR 	72H, 0H 			//0519 	1872
		STR 	40H 			//051A 	10C0

		//;scr.c: 48: if (idx > 20) idx = 20;
		LDWI 	15H 			//051B 	0015
		SUBWR 	40H, 0H 		//051C 	1240
		BTSS 	3H, 0H 			//051D 	2C03
		LJUMP 	521H 			//051E 	3D21
		LDWI 	14H 			//051F 	0014
		STR 	40H 			//0520 	10C0

		//;scr.c: 50: return AngleTable[idx];
		LDR 	40H, 0H 			//0521 	1840
		STR 	7CH 			//0522 	10FC
		LDWI 	A7H 			//0523 	00A7
		CLRF 	7DH 			//0524 	11FD
		LSLF 	7CH, 1H 		//0525 	05FC
		RLR 	7DH, 1H 			//0526 	1DFD
		ADDWR 	7CH, 0H 		//0527 	177C
		STR 	4H 			//0528 	1084
		LDWI 	85H 			//0529 	0085
		ADDWFC 	7DH, 0H 		//052A 	0D7D
		STR 	5H 			//052B 	1085
		MOVIW 	0H[0] 			//052C 	0F00
		STR 	7AH 			//052D 	10FA
		MOVIW 	1H[0] 			//052E 	0F01
		STR 	7BH 			//052F 	10FB
		RET 					//0530 	1008
		CLRF 	77H 			//0531 	11F7
		BTSS 	73H, 7H 		//0532 	2FF3
		LJUMP 	53BH 			//0533 	3D3B
		COMR 	72H, 1H 		//0534 	19F2
		COMR 	73H, 1H 		//0535 	19F3
		INCR 	72H, 1H 		//0536 	1AF2
		BTSC 	3H, 2H 			//0537 	2903
		INCR 	73H, 1H 		//0538 	1AF3
		CLRF 	77H 			//0539 	11F7
		INCR 	77H, 1H 		//053A 	1AF7
		BTSS 	75H, 7H 		//053B 	2FF5
		LJUMP 	544H 			//053C 	3D44
		COMR 	74H, 1H 		//053D 	19F4
		COMR 	75H, 1H 		//053E 	19F5
		INCR 	74H, 1H 		//053F 	1AF4
		BTSC 	3H, 2H 			//0540 	2903
		INCR 	75H, 1H 		//0541 	1AF5
		LDWI 	1H 			//0542 	0001
		XORWR 	77H, 1H 		//0543 	16F7
		CLRF 	78H 			//0544 	11F8
		CLRF 	79H 			//0545 	11F9
		LDR 	72H, 0H 			//0546 	1872
		IORWR 	73H, 0H 		//0547 	1473
		BTSC 	3H, 2H 			//0548 	2903
		LJUMP 	564H 			//0549 	3D64
		CLRF 	76H 			//054A 	11F6
		INCR 	76H, 1H 		//054B 	1AF6
		BTSC 	73H, 7H 		//054C 	2BF3
		LJUMP 	551H 			//054D 	3D51
		LSLF 	72H, 1H 		//054E 	05F2
		RLR 	73H, 1H 			//054F 	1DF3
		LJUMP 	54BH 			//0550 	3D4B
		LSLF 	78H, 1H 		//0551 	05F8
		RLR 	79H, 1H 			//0552 	1DF9
		LDR 	73H, 0H 			//0553 	1873
		SUBWR 	75H, 0H 		//0554 	1275
		BTSS 	3H, 2H 			//0555 	2D03
		LJUMP 	559H 			//0556 	3D59
		LDR 	72H, 0H 			//0557 	1872
		SUBWR 	74H, 0H 		//0558 	1274
		BTSS 	3H, 0H 			//0559 	2C03
		LJUMP 	560H 			//055A 	3D60
		LDR 	72H, 0H 			//055B 	1872
		SUBWR 	74H, 1H 		//055C 	12F4
		LDR 	73H, 0H 			//055D 	1873
		SUBWFB 	75H, 1H 		//055E 	0BF5
		BSR 	78H, 0H 			//055F 	2478
		LSRF 	73H, 1H 		//0560 	06F3
		RRR 	72H, 1H 			//0561 	1CF2
		DECRSZ 	76H, 1H 		//0562 	1BF6
		LJUMP 	551H 			//0563 	3D51
		LDR 	77H, 0H 			//0564 	1877
		BTSC 	3H, 2H 			//0565 	2903
		LJUMP 	56CH 			//0566 	3D6C
		COMR 	78H, 1H 		//0567 	19F8
		COMR 	79H, 1H 		//0568 	19F9
		INCR 	78H, 1H 		//0569 	1AF8
		BTSC 	3H, 2H 			//056A 	2903
		INCR 	79H, 1H 		//056B 	1AF9
		LDR 	79H, 0H 			//056C 	1879
		STR 	73H 			//056D 	10F3
		LDR 	78H, 0H 			//056E 	1878
		STR 	72H 			//056F 	10F2
		RET 					//0570 	1008

		//;scr.c: 111: if (SOFT == 0) return;
		LDR 	3DH, 0H 			//0571 	183D
		BTSC 	3H, 2H 			//0572 	2903
		RET 					//0573 	1008

		//;scr.c: 113: if (SOFT_FLAG == 0) {
		LDR 	3CH, 0H 			//0574 	183C
		BTSS 	3H, 2H 			//0575 	2D03
		LJUMP 	58BH 			//0576 	3D8B

		//;scr.c: 115: DIS_NUM += 5;
		LDWI 	5H 			//0577 	0005
		ADDWR 	24H, 1H 		//0578 	17A4
		BTSC 	3H, 0H 			//0579 	2803
		INCR 	25H, 1H 		//057A 	1AA5

		//;scr.c: 116: if (DIS_NUM >= DIS_NUM_TEMP) {
		LDR 	3BH, 0H 			//057B 	183B
		STR 	72H 			//057C 	10F2
		CLRF 	73H 			//057D 	11F3
		LDR 	73H, 0H 			//057E 	1873
		SUBWR 	25H, 0H 		//057F 	1225
		BTSS 	3H, 2H 			//0580 	2D03
		LJUMP 	584H 			//0581 	3D84
		LDR 	72H, 0H 			//0582 	1872
		SUBWR 	24H, 0H 		//0583 	1224
		BTSS 	3H, 0H 			//0584 	2C03
		RET 					//0585 	1008

		//;scr.c: 117: DIS_NUM = DIS_NUM_TEMP;
		LDR 	3BH, 0H 			//0586 	183B
		STR 	24H 			//0587 	10A4
		CLRF 	25H 			//0588 	11A5

		//;scr.c: 118: SOFT = 0;
		CLRF 	3DH 			//0589 	11BD
		RET 					//058A 	1008

		//;scr.c: 122: if (DIS_NUM >= 5) {
		LDWI 	0H 			//058B 	0000
		SUBWR 	25H, 0H 		//058C 	1225
		LDWI 	5H 			//058D 	0005
		BTSC 	3H, 2H 			//058E 	2903
		SUBWR 	24H, 0H 		//058F 	1224
		BTSS 	3H, 0H 			//0590 	2C03
		LJUMP 	597H 			//0591 	3D97

		//;scr.c: 123: DIS_NUM -= 5;
		LDWI 	5H 			//0592 	0005
		SUBWR 	24H, 1H 		//0593 	12A4
		LDWI 	0H 			//0594 	0000
		SUBWFB 	25H, 1H 		//0595 	0BA5

		//;scr.c: 124: } else {
		LJUMP 	599H 			//0596 	3D99

		//;scr.c: 125: DIS_NUM = 0;
		CLRF 	24H 			//0597 	11A4
		CLRF 	25H 			//0598 	11A5

		//;scr.c: 126: }
		//;scr.c: 129: if (DIS_NUM == 0) {
		LDR 	24H, 0H 			//0599 	1824
		IORWR 	25H, 0H 		//059A 	1425
		BTSS 	3H, 2H 			//059B 	2D03
		RET 					//059C 	1008

		//;scr.c: 130: SOFT = 0;
		CLRF 	3DH 			//059D 	11BD

		//;scr.c: 131: KEY_ON_num = 0;
		CLRF 	37H 			//059E 	11B7

		//;scr.c: 132: (LATA0 = 0);
		MOVLB 	2H 			//059F 	1022
		BCR 	CH, 0H 			//05A0 	200C

		//;scr.c: 133: T2CEN = 0;
		MOVLB 	6H 			//05A1 	1026
		BCR 	CH, 0H 			//05A2 	200C

		//;scr.c: 134: TIM2IER = 0;
		CLRF 	DH 			//05A3 	118D

		//;scr.c: 135: LED_DIS = 0;
		MOVLB 	0H 			//05A4 	1020
		CLRF 	3EH 			//05A5 	11BE
		RET 					//05A6 	1008
		RETW 	40H 			//05A7 	0440
		RETW 	9CH 			//05A8 	049C
		RETW 	D0H 			//05A9 	04D0
		RETW 	84H 			//05AA 	0484
		RETW 	E8H 			//05AB 	04E8
		RETW 	80H 			//05AC 	0480
		RETW 	0H 			//05AD 	0400
		RETW 	7DH 			//05AE 	047D
		RETW 	18H 			//05AF 	0418
		RETW 	79H 			//05B0 	0479
		RETW 	30H 			//05B1 	0430
		RETW 	75H 			//05B2 	0475
		RETW 	60H 			//05B3 	0460
		RETW 	6DH 			//05B4 	046D
		RETW 	90H 			//05B5 	0490
		RETW 	65H 			//05B6 	0465
		RETW 	C0H 			//05B7 	04C0
		RETW 	5DH 			//05B8 	045D
		RETW 	F0H 			//05B9 	04F0
		RETW 	55H 			//05BA 	0455
		RETW 	20H 			//05BB 	0420
		RETW 	4EH 			//05BC 	044E
		RETW 	50H 			//05BD 	0450
		RETW 	46H 			//05BE 	0446
		RETW 	80H 			//05BF 	0480
		RETW 	3EH 			//05C0 	043E
		RETW 	B0H 			//05C1 	04B0
		RETW 	36H 			//05C2 	0436
		RETW 	E0H 			//05C3 	04E0
		RETW 	2EH 			//05C4 	042E
		RETW 	10H 			//05C5 	0410
		RETW 	27H 			//05C6 	0427
		RETW 	40H 			//05C7 	0440
		RETW 	1FH 			//05C8 	041F
		RETW 	58H 			//05C9 	0458
		RETW 	1BH 			//05CA 	041B
		RETW 	70H 			//05CB 	0470
		RETW 	17H 			//05CC 	0417
		RETW 	88H 			//05CD 	0488
		RETW 	13H 			//05CE 	0413
		RETW 	0H 			//05CF 	0400
		RETW 	0H 			//05D0 	0400
		CLRF 	4CH 			//05D1 	11CC
		CLRF 	4DH 			//05D2 	11CD
		BTSS 	48H, 0H 		//05D3 	2C48
		LJUMP 	5D9H 			//05D4 	3DD9
		LDR 	4AH, 0H 			//05D5 	184A
		ADDWR 	4CH, 1H 		//05D6 	17CC
		LDR 	4BH, 0H 			//05D7 	184B
		ADDWFC 	4DH, 1H 		//05D8 	0DCD
		LSLF 	4AH, 1H 		//05D9 	05CA
		RLR 	4BH, 1H 			//05DA 	1DCB
		LSRF 	49H, 1H 		//05DB 	06C9
		RRR 	48H, 1H 			//05DC 	1CC8
		LDR 	48H, 0H 			//05DD 	1848
		IORWR 	49H, 0H 		//05DE 	1449
		BTSS 	3H, 2H 			//05DF 	2D03
		LJUMP 	5D3H 			//05E0 	3DD3
		LDR 	4DH, 0H 			//05E1 	184D
		STR 	49H 			//05E2 	10C9
		LDR 	4CH, 0H 			//05E3 	184C
		STR 	48H 			//05E4 	10C8
		RET 					//05E5 	1008
		MOVLP 	2H 			//05E6 	0182
		LJUMP 	253H 			//05E7 	3A53
		MOVLP 	2H 			//05E8 	0182
		LJUMP 	257H 			//05E9 	3A57
		MOVLP 	2H 			//05EA 	0182
		LJUMP 	25BH 			//05EB 	3A5B
		MOVLP 	2H 			//05EC 	0182
		LJUMP 	262H 			//05ED 	3A62
		MOVLP 	2H 			//05EE 	0182
		LJUMP 	265H 			//05EF 	3A65
		MOVLP 	2H 			//05F0 	0182
		LJUMP 	26BH 			//05F1 	3A6B
		MOVLP 	2H 			//05F2 	0182
		LJUMP 	272H 			//05F3 	3A72
		MOVLP 	2H 			//05F4 	0182
		LJUMP 	277H 			//05F5 	3A77
		MOVLP 	2H 			//05F6 	0182
		LJUMP 	27CH 			//05F7 	3A7C
		MOVLP 	2H 			//05F8 	0182
		LJUMP 	27FH 			//05F9 	3A7F

		//;hardware.c: 51: TIM4EN = 1;
		MOVLB 	1H 			//05FA 	1021
		BSR 	1AH, 3H 			//05FB 	259A

		//;hardware.c: 52: TIM4CR1 = 0B10000100;
		LDWI 	84H 			//05FC 	0084
		MOVLB 	2H 			//05FD 	1022
		STR 	11H 			//05FE 	1091

		//;hardware.c: 53: TIM4PSCR = 0x07;
		LDWI 	7H 			//05FF 	0007
		STR 	16H 			//0600 	1096

		//;hardware.c: 54: TIM4CNTR = 0;
		CLRF 	15H 			//0601 	1195

		//;hardware.c: 55: TIM4ARR = 250;
		LDWI 	FAH 			//0602 	00FA
		STR 	17H 			//0603 	1097

		//;hardware.c: 56: TIM4IER = 0B00000001;
		LDWI 	1H 			//0604 	0001
		STR 	12H 			//0605 	1092

		//;hardware.c: 57: T4CEN = 1;
		BSR 	11H, 0H 			//0606 	2411
		RET 					//0607 	1008
		CLRWDT 			//0608 	1064
		CLRF 	0H 			//0609 	1180
		ADDFSR 	0H, 1H 		//060A 	0101
		DECRSZ 	9H, 1H 		//060B 	1B89
		LJUMP 	609H 			//060C 	3E09
		RETW 	0H 			//060D 	0400
			END
