#include "config.h"
#include "globals.h"
#include "hardware.h"
#include "storage.h"

//===========================================================
// 上电初始化 EEPROM — 检查初始化标志, 读取或写入默认值
//===========================================================
void Storage_Init(void)
{
    u8 init_flag = EEPROM_Read(EE_ADDR_INIT);

    if (init_flag != EE_INIT_MAGIC) {
        //========== 首次上电, 写入默认值 ==========
        DIS_NUM      = DEFAULT_VOLTAGE;
        USER_SET_VAL = DEFAULT_VOLTAGE;
        EEPROM_Write(EE_ADDR_MAIN,   DEFAULT_VOLTAGE);
        EEPROM_Write(EE_ADDR_BACKUP, DEFAULT_VOLTAGE);
        EEPROM_Write(EE_ADDR_INIT,   EE_INIT_MAGIC);
    } else {
        //========== 已初始化, 读取保存值 ==========
        u8 main_val   = EEPROM_Read(EE_ADDR_MAIN);
        u8 backup_val = EEPROM_Read(EE_ADDR_BACKUP);

        if (main_val == backup_val) {
            DIS_NUM = main_val;
        } else {
            // 主存储与备份不一致 → 用备份恢复主存储
            DIS_NUM = backup_val;
            EEPROM_Write(EE_ADDR_MAIN, backup_val);
        }

        // 范围校验并对齐到 5% 步进
        if (DIS_NUM > 100) {
            DIS_NUM = 100;
        } else if (DIS_NUM > 0) {
            DIS_NUM = ((DIS_NUM + 4) / 5) * 5;  // 向上对齐到 5% 步进
        }

        USER_SET_VAL = DIS_NUM;
    }
}

//===========================================================
// 掉电保存 — 在过零信号丢失时调用
// 先写备份再写主存储 (掉电瞬间主存储写入可能失败)
//===========================================================
void Storage_SaveOnPowerLoss(void)
{
    u8 save_val;

    if (SOFT == 1) {
        // 软启停过程中掉电: 保存目标值(升压)或当前值(降压)
        if (SOFT_FLAG == 0)
            save_val = DIS_NUM_TEMP;  // 升压中, 保存目标值
        else
            save_val = DIS_NUM;       // 降压中, 保存当前值
    } else {
        // 稳态: 保存用户设定值
        save_val = USER_SET_VAL;
    }

    // 范围校验并取整
    if (save_val > 100) save_val = 100;
    if (save_val > 0)
        save_val = ((save_val + 4) / 5) * 5;

    // 先备份再主存储
    EEPROM_Write(EE_ADDR_BACKUP, save_val);
    EEPROM_Write(EE_ADDR_MAIN,   save_val);
}
