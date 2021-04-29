#include "initialization.h"


void init_ds18s20(){
    _TRISB2 = 1; // input pin
    _CN6PUE=1; // pull-up pe pin
}

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


void prvSetupHardware( void )
{
	ADPCFG = 0xFFFF;	//make ADC pins all digital - adaugat - pt lcd si senzor_temp
	CNPU2bits.CN22PUE = 0;
	CNPU2bits.CN23PUE = 0;
    TRISB = 0 ;	// toate iesiri
	PORTB = 0 ;
	initPLL();

	LCD_init();

	init_ds18s20();

    init_INT0();
    
	PORTB = 0;
	
}

