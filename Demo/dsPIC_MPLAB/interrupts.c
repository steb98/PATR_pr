#include "interrupts.h"

void init_INT0(){
    TRISB = 0x0000; //PORTB este setat ca iesire
    _TRISB7 = 1; // RB7 este setat ca intrare
    PORTB = 0xF000;
    _INT0IF = 0; // Resetem flagul coresp. intreruperii INT0
    _INT0IE = 1; // Se permite lucrul cu întreruperea INT0
    _INT0EP = 1; // Se stabile?te pe ce front se genereaz? INT0
}

void __attribute__ ((interrupt, no_auto_psv)) _INT0Interrupt(void)
{
_RB15 = ~_RB15;
_INT0IF = 0;// Resetam flagul corespunzator intreruperii
// INT0 pentru a nu se reapela rutina de intrerupere
}