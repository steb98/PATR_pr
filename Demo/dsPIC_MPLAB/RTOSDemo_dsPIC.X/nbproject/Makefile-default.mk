#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../main.c ../../../Source/list.c ../../../Source/queue.c ../../../Source/tasks.c ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c ../../../Source/portable/MemMang/heap_1.c ../ParTest/ParTest.c ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../../../Source/croutine.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/449926602/list.o ${OBJECTDIR}/_ext/449926602/queue.o ${OBJECTDIR}/_ext/449926602/tasks.o ${OBJECTDIR}/_ext/1343266892/port.o ${OBJECTDIR}/_ext/1884096877/heap_1.o ${OBJECTDIR}/_ext/809743516/ParTest.o ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o ${OBJECTDIR}/_ext/449926602/croutine.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/449926602/list.o.d ${OBJECTDIR}/_ext/449926602/queue.o.d ${OBJECTDIR}/_ext/449926602/tasks.o.d ${OBJECTDIR}/_ext/1343266892/port.o.d ${OBJECTDIR}/_ext/1884096877/heap_1.o.d ${OBJECTDIR}/_ext/809743516/ParTest.o.d ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/449926602/croutine.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/449926602/list.o ${OBJECTDIR}/_ext/449926602/queue.o ${OBJECTDIR}/_ext/449926602/tasks.o ${OBJECTDIR}/_ext/1343266892/port.o ${OBJECTDIR}/_ext/1884096877/heap_1.o ${OBJECTDIR}/_ext/809743516/ParTest.o ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o ${OBJECTDIR}/_ext/449926602/croutine.o

# Source Files
SOURCEFILES=../main.c ../../../Source/list.c ../../../Source/queue.c ../../../Source/tasks.c ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c ../../../Source/portable/MemMang/heap_1.c ../ParTest/ParTest.c ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../../../Source/croutine.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC802
MP_LINKER_FILE_OPTION=,--script="..\p33FJ128MC802.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o: ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1343266892" 
	@${RM} ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d 
	@${RM} ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.ok ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d" "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -c -mcpu=$(MP_PROCESSOR_OPTION)  -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -MMD -MF "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d"  -o ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,-I"..",-I".",-g
	
else
${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o: ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1343266892" 
	@${RM} ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d 
	@${RM} ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.ok ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d" "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -omf=elf -c -mcpu=$(MP_PROCESSOR_OPTION)  -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -MMD -MF "${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.d"  -o ${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o ../../../Source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1343266892/portasm_dsPIC.o.asm.d",-g,-I"..",-I".",-g
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/list.o: ../../../Source/list.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.ok ${OBJECTDIR}/_ext/449926602/list.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/list.o.d" -o ${OBJECTDIR}/_ext/449926602/list.o ../../../Source/list.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/queue.o: ../../../Source/queue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.ok ${OBJECTDIR}/_ext/449926602/queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/queue.o.d" -o ${OBJECTDIR}/_ext/449926602/queue.o ../../../Source/queue.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/tasks.o: ../../../Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.ok ${OBJECTDIR}/_ext/449926602/tasks.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/tasks.o.d" -o ${OBJECTDIR}/_ext/449926602/tasks.o ../../../Source/tasks.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/1343266892/port.o: ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1343266892" 
	@${RM} ${OBJECTDIR}/_ext/1343266892/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1343266892/port.o.ok ${OBJECTDIR}/_ext/1343266892/port.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1343266892/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1343266892/port.o.d" -o ${OBJECTDIR}/_ext/1343266892/port.o ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/1884096877/heap_1.o: ../../../Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1884096877" 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_1.o.ok ${OBJECTDIR}/_ext/1884096877/heap_1.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1884096877/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1884096877/heap_1.o.d" -o ${OBJECTDIR}/_ext/1884096877/heap_1.o ../../../Source/portable/MemMang/heap_1.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/809743516/ParTest.o: ../ParTest/ParTest.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/809743516" 
	@${RM} ${OBJECTDIR}/_ext/809743516/ParTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/809743516/ParTest.o.ok ${OBJECTDIR}/_ext/809743516/ParTest.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/809743516/ParTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/809743516/ParTest.o.d" -o ${OBJECTDIR}/_ext/809743516/ParTest.o ../ParTest/ParTest.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/croutine.o: ../../../Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/croutine.o.ok ${OBJECTDIR}/_ext/449926602/croutine.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/croutine.o.d" -o ${OBJECTDIR}/_ext/449926602/croutine.o ../../../Source/croutine.c   -fno-schedule-insns -fno-schedule-insns2
	
else
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/list.o: ../../../Source/list.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.ok ${OBJECTDIR}/_ext/449926602/list.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/list.o.d" -o ${OBJECTDIR}/_ext/449926602/list.o ../../../Source/list.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/queue.o: ../../../Source/queue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.ok ${OBJECTDIR}/_ext/449926602/queue.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/queue.o.d" -o ${OBJECTDIR}/_ext/449926602/queue.o ../../../Source/queue.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/tasks.o: ../../../Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.ok ${OBJECTDIR}/_ext/449926602/tasks.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/tasks.o.d" -o ${OBJECTDIR}/_ext/449926602/tasks.o ../../../Source/tasks.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/1343266892/port.o: ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1343266892" 
	@${RM} ${OBJECTDIR}/_ext/1343266892/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1343266892/port.o.ok ${OBJECTDIR}/_ext/1343266892/port.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1343266892/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1343266892/port.o.d" -o ${OBJECTDIR}/_ext/1343266892/port.o ../../../Source/portable/MPLAB/PIC24_dsPIC/port.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/1884096877/heap_1.o: ../../../Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1884096877" 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_1.o.ok ${OBJECTDIR}/_ext/1884096877/heap_1.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1884096877/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/1884096877/heap_1.o.d" -o ${OBJECTDIR}/_ext/1884096877/heap_1.o ../../../Source/portable/MemMang/heap_1.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/809743516/ParTest.o: ../ParTest/ParTest.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/809743516" 
	@${RM} ${OBJECTDIR}/_ext/809743516/ParTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/809743516/ParTest.o.ok ${OBJECTDIR}/_ext/809743516/ParTest.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/809743516/ParTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/809743516/ParTest.o.d" -o ${OBJECTDIR}/_ext/809743516/ParTest.o ../ParTest/ParTest.c   -fno-schedule-insns -fno-schedule-insns2
	
${OBJECTDIR}/_ext/449926602/croutine.o: ../../../Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/croutine.o.ok ${OBJECTDIR}/_ext/449926602/croutine.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/449926602/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -DMPLAB_DSPIC_PORT -I".." -I"../../../../../Demo/dsPIC_MPLAB" -I"../../../../Demo/dsPIC_MPLAB" -I"../../../../Source/include" -I"../../../../include" -I"../../../Common/include" -I"../../../Source/include" -I"../../../include" -I"../../Common/include" -I"../../Demo/dsPIC_MPLAB" -I"../../include" -I"../FileSystem" -I"../include" -I"." -O2 -MMD -MF "${OBJECTDIR}/_ext/449926602/croutine.o.d" -o ${OBJECTDIR}/_ext/449926602/croutine.o ../../../Source/croutine.c   -fno-schedule-insns -fno-schedule-insns2
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../p33FJ128MC802.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1,--stack=16,-L"..",-L".",--report-mem,--defsym=__ICD2RAM=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../p33FJ128MC802.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1,--stack=16,-L"..",-L".",--report-mem,--defsym=__ICD2RAM=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_dsPIC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -omf=elf
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
