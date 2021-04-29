#include <stdio.h>

/* Scheduler includes. */
#include <p33FJ128MC802.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "croutine.h"


/* Demo application includes. */

/*Application includes*/
#include "initialization.h"
#include "new_lcd.h"
#include "ds18s20.h"
#include "interrupts.h"

// Select Internal FRC at POR
_FOSCSEL(FNOSC_FRC);
// Enable Clock Switching and Configure
_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF);		// FRC + PLL
//_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF & POSCMD_XT);		// XT + PLL
_FWDT(FWDTEN_OFF); 		// Watchdog Timer Enabled/disabled by user software

void TempRead(void *params);
void StartStop(void *params);
void DisplayInfo(void *params);
void Mode(void *params);

#define DEBUG_MODE 1

#define PRIO_StartStop 6
#define PRIO_TempRead 5
#define PRIO_DisplayInfo 1
#define PRIO_Mode 4

#if DEBUG_MODE==1
	#define _RB0 _RB11
	#define _RB1 _RB11
#endif

enum operationMode{MANUAL,AUTOMAT};

xTaskHandle hTStartStop;
xTaskHandle hTTempRead;
xTaskHandle hTDisplayInfo;
xTaskHandle hTMode;

int temp = 1.0;
enum operationMode opMode = AUTOMAT;
unsigned char ucTaskDeleted = 0;
//unsigned char ucApplicationRunning = 1;

void StartStop(void *params) {
	for (;;)
		{		
        if(ucApplicationRunning){
            _RB0=0; //led aprins

            portENTER_CRITICAL();

            if(ucTaskDeleted){
                xTaskCreate(TempRead, (signed portCHAR *) "TempRead", configMINIMAL_STACK_SIZE, NULL, PRIO_TempRead, &hTTempRead);
				xTaskCreate(DisplayInfo, (signed portCHAR *) "DisplayInfo", configMINIMAL_STACK_SIZE, NULL, PRIO_DisplayInfo, &hTDisplayInfo);
                xTaskCreate(Mode, (signed portCHAR *) "Mode", configMINIMAL_STACK_SIZE, NULL, PRIO_Mode, &hTMode);
				ucTaskDeleted = 0;
            }
            portEXIT_CRITICAL();
            
        }else{
            portENTER_CRITICAL();
            if(!ucTaskDeleted){
                vTaskDelete(hTTempRead);
				vTaskDelete(hTDisplayInfo);
				vTaskDelete(hTMode);
                hTTempRead = NULL;
				hTDisplayInfo = NULL;
				hTMode = NULL;
                ucTaskDeleted = 1;
            }
            _RB0 = ~ _RB0;
            portEXIT_CRITICAL();
        }
		
		vTaskDelay(300);
		}
}

void TempRead(void *params) {
	for (;;)
		{
            temp = ds1820_read();
			vTaskDelay(400);
		}
}

void DisplayInfo(void *params) {
	char cTemp[5] = {' ',' ',' ',' ',' '};
	for (;;)
		{
			LCD_line(0);
			LCD_printf("Mod : ");
			if(opMode == AUTOMAT)
			{
				LCD_printf("AUTOMAT");
			}else{
				LCD_printf("MANUAL");
			}

			_itoaQ15(temp,cTemp);

			LCD_line(1);
			LCD_printf("Temp: ");
			LCD_printf(cTemp);
			
			vTaskDelay(400);
		}
}
void Mode(void *params) {
	for (;;)
		{

			if(opMode == AUTOMAT){
				_RB1 = 0; // bec aprins
			}else{
				_RB1 = 1; //bec stins
			}

			vTaskDelay(400);
		}
}



int main( void )
{
	prvSetupHardware();
    
    
	xTaskCreate(StartStop, (signed portCHAR *) "StartStop", configMINIMAL_STACK_SIZE, NULL, PRIO_StartStop, &hTStartStop);
	xTaskCreate(TempRead, (signed portCHAR *) "TempRead", configMINIMAL_STACK_SIZE, NULL, PRIO_TempRead, &hTTempRead);
	xTaskCreate(DisplayInfo, (signed portCHAR *) "DisplayInfo", configMINIMAL_STACK_SIZE, NULL, PRIO_DisplayInfo, &hTDisplayInfo);
	xTaskCreate(Mode, (signed portCHAR *) "Mode", configMINIMAL_STACK_SIZE, NULL, PRIO_Mode, &hTMode);

	vTaskStartScheduler();

	return 0;
}
/*-----------------------------------------------------------*/






