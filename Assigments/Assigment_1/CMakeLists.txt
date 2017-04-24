project(FreeRTOS-Sim_Assigment_1 LANGUAGES C)

########################################
#
set(SRCS_FREERTOS-SIM_PROJECT
	# Main Object
	main.c
	#
	FreeRTOSConfig.h
)

add_executable(
	FreeRTOS-Sim_Project
	${SRCS_FREERTOS-SIM_PROJECT}
)

target_link_libraries(
	FreeRTOS-Sim_Project
	${FREERTOS-SIM_LIBS}
)
########################################