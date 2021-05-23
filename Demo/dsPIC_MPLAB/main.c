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
            //_RB0=0; //led aprins

            portENTER_CRITICAL();
			vTaskSuspend(&hTTempRead);
			vTaskSuspend(&hTDisplayInfo);
			vTaskSuspend(&hTMode);
            if(ucTaskDeleted){
                
				ucTaskDeleted = 0;
            }
            portEXIT_CRITICAL();
            
        }else{
            portENTER_CRITICAL();
            if(!ucTaskDeleted){
                vTaskResume(&hTMode);
                vTaskResume(&hTDisplayInfo);
                vTaskResume(&hTMode);

                ucTaskDeleted = 1;
            }
            //_RB0 = ~ _RB0;
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
			LCD_line(1);
			LCD_printf("Mod : ");
			if(opMode == AUTOMAT)
			{
				LCD_printf("AUTOMAT");
			}else{
				LCD_printf("MANUAL");
			}

			_itoaQ15(temp,cTemp);

			LCD_line(2);
			LCD_printf("Temp: ");
			LCD_printf(cTemp);
			
			vTaskDelay(400);
		}
}
void Mode(void *params) {
	unsigned int width = 0; //PWM width
	for (;;)
		{
			if(ucApplicationRunning){
				T3CONbits.TON = 0; // oprire conversie AD
				_RB1 = 0; // bec aprins
				opMode = AUTOMAT;
				width =(((((temp*1000)-20000)/100))*10)+1350;  // valoarea factorului de umplere
				P1DC3 = width; // Actualizare registru duty-cycle PWM

			}else{
				T3CONbits.TON = 1; //startare conversie AD
				_RB1 = 1; //bec stins
				opMode = MANUAL;
				if(uiTensValue<=1){
					width = 1250;
				}else{
					width= ((((uiTensValue*1000)-1000)/20)*10)+1350;
				}
				P1DC3 = width; // Actualizare registru duty-cycle PWM

				
			}

			vTaskDelay(400);
		}
}



int main( void )
{
	prvSetupHardware();
    
    
	//xTaskCreate(StartStop, (signed portCHAR *) "StartStop", configMINIMAL_STACK_SIZE, NULL, PRIO_StartStop, &hTStartStop); //to do INT0 interrrupt
	xTaskCreate(TempRead, (signed portCHAR *) "TempRead", configMINIMAL_STACK_SIZE, NULL, PRIO_TempRead, &hTTempRead);
	xTaskCreate(DisplayInfo, (signed portCHAR *) "DisplayInfo", configMINIMAL_STACK_SIZE, NULL, PRIO_DisplayInfo, &hTDisplayInfo);
	xTaskCreate(Mode, (signed portCHAR *) "Mode", configMINIMAL_STACK_SIZE, NULL, PRIO_Mode, &hTMode);

	vTaskStartScheduler();

	return 0;
}
/*-----------------------------------------------------------*/






