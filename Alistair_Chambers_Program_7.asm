## CS 254 Program 7
##
##Enter seed and how many random ints are desired.
##
## Programmer: Alistair Chambers
## Date: 04/03/22
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
        li        $v0,4                #  =
        la        $a0, prompt          #
        syscall

        li        $v0,  5        #$v0 = 5
        syscall
        move      $7, $v0        #7=

        li        $v0,4                #  =
        la        $a0, how          #
        syscall

        li        $v0,  5        #$v0 = 5
        syscall
        move      initial, $v0        #7=

#redacted #lw        $7,inputi            # loads input from data
        lw        $12,a                # a
        lw        $13,bb               #bb

        ori       $8,$0,0              #counter
        ori       $24,$0,100

    test:
        lw        $11,initial          # initial value

        sltu      $9,$8,$7             #count <n
        beq       $9,$0,endLp          # if $9== input n then jump to endLp

        sll       $0,$0,0              #nop

        addiu     $8,$8,1              # count increments;
        sll       $0,$0,0              #nop

        j         rand                # jump to test

    rand:

        mult      $11, $12               #  *  = Hi and Lo registers
        mflo      $14                    # copy Lo to

        addu      $14, $14, $13            #  =  +

        div       $14, $24            #  /
        mfhi      $25                   #  =  mod
        sw        $25, initial        #

        sw        $25, out        #

        li        $v0, 4         #$v0  4=

        li        $v0,1                #  =
        la        $a0, out          #
        syscall



        j         test                # jump to test


    endLp:
        li        $v0,4                #  =
        la        $a0, done          #
        sll       $0,$0,0              #nop
        syscall


                  .data

    prompt:       .asciiz     "initial value : "

    done:         .asciiz     "Done"

    how:          .asciiz     "Enter how many: "



    inputi:        .word      20

    initial:      .word       5

    a:            .word       21

    bb:           .word       53

    out:          .word       10


##end of file
