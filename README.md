# Moore-FPGAVendingMachine
*Moore model Verilog FSM created in the Xilinx ISE Design Suite* 

**Contributors**
- Thomas Bivins
- Patrick Cook
- Josue Lugo Roldan

## Design Description
The FSM takes 5 inputs, 3 of which are coin inputs (Quarter, Nickel, Dime) and 2 are select inputs (Soda, Diet). There are 3 outputs (GiveSoda, GiveDiet, Change). All coin inputs pulse high then immediately low when they are input from the FPGA board, and the selection inputs will pulse high then low when the corresponding output goes high. Both soda outputs pulse high upon input of 45 cents or more and all change is output in nickels.

This is also a pure FSM, meaning that there is no arithmetic used in the calculation of current price and change, only FSM state transitions.

## Test Vectors and Waveforms
*Waveform 1: 55 cents*
![image](https://user-images.githubusercontent.com/75175761/159538853-0aae81d4-7a6e-49c7-8829-f2317b121fc8.png)

*Waveform 2: 35 cents*
![image](https://user-images.githubusercontent.com/75175761/159539425-b78931f6-dd0b-4a3a-93ae-75c9a204f4fe.png)

*Waveform 3: 45 cents*
![image](https://user-images.githubusercontent.com/75175761/159539575-f3160bfa-f154-4444-aea2-d8983f13dcb5.png)

## FPGA Input/Output Mapping
```
# PlanAhead Generated physical constraints 
#NET "SW<7>" CLOCK_DEDICATED_ROUTE = FALSE;
##Clock Signal 100MHz
	NET "CLK"	LOC=D11 ;

##Switches
	NET "SW[0]"	LOC= V5	; ## RESET		
	NET "SW[1]"	LOC= U4	; ## SODA INPUT
	NET "SW[2]"	LOC= V3	; ## DIET INPUT				

## LEDs
	NET "LED[0]"	LOC=W3	; ## GIVESODA OUTPUT	
	NET "LED[1]"	LOC=Y4	; ## GIVEDIET OUTPUT
	NET "LED[2]"	LOC=Y1	; ## CHANGE OUTPUT

##Buttons
	NET "BTN[1]"	LOC=D5	; ## QUARTER INPUT
	NET "BTN[2]"	LOC=A3	; ## NICKEL INPUT
	NET "BTN[3]"	LOC=AB9	; ## DIME INPUT
  ```
*I/O Map to physical ports present on FPGA*

