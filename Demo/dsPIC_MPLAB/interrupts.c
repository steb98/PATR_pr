#ifndef INTERRUPTS_H_
#define INTERRUPTS_H_
#include "interrupts.h"
void init_INT0(){
    //TRISB = 0x0000; //PORTB este setat ca iesire
    _TRISB7 = 1; // RB7 este setat ca intrare
    _RB7 = 1;
    _INT0IF = 0; // Resetem flagul coresp. intreruperii INT0
    _INT0IE = 1; // Se permite lucrul cu �ntreruperea INT0
    _INT0EP = 1; // Se stabile?te pe ce front se genereaz? INT0
}
unsigned char ucApplicationRunning=1;

enum operationMode{MANUAL,AUTOMAT};
//extern enum operationMode opMode;

void __attribute__ ((interrupt, no_auto_psv)) _INT0Interrupt(void)
{
    ucApplicationRunning = !ucApplicationRunning;
    //_RB11 = ~_RB11;
    _INT0IF = 0;// Resetam flagul corespunzator intreruperii
}

unsigned int     uiTensValue = 0;
/* Rutina de tratare a intreruperii convertorului AD */
void __attribute__((interrupt, no_auto_psv)) _ADC1Interrupt(void){
	uiTensValue = ADC1BUF0;
	uiTensValue = (ADC1BUF0*3.3)/4096;
    IFS0bits.AD1IF = 0; // Achita intreruperea convertorului AD
}
#endif
