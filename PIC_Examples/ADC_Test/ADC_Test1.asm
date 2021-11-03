
_main:

;ADC_Test1.c,6 :: 		void main() {
;ADC_Test1.c,9 :: 		ANSEL = 0x07; // Configure AN2,AN1,AN0 pin as analog
	MOVLW      7
	MOVWF      ANSEL+0
;ADC_Test1.c,10 :: 		ANSELH = 0; // Configure other AN pins as digital I/O
	CLRF       ANSELH+0
;ADC_Test1.c,11 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;ADC_Test1.c,12 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;ADC_Test1.c,15 :: 		TRISA = 0x07; // PORTA is input
	MOVLW      7
	MOVWF      TRISA+0
;ADC_Test1.c,18 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ADC_Test1.c,21 :: 		do {
L_main0:
;ADC_Test1.c,22 :: 		x = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;ADC_Test1.c,23 :: 		y= ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _y+0
	MOVF       R0+1, 0
	MOVWF      _y+1
;ADC_Test1.c,24 :: 		temp_res = ADC_Read(2); // Get 10-bit results of AD conversion
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ADC_Test1.c,27 :: 		UART1_Write(x);
	MOVF       _x+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ADC_Test1.c,28 :: 		UART1_Write('-');
	MOVLW      45
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ADC_Test1.c,30 :: 		UART1_Write(temp_res);
	MOVF       _temp_res+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ADC_Test1.c,31 :: 		UART1_Write('-');
	MOVLW      45
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;ADC_Test1.c,35 :: 		} while(1);
	GOTO       L_main0
;ADC_Test1.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
