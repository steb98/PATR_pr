#include <stdio.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "croutine.h"

/* Demo application includes. */

/*Application includes*/
#include "interrupts.h"
#include "initialization.h"


// Select Internal FRC at POR
_FOSCSEL(FNOSC_FRC);
// Enable Clock Switching and Configure
_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF);		// FRC + PLL
//_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF & POSCMD_XT);		// XT + PLL
_FWDT(FWDTEN_OFF); 		// Watchdog Timer Enabled/disabled by user software

void Task2(void *params);
void Task3(void *params);
void Task4(void *params);

xTaskHandle hT2;
xTaskHandle hT3;
xTaskHandle hT4;
unsigned char ucTaskDeleted = 0;

void StartStop(void *params) {
	for (;;)
		{		
		//PORTBbits.RB15 = ~PORTBbits.RB15;
        if(ucApplicationRunning){
            _RB0=0; //led aprins
            portENTER_CRITICAL();
            if(ucTaskDeleted){
                xTaskCreate(Task2, (signed portCHAR *) "Ts2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT2);
                xTaskCreate(Task3, (signed portCHAR *) "Ts3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT3);
                xTaskCreate(Task4, (signed portCHAR *) "Ts4", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT4);
                ucTaskDeleted = 0;
            }
            
        }else{
            portENTER_CRITICAL();
            if(!ucTaskDeleted){
                vTaskDelete(hT2);
                vTaskDelete(hT3);
                vTaskDelete(hT3);
                ucTaskDeleted = 1;
            }
            _RB0 = ~ _RB0;
            portEXIT_CRITICAL();
        }
		
		vTaskDelay(300);
		}
}

void Task2(void *params) {
	for (;;)
		{
		PORTBbits.RB14 = ~PORTBbits.RB14;
		vTaskDelay(400);
		}
}

void Task3(void *params) {
	for (;;)
		{
		PORTBbits.RB13 = ~PORTBbits.RB13;
		vTaskDelay(400);
		}
}

void Task4(void *params) 
{
	for (;;)
		{
        PORTBbits.RB12 = ~PORTBbits.RB12;
		vTaskDelay(400);
		}
}


int main( void )
{
	prvSetupHardware();
    init_INT0();
    
	xTaskCreate(StartStop, (signed portCHAR *) "StartStop", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 2, NULL);
	xTaskCreate(Task2, (signed portCHAR *) "Ts2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT2);
	xTaskCreate(Task3, (signed portCHAR *) "Ts3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT3);
	xTaskCreate(Task4, (signed portCHAR *) "Ts4", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, &hT4);

	vTaskStartScheduler();

	return 0;
}
/*-----------------------------------------------------------*/






