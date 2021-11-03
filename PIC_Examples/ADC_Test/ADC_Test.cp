#line 1 "C:/Users/youssef/Desktop/Coventry/Year 2/Embeded systems/PIC_Examples/ADC_Test/ADC_Test.c"



unsigned int temp_res;

void main() {


 ANSELA = 0x04;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;


 TRISA = 0xFF;
 TRISC = 0;
 TRISB = 0;
 do {
 temp_res = ADC_Read(2);
 PORTB = temp_res;
 PORTC = temp_res >> 8;
 } while(1);
}
