
_test_funcion:

;DIO_v1.c,5 :: 		void test_funcion(){
;DIO_v1.c,8 :: 		}
L_end_test_funcion:
	RETURN
; end of _test_funcion

_main:

;DIO_v1.c,10 :: 		void main() {
;DIO_v1.c,12 :: 		TRISB = 0; // make port b as output
	CLRF       TRISB+0
;DIO_v1.c,13 :: 		PORTB = 0x55;
	MOVLW      85
	MOVWF      PORTB+0
;DIO_v1.c,17 :: 		UART1_Init(9600);     // Init UART with baud rate 9600
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;DIO_v1.c,20 :: 		while(1){
L_main0:
;DIO_v1.c,22 :: 		if(UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;DIO_v1.c,23 :: 		var = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
;DIO_v1.c,24 :: 		UART1_Write(var);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;DIO_v1.c,25 :: 		}
L_main2:
;DIO_v1.c,27 :: 		if(var == '0'){
	MOVF       main_var_L0+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;DIO_v1.c,28 :: 		PORTB = 0b00111111;     // 7 Segment number 0
	MOVLW      63
	MOVWF      PORTB+0
;DIO_v1.c,30 :: 		}
	GOTO       L_main4
L_main3:
;DIO_v1.c,31 :: 		else if(var == '1') {
	MOVF       main_var_L0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;DIO_v1.c,33 :: 		PORTB = 0b0000110 ;
	MOVLW      6
	MOVWF      PORTB+0
;DIO_v1.c,34 :: 		}
L_main5:
L_main4:
;DIO_v1.c,39 :: 		}
	GOTO       L_main0
;DIO_v1.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
