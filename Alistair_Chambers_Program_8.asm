## CS 254 Program 8
##
##Determine if user-entered number is a perfect number.
##
## Programmer: Alistair Chambers
## Date: 04//22
##Register use:
##          r7=
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


                 .data

    prompt:      .asciiz           "Enter number : "


    is:          .asciiz           "is perfect "

    space:       .asciiz           "\n"

    isnot:       .asciiz           "is not perfect "



##end of file
