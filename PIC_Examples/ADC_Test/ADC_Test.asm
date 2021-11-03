
_main:

;ADC_Test.c,6 :: 		void main() {
;ADC_Test.c,8 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC_Test.c,15 :: 		TRISA = 0xFF; // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;ADC_Test.c,16 :: 		TRISC = 0; // PORTC is output
	CLRF       TRISC+0
;ADC_Test.c,17 :: 		TRISB = 0; // PORTB is output
	CLRF       TRISB+0
;ADC_Test.c,18 :: 		do {
L_main0:
;ADC_Test.c,19 :: 		temp_res = ADC_Read(2); // Get 10-bit results of AD conversion
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ADC_Test.c,20 :: 		PORTB = temp_res; // Send lower 8 bits to PORTB
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ADC_Test.c,21 :: 		PORTC = temp_res >> 8; // Send 2 most significant bits to RC1, RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTC+0
;ADC_Test.c,22 :: 		} while(1);
	GOTO       L_main0
;ADC_Test.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
