/* 
 * File:   initialization.h
 * Author: user
 *
 * Created on 02 martie 2021, 19:52
 */

#include "partest.h"
#include <p33FJ128MC802.h>

#ifndef INITIALIZATION_H
#define	INITIALIZATION_H

#ifdef	__cplusplus
extern "C" {
#endif

void prvSetupHardware( void );
void initPLL(void);


#ifdef	__cplusplus
}
#endif

#endif	/* INITIALIZATION_H */

