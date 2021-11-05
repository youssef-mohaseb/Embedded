/*
     author: Yousef Sherif Mostafa Amin Mohaseb 
     Project name: Embedded Project 
     Project Description:
     Date:

*/


void main() {
     int potentiometer;
     ANSELD = 0;                //configure pin as digital 
     ANSELA = 0xff;             // Configure PORTA as analog
     TRISA = 0xff;              // PORTA is input
     TRISD = 0;                 // PORTD is output
 
     UART1_Init(9600);          // Baudrate 9600


 do {
    potentiometer = ADC_Read(1);     // ADC COVERT VALUE OF Potentiometer from analouge to degital

    if (potentiometer >= 169){      // if Potentiometer value > 169
        PORTD = 0xff;              // pORT D IS ALL ON
        UART1_Write(potentiometer);
        UART1_Write('-');
        UART1_Write_Text("potentiometer greater than 169"); // print on UART Terminal If Potentiometer value > 169 this text ("potentiometer less than 169")
        UART1_write(13);                                    // Enter new line
        UART1_write(10);                                    // Space in terminal

    }
    else   // OTHERWISE
    {
      PORTD = 0x0f;                                                // PORT D HALF OF HALF ON
      UART1_Write(potentiometer);
      UART1_Write('-');
      UART1_Write_Text("potentiometer less than 169");        // print on UART Terminal If Potentiometer value < 169 this text ("potentiometer less than 169")
      UART1_Write(13);
      UART1_Write(10);
     }            
 } while(1);
}
