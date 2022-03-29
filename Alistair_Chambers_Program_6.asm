## CS 254 Program 6
##computes the sum of the odd integers and the sum of even integers from 0 to N.
##
## Programmer: Alistair Chambers
## Date: 03/27/22
##Register use:
##          r7= n
##          r8=count
##          r9=scratch
##          r10=base register
##          r11=2, value used to divide n by
##          r12=floor
##          r13=remainder
##          r14= evensum += count
##          r15= oddsum += count
##          r16=0 used to check if count number is even
##


    .text
    .globl  main


    init:
        lui       $10,0x1000           #base Register
        lw        $7, 0($10)           # loads n from data
        ori       $8,$0,0              #counter
        ori       $11,$0,2             #used to divide n by to check if it odd or even
        ori       $14,$0,0             #stores even sum after each increment
        ori       $15,$0,0             #stores odd sum after each increment
        ori       $16,$0,0             #used to check if even or odd
    test:
        sltu      $9,$8,$7             #count <n
        beq       $9,$0,endLp          # if $9== n then jump to endLp
        sll       $0,$0,0              #nop

        addiu     $8,$8,1              # count increments;

        div       $8, $11              # $8 /$11
        mflo      $12                  # $12= floor($8 /$12 )
        mfhi      $13                  # $13 =  mod

        beq       $13, $16,even       # if  remainder == 0 ,even, then jump to even
        sll       $0,$0,0              #nop
        bne       $13, $16,odd        # if  remainder != 0 ,odd,  then jump to odd
        sll       $0,$0,0              #nop

        j         endLp                # jump to test
        sll       $0,$0,0              #nop

    even:
        addu      $14,$14,$8          # evensum += count
        j         test                # jump to test
        sll       $0,$0,0             #nop

    odd:
        addu      $15,$15,$8          # oddsum += count
        j         test                # jump to test
        sll       $0,$0,0             #nop

    endLp:
        sw        $14,4($10)          #Stores $14 in data under evensum
        sw        $15,8($10)          #Stores $15 in data under oddsum
        sll       $0,$0,0             #nop



                 .data
        N:       .word   12

        evensum: .word   0

        oddsum:  .word   0

##end of file
