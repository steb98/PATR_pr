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




void Task1(void *params) {
	for (;;)
		{		
		//PORTBbits.RB15 = ~PORTBbits.RB15;
		vParTestToggleLED(15);
		vTaskDelay(3000);
		}
}

void Task2(void *params) {
	for (;;)
		{
		//PORTBbits.RB14 = ~PORTBbits.RB14;
		vParTestToggleLED(14);
		vTaskDelay(2000);
		}
}

void Task3(void *params) {
	for (;;)
		{
		//PORTBbits.RB13 = ~PORTBbits.RB13;
		vParTestToggleLED(13);
		vTaskDelay(1000);
		}
}

void Task4(void *params) 
{
	for (;;)
		{
        //PORTBbits.RB12 = ~PORTBbits.RB12;
		vParTestToggleLED(12);
		vTaskDelay(1000);
		}
}


int main( void )
{
	prvSetupHardware();
    init_INT0();
    
	xTaskCreate(Task1, (signed portCHAR *) "Ts1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task2, (signed portCHAR *) "Ts2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task3, (signed portCHAR *) "Ts3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task4, (signed portCHAR *) "Ts4", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);

	vTaskStartScheduler();

	return 0;
}
/*-----------------------------------------------------------*/






