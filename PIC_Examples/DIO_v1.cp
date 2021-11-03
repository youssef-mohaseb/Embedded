#line 1 "C:/Users/youssef/Desktop/PIC_Examples/DIO_v1.c"

unsigned char x;


void test_funcion(){
 char y;

}

void main() {
 unsigned char var;
 TRISB = 0;
 PORTB = 0x55;



 UART1_Init(9600);


 while(1){

 if(UART1_Data_Ready()){
 var = UART1_Read();
 UART1_Write(var);
 }

 if(var == '0'){
 PORTB = 0b00111111;

 }
 else if(var == '1') {

 PORTB = 0b0000110 ;
 }




 }
}
