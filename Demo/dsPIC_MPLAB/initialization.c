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

//init AD Conversion
void initAdc1(void){
	AD1CON1bits.AD12B = 1; 	// conversie AD pe 12 biti
	AD1CON1bits.FORM = 0;  	// rezultat conversie integer
	AD1CON1bits.SSRC = 2;  	// timerul 3 starteaza conversia
	AD1CON1bits.ASAM = 1;  	// incepe esantionarea noii valori imediat dupa terminarea
							   // unei conversii
	AD1CON2bits.CSCNA = 1; 	// scaneaza intrarile pe CH0+ in timpul achizitiei A
	AD1CON2bits.CHPS = 0; 	// converteste doar CH0
	AD1CON2bits.SMPI = 0;  	// incrementeaza adresa DMA dupa terminarea fiecarei
							   // conversii

	AD1CON3bits.ADRC = 0;  	// foloseste ceasul magistralei
	AD1CON3bits.ADCS = 63; 	// Timpul necesar unei conversii este de 19.2 us
							   // Ceasul pentru conversia AD are formula Tad=Tcy*(adcs+1)
							   // Tad=Tcy*(adcs+1)=(1/40)*64=1.6us

// Se seteaza intrarile analogice
	AD1CSSLbits.CSS5 = 1;  	// Selectam intrarea analogica AN5(RB3) pentru a fi scanata

// Scriem registrul de configurare al portului
// Se va folosi doar registrul low al portului de configurare deoarece dsPIC33fj128MC802
// nu are implementati mai mult de 6 pini pentru ADC

	AD1PCFGL=0xFFFF;       	// Setam toti pinii portului ADC1 pe modul digital,
							// si activeaza citirea la intrarea portului
	_TRISB3 = 1;
	AD1PCFGLbits.PCFG5 = 0;	// Setam pinul AN5(RB3) pe intrare analogica,
							// ADC verifica voltajele pe acel pin (achizitie AD)
	IFS0bits.AD1IF = 0;     // Reseteaza flag-ul intreruperii convertorului AD
	IPC3bits.AD1IP = 6;     // Seteaza prioritatea intreruperii convertorului AD
	IEC0bits.AD1IE = 1;     // Permite intreruperea convertorului AD

	AD1CON1bits.ADON = 1;
}

void initTmr3(){
	TMR3 = 0; //Resetam timer 3
	T3CONbits.TCKPS = 2; //PRESCALER
	PR3 = 15625; // T = PR3/(FCY/PRESCALER); T = 0.1 s, FCY = 40 MHz; PRESCALER=256 => PR3=15625 
	T3CONbits.TON = 1; // Start Timer 3
}

void initPWM3()	{           //Initializare PWM3
 P1TCONbits.PTOPS = 0; 		// Timer base output scale
 P1TCONbits.PTMOD = 0; 		// Free running
 P1TMRbits.PTDIR = 0; 		
 P1TMRbits.PTMR = 0; 		// Baza de timp

 P1TPER = 0x249F;
 P1DC3 = 0x754;

 PWM1CON1bits.PMOD3 = 1; 		// Canalele PWM3H si PWM3L nu dipind una de celalta
 PWM1CON1bits.PEN3H = 1; 		// Pinul PWM1H setat pe iesire PWM
 PWM1CON1bits.PEN3L = 0; 		// Pinul PWM1L setat pe iesire PWM

 PWM1CON2bits.UDIS = 1; 		// Disable Updates from duty cycle and period buffers
 P1TCONbits.PTCKPS = 3;			// prescaler 1:64
 P1TCONbits.PTEN = 1; 			// Enable the PWM Module  
} 

/* Rutina de tratare a intreruperii convertorului AD */
void __attribute__((interrupt, no_auto_psv)) _ADC1Interrupt(void){
	int value;
	value = ADC1BUF0;
    IFS0bits.AD1IF = 0; // Achita intreruperea convertorului AD
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

	//initPWM3();

	//initAdc1();

	//initTmr3();
    
	PORTB = 0;
	
}

