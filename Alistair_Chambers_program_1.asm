## CS 254  Program 1  Spring 2022
     ##
     ## Compute a + b + c + d
     ## Choosen Intergers are a = 4, b=8, c=2, d=6
     ## Programmer: Alistair Chambers
     ## Date: 02/15/22
     .text
     .globl main

main:

     ori   $8,$0,4      # Assigns the integer 4 to register 8
     ori   $9,$0,8      # Assigns the integer 8 to register 9
     addu  $11,$8,$9    # Adds the values in registers 8 and 9 and assigns the value to register 11
     ori   $12,$0,2     # Assigns the integer 2 to register 12
     addu  $13,$11,$12  # Adds the values in registers 11 and 12 and assigns the value to register 13
     ori   $14,$0,6     # Assigns the integer 6 to register 14
     addu  $10,$13,$14  # Adds the values in registers 13 and 14 and assigns the value to register 10
