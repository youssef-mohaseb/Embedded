#line 1 "C:/Users/youssef/Desktop/Coventry/Year 2/Embeded systems/PIC_Examples/ADC_Test/ADC_Test1.c"



 int temp_res,x,y;

void main() {


 ANSELA = 0x07;





 TRISA = 0x07;


 UART1_Init(9600);


 do {
 x = ADC_Read(0);
 y= ADC_Read(1);



 UART1_Write(x);
 UART1_Write('-'); `

 UART1_Write(temp_res);
 UART1_Write('-');



 } while(1);
}
