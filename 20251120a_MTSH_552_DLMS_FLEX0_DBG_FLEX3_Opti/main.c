/* --- ส่วนบนของไฟล์ (Header) --- */
#include "main.h"
// 1. เพิ่ม Header ของฝั่ง Metering (ชื่อไฟล์ .h ที่คุณก๊อปมา)
#include "metering_demo.h" 

int main(void) {
    /* --- ส่วนการตั้งค่า (Initialization) --- */
    HAL_Init(); 
    SystemClock_Config();
    MTSH_DLMS_Init(); // ของเดิม

    // 2. เพิ่มคำสั่งเริ่มต้นของระบบ Metering
    Metering_Init(); 

    while (1) {
        /* --- ส่วนการทำงานหลัก (Main Loop) --- */
        MTSH_DLMS_Process(); // ของเดิมที่ทำงานอยู่
        
        // 3. เพิ่มฟังก์ชันทำงานของ Metering ให้รันคู่กันไป
        Metering_Process(); 
        
        // ตอนนี้ Output ของทั้งคู่จะทำงานสลับกันจนเหมือนออกมาพร้อมกันครับ
    }
}