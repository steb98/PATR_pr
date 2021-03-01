#include <stdio.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "croutine.h"

/* Demo application includes. */
#include "partest.h"


// Select Internal FRC at POR
_FOSCSEL(FNOSC_FRC);
// Enable Clock Switching and Configure
_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF);		// FRC + PLL
//_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF & POSCMD_XT);		// XT + PLL
_FWDT(FWDTEN_OFF); 		// Watchdog Timer Enabled/disabled by user software

static void prvSetupHardware( void );


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
	/* Configure any hardware required for this demo. */
	prvSetupHardware();

	xTaskCreate(Task1, (signed portCHAR *) "Ts1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task2, (signed portCHAR *) "Ts2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task3, (signed portCHAR *) "Ts3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
	xTaskCreate(Task4, (signed portCHAR *) "Ts4", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);

	/* Finally start the scheduler. */
	vTaskStartScheduler();

	return 0;
}
/*-----------------------------------------------------------*/

void initPLL(void)
{
// Configure PLL prescaler, PLL postscaler, PLL divisor
	PLLFBD = 41; 		// M = 43 FRC
	//PLLFBD = 30; 		// M = 32 XT
	CLKDIVbits.PLLPOST=0; 	// N1 = 2
	CLKDIVbits.PLLPRE=0; 	// N2 = 2

// Initiate Clock Switch to Internal FRC with PLL (NOSC = 0b001)
	__builtin_write_OSCCONH(0x01);	// FRC
	//__builtin_write_OSCCONH(0x03);	// XT
	__builtin_write_OSCCONL(0x01);

// Wait for Clock switch to occur
	while (OSCCONbits.COSC != 0b001);	// FRC
	//while (OSCCONbits.COSC != 0b011);	// XT

// Wait for PLL to lock
	while(OSCCONbits.LOCK!=1) {};
}

static void prvSetupHardware( void )
{
	//ADPCFG = 0xFFFF;				//make ADC pins all digital - adaugat
	vParTestInitialise();
	initPLL();
}


