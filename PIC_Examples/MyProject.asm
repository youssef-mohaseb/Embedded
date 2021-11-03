
_main:

;MyProject.c,5 :: 		void main() {
;MyProject.c,7 :: 		TRISA = 0;           // set direction to be output
	CLRF        TRISA+0 
;MyProject.c,8 :: 		TRISB = 0;           // set direction to be output
	CLRF        TRISB+0 
;MyProject.c,9 :: 		TRISC = 0;           // set direction to be output
	CLRF        TRISC+0 
;MyProject.c,10 :: 		TRISD = 0;           // set direction to be output
	CLRF        TRISD+0 
;MyProject.c,11 :: 		TRISE = 0;           // set direction to be output
	CLRF        TRISE+0 
;MyProject.c,13 :: 		do {
L_main0:
;MyProject.c,14 :: 		LATA = 0x00;       // Turn OFF LEDs on PORTA
	CLRF        LATA+0 
;MyProject.c,15 :: 		LATB = 0x00;       // Turn OFF LEDs on PORTB
	CLRF        LATB+0 
;MyProject.c,16 :: 		LATC = 0x00;       // Turn OFF LEDs on PORTC
	CLRF        LATC+0 
;MyProject.c,17 :: 		LATD = 0x00;       // Turn OFF LEDs on PORTD
	CLRF        LATD+0 
;MyProject.c,18 :: 		LATE = 0x00;       // Turn OFF LEDs on PORTE
	CLRF        LATE+0 
;MyProject.c,19 :: 		Delay_ms(1000);    // 1 second delay
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;MyProject.c,21 :: 		LATA = 0xFF;       // Turn ON LEDs on PORTA
	MOVLW       255
	MOVWF       LATA+0 
;MyProject.c,22 :: 		LATB = 0xFF;       // Turn ON LEDs on PORTB
	MOVLW       255
	MOVWF       LATB+0 
;MyProject.c,23 :: 		LATC = 0xFF;       // Turn ON LEDs on PORTC
	MOVLW       255
	MOVWF       LATC+0 
;MyProject.c,24 :: 		LATD = 0xFF;       // Turn ON LEDs on PORTD
	MOVLW       255
	MOVWF       LATD+0 
;MyProject.c,25 :: 		LATE = 0xFF;       // Turn ON LEDs on PORTE
	MOVLW       255
	MOVWF       LATE+0 
;MyProject.c,26 :: 		Delay_ms(1000);    // 1 second delay
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;MyProject.c,27 :: 		} while(1);          // Endless loop
	GOTO        L_main0
;MyProject.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
