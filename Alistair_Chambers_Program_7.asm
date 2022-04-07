## CS 254 Program 7
##
##Enter seed and how many random ints are desired.
##
## Programmer: Alistair Chambers
## Date: 04/03/22
##Register use:
##          r7=user input of max
##          r8=counter
##          r9=scratch
##          r11=user input initial value,rand
##          r12=21
##          r13=53
##          r14= rand * a
##          r15= rand * a + b
##          r24=100
##          r25=(randi*a+b)%100
##          a0=data
##          v0=syscall functions


    .text
    .globl  main


    init:
        li        $v0,4              # sets syscall to print string
        la        $a0, prompt        # Outputs initial value: in console
        syscall                      # Return control to the os

        li        $v0,5              #sets syscall to read integer and reads user input from console
        syscall                      # Return control to the os
        sw        $v0, initial       # saves value in v0 in data section under initial

        move      $11, $v0           #moves value in v0 to $11
        nop                          #nop

        li        $v0,4              # sets syscall to print string
        la        $a0, space         #loads and outputs spcae from data section
        syscall                      # Return control to the os

        li        $v0,4              #sets syscall to print string
        la        $a0, how           #loads and outputs how from data section
        syscall                      # Return control to the os
        nop                          #nop

        li        $v0,5              #sets syscall to read integer
        syscall
        sw        $v0, max           #saves value in v0 to max under data section


        lw        $12,a              #loads a
        lw        $13,bb             #loads bb
        ori       $8,$0,0            #counter
        lw        $24,divi           #loads divi from data section
        lw        $7,max             #loads max from data section

    test:
        lw        $11,initial        # initial value
        sltu      $9,$8,$7           #count <n
        beq       $9,$0,endLp        # if $9 == max then jump to endLp
        sll       $0,$0,0            #nop

        addiu     $8,$8,1            # count increments;

        mult      $11, $12           # $11*$12
        mflo      $14                # rand * a

        addu      $15, $14, $13      # $15 = $14 + $13

        div       $15, $24           #  $15/$24
        mfhi      $25                # mod

        sw        $25, initial       #saves value in $25 to initial under data section

        li        $v0,1              # sets syscall to print integer
        move      $a0, $25           #assigns value in $25 to  $a0
        syscall                      # Return control to the os

        li        $v0,4              # sets syscall to print string
        la        $a0, space         #loads space from data section and outputs it
        syscall                      # Return control to the os

        j         test               # jump to test
        nop                          #nop

    endLp:
        li        $v0,4              # sets syscall to print string
        la        $a0, done          #loads done from data section and outputs it
        sll       $0,$0,0            #nop
        li $v0,10                    # halt syscall
        syscall                      # Return control to the os


                  .data

    prompt:       .asciiz           "initial value : "

    done:         .asciiz           "Done"

    how:          .asciiz           "Enter how many:  "

    space:        .asciiz           "\n"

    out:          .asciiz           " "

    initial:      .word             0

    max:          .word             0

    a:            .word             21

    bb:           .word             53

    divi:         .word             100


##end of file
