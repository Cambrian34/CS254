## CS 254 Program 5
##
## Compute (8xˆ2-3x+12) / (3x2+2x-16)
##
## Programmer: Alistair Chambers
## Date: 03/13/22
##Register use:
##          r7= base register
##          r8=x
##          r9=8xˆ2,8xˆ2-3x,8xˆ2-3x+12
##          r10=3,3x
##          r11=12
##          r12=2,2x
##          r13=16
##          r14=3,3xˆ2,3xˆ2+2x,(3xˆ2+2x-16)
##          r15=xˆ2
##          r16=0
##          r17=1
##          r24=quotient
##          r24=remainder


    .text
    .globl  main



    main:
            lui     $7,0x1000         #Init base register
            lw      $8,0($7)          #loads x

            ori     $9,$0,8           #assigns 18 to register 9
            ori     $10,$0,3          #assigns 18 to register 10
            ori     $11,$0,12         #assigns 18 to register 11
            ori     $14,$0,3          #assigns 18 to register 14
            ori     $12,$0,2          #assigns 18 to register 12
            ori     $13,$0,16         #assigns 18 to register 13


            mult    $8, $8            #xˆ2
            mflo    $15               #$15= xˆ2

            mult    $15, $9           # 8xˆ2
            mflo    $9                #$9=8xˆ2

            mult    $10, $8           # 3x
            mflo    $10               #$10=3x


            sub     $9, $9, $10       #$9=8xˆ2-3x
            add     $9, $9, $11       #$9=8xˆ2-3x+12

            mult    $14, $15          #3xˆ2
            mflo    $14               # $14=3xˆ2
            sll     $0,$0,0           #nop

            mult    $12, $8           #$12=2x
            mflo    $12               # $12=2x
            sll     $0,$0,0           #nop

            add     $14, $14, $12     # $14 = 3xˆ2+2x
            sub     $14, $14, $13     # $14 = (3xˆ2+2x-16)

            ori     $16,$0,0          #$16=0

            bne     $14, $16,cont     # if  denominator != 0 then branch to cont
            sll     $0,$0,0           #nop
            ori     $17,$0,1          #$17=1

            sw      $17, 4($7)        # Stores 1 in data error
            j       end               # jump to end




    cont:
            sw      $16, 4($7)        # Stores 0 in data error
            divu    $9, $14           # (8xˆ2-3x+12) / (3x2+2x-16)
            mflo    $24               # $24=quotient
            mfhi    $25               # $25=remainder
            sll     $0,$0,0           #nop

            sw      $24, 8($7)        #stores quotient in ratio

            sw      $25, 16($7)       #stores remainder in remain
            j       end               # jump to end
    end:
            sll     $0,$0,0           #nop


            .data

x:          .word    -13

error:      .word    1

ratio:      .word    0

remain:     .word    0
##end of file
