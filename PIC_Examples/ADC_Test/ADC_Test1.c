


 int temp_res,x,y;

void main() {

// ADCON0
 ANSELA = 0x07; // Configure AN2,AN1,AN0 pin as analog
 //ANSELH = 0; // Configure other AN pins as digital I/O
// C1ON_bit = 0; // Disable comparators
 //C2ON_bit = 0;

 
 TRISA = 0x07; // PORTA is input
// TRISC = 0; // PORTC is output
// TRISB = 0; // PORTB is output
  UART1_Init(9600);
  
  
 do {
 x = ADC_Read(0);
 y= ADC_Read(1);
 //temp_res = ADC_Read(2); // Get 10-bit results of AD conversion
 
                 // convert int to string
 UART1_Write(x);
 UART1_Write('-'); `

 UART1_Write(temp_res);
 UART1_Write('-');

 
 
 } while(1);
}