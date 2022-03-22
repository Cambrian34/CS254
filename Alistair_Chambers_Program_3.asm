## CS 254 Program 3
##
## Compute 5x^4 - 2x^3 + 12x^2 - 3x + 10 using Horner's Method
##
## Programmer: Alistair Chambers
## Date: 02/27/22
##Register use:
##          r7=a=5
##          r8=bb=2
##          r9=c=12
##          r10=d=3
##          r11=e=10
##          r12=cx2
##          r13=x2
##          r14=x=5
##          r15=ax4
##          r16=x=5
##          r23=ax^4 - bx^3 + cx^2 - dx + e
##          r24=bbx
##          r25=3x

    .text
    .globl  main



main:
    lw      $14,x          ## get x
    lw      $7,a           ## get a
    lw      $8,bb          ## get bb
    lw      $9,c           ## get c
    lw      $10,d          ## get d
    lw      $11,e          ## get e

    addiu    $16,$14,0     #$16 = x

    mult    $16,$16        # low =x2
    mflo    $13            # $13 =x2

    mult    $13,$13        #low =x4
    mflo    $15            #$15 =x4

    mult    $15,$7         #low = ax4
    mflo    $15            #$15= ax4

    mult    $13,$16        #low =x3
    mflo    $24            #$24 =x3

    mult    $8,$24         # low =bbx3
    mflo    $24            # $24 =bbx3

    mult    $13,$9         #low = cx2
    mflo    $12            #$12 = cx2

    mult    $16, $10       #low = 3x
    mflo    $25            #$25 = 3x

    subu    $23,$15,$24    #5x^4 - 2x^3
    addu    $23,$23,$12    #5x^4 - 2x^3 + 12x^2
    subu    $23,$23,$25    #5x^4 - 2x^3 + 12x^2 - 3x
    addu    $23,$23,$11    #5x^4 - 2x^3 + 12x^2 - 3x + 10




            .data
    x:      .word   5
    a:      .word   5
    bb:     .word   2
    c:      .word   12
    d:      .word   3
    e:      .word   10
