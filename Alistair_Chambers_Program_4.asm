## CS 254 Program 3
##
## Compute (13x - 4xy + 18)/7
##
## Programmer: Alistair Chambers
## Date: 03/06/22
##Register use:
##          r7=x
##          r8=y
##          r9=13
##          r10=base register
##          r11=4
##          r12=18
##          r13=7
##          r14=13x
##          r15=xy
##          r16=4xy
##          r17=4xy +18
##          r15=13x - 4xy + 18
##          r24=(13x - 4xy + 18)/7
##          r24=remainder


    .text
    .globl  main



    main:
            lui      $10,0x1000        #  Init base register
            lw       $7,0($10)         # loads x
            lw       $8,0($10)         # loads y

            ori      $9,$0,13          # assigns 13 to register 9
            ori      $11,$0,4          # assigns 4  to register 11
            ori      $12,$0,18         # assigns 18 to register 12
            ori      $13,$0,7          # assigns 7 to register 13

            mult     $9,$7             #13x
            mflo     $14               #low=13x


            mult     $7, $8            #xy
            mflo     $15               #low=xy


            mult     $11,$15           #4xy
            mflo     $16               #low=4xy



            addu     $17,$16,$12       #4xy + 18

            subu     $15, $14, $17     #13x - 4xy + 18

            div      $15, $13          #(13x - 4xy + 18)/7

            mflo     $24               #low = answer
            mfhi     $25               #high = remainder

            sw       $24, 8($10)       ##  Store result in answer
            sw       $25, 16($10)      ##  Store result in remainder



               .data
    x:         .word    12             #  Edit this line to change the value of x

    y:         .word    13             #  Edit this line to change the value of y

    answer:    .word    0              #  Result is placed here.

    remainder: .word    0              #  remainder is placed here.
