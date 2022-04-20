## CS 254 Program 9
##
##Write a program that prompts the user for a temperature in Celsius
##
## Programmer: Alistair Chambers
## Date: 04//22
##Register use table:
##                a0=data
##                v0=syscall functions
##                $7=
##                $8=
##                $9=
##                $10=
##                $11=
##                $15=
##


    .text
    .globl  main

    init:
    li               $v0,  4       #  =
    la               $a0, prompt        #
    syscall
    li               $v0,  6       #  =
    syscall


    mov.s            $f9,$f0


    l.s              $f3,a
    l.s              $f4,bb
    div.s            $f6,$f3,$f4

    mul.s            $f7,$f9,$f6

    l.s              $f5, c
    add.s            $f8,$f7,$f5


    endLp:

    li               $v0,  4             #  =
    la               $a0, output         #
    syscall
    mov.s            $f12,$f8            # $f12 = argument
    li               $v0,2               # print single
    syscall
    li               $v0,  4             #  =
    la               $a0, output         #
    syscall
    li               $v0, 10
    syscall

                     .data

    prompt:          .asciiz             "Enter Celsius: "

    output:          .asciiz             "Fahrenheit: "

    newline:         .asciiz             "\n"

    a:               .float              9.0

    bb:              .float              5.0

    c:               .float              32.0
##end of file
