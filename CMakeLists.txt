cmake_minimum_required (VERSION 2.8)

project (FreeRTOS-Sim C)

set(CMAKE_C_WARNS "			\
	-W 						\
	-Wall 					\
	-Werror 				\
	-Wextra 				\
	-Wformat 				\
	-Wmissing-braces 		\
	-Wno-cast-align 		\
	-Wparentheses 			\
	-Wshadow 				\
	-Wno-sign-compare 		\
	-Wswitch 				\
	-Wuninitialized 		\
	-Wunknown-pragmas 		\
	-Wunused-function 		\
	-Wunused-label 			\
	-Wunused-parameter 		\
	-Wunused-value 			\
	-Wunused-variable 		\
	-Wmissing-prototypes	\
	")

set(CMAKE_C_CFLAGS	 " 				\
	-m32 							\
	-DDEBUG=1 						\
	-g 								\
	-UUSE_STDIO 					\
	-D__GCC_POSIX__=1 				\
	-pthread 						\
	-DMAX_NUMBER_OF_TASKS=300 -O2")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_CFLAGS} ${CMAKE_C_WARNS}")

# FreeRTOS Objects
set(SRCS_FREERTOS_OBJECTS
	Source/croutine.c
	Source/event_groups.c
	Source/list.c
	Source/queue.c
	Source/tasks.c
	Source/timers.c
)
	
set(SRCS_FREERTOS_PORTABLE_OBJECTS
	# portable Objects
	Source/portable/MemMang/heap_3.c
	Source/portable/GCC/POSIX/port.c
)

set(SRCS_FREERTOS_DEMO_OBJECTS
	# Demo Objects
	Demo/blocktim.c
	Demo/countsem.c
	Demo/GenQTest.c
	Demo/QPeek.c
	Demo/recmutex.c
	Demo/BlockQ.c
	Demo/death.c
	Demo/dynamic.c
	Demo/flop.c
	Demo/integer.c
	Demo/PollQ.c
	Demo/semtest.c

	Demo/AbortDelay.c
	Demo/EventGroupsDemo.c
	Demo/IntSemTest.c
	Demo/QueueSet.c
	Demo/QueueSetPolling.c
	Demo/QueueOverwrite.c
	Demo/TaskNotify.c
	Demo/TimerDemo.c
)

# COURSERA - Assigment 1
set(SRCS_FREERTOS_MAIN_OBJECT
	# Main Object
	Assigments/Assigment_1/main.c
)

########################################
add_library(
	FreeRTOS-Sim_Objects 
	${SRCS_FREERTOS_OBJECTS}
)
include_directories(Source/include)
LIST(APPEND
	FREERTOS_SIM_LIBS
	FreeRTOS-Sim_Objects
)
########################################

########################################
add_library(
	FreeRTOS-Sim_Portable_Objects 
	${SRCS_FREERTOS_PORTABLE_OBJECTS}
)
include_directories(Source/portable/GCC/POSIX/)
LIST(APPEND
	FREERTOS_SIM_LIBS
	FreeRTOS-Sim_Portable_Objects
)
########################################

########################################
include_directories(Demo/include)
add_library(
	FreeRTOS-Sim_Demo_Objects 
	${SRCS_FREERTOS_DEMO_OBJECTS}
)
target_link_libraries(
	FreeRTOS-Sim_Demo_Objects 
	FreeRTOS-Sim_Objects
)
LIST(APPEND
	FREERTOS_SIM_LIBS
	FreeRTOS-Sim_Demo_Objects
)
########################################

########################################
include_directories(Project)

add_executable(
	FreeRTOS-Sim
	${SRCS_FREERTOS_MAIN_OBJECT}
)

target_link_libraries(
	FreeRTOS-Sim
	${FREERTOS_SIM_LIBS}
)
########################################