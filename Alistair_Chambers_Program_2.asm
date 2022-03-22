## CS 254 Program 2
     ##
     ## Compute 23*x, where x =4
     ##
     ## Programmer: Alistair Chambers
     ## Date:02/23/22
     ##
     ## Register use:
     ##     r7  = 4
     ##     r8  = 16
     ##     r9  = 4
     ##     r10 = sum of registers r7,r12,r13,r14
     ##     r11 = 2
     ##     r12 = left shifted value of r8
     ##     r13 = left shifted value of r9
     ##     r14 = left shifted value of r11
     ##     r15 = sum of registers r12 and r13
     ##     r24 = sum of registers r15 and r14
     ##
     .text
     .globl main
     
main:

     ori   $7,$0,4          #Assigned the number 4 to Register 7
     ori   $8,$0,16         #Assigned the number 16 to Register 8
     ori   $9,$0,4          #Assigned the number 4 to Register 9
     ori   $11,$0,2         #Assigned the number 2 to Register 11
     sll   $12,$8,2         #Left shifed the value from register 8 by 2
     sll   $13,$9,2         #Left shifed the value from register 9 by 2
     sll   $14,$11,2        #Left shifed the value from register 11 by 2
     addu  $15,$12,$13      #Added values from registers 12 and 13 together
     addu  $24,$15,$14      #Added values from registers 15 and 14 together
     addu  $10,$24,$7       #Added values from registers 24 and 7 together




## End of file
