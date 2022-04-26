## CS 254 Program 9
##
##Write a program that prompts the user for a temperature in Celsius
##
## Programmer: Alistair Chambers
## Date: 04/23/22
##Register use table:
##                   a0=data
##                   v0=syscall functions
##                   $f0=input
##                   $f3=9=a
##                   $f4=5=bb
##                   $f5=32.0=c
##                   $f6=a/bb
##                   $f7=(a/bb)/celcius
##                   $f8=(a/bb)/celcius + c
##                   $f9=celcius input
##                   $f12=output
##


    .text
    .globl  main

    init:
    li               $v0,  4             #  sets system to print string
    la               $a0, prompt         # loads prompt from data section and outputs it
    syscall                              # Return control to the os
    li               $v0,  6             #  sets system to read float
    syscall                              # Return control to the os

    mov.s            $f9,$f0             # f9 = f0/input

    l.s              $f3,a               # f3 = a, loads a from data section
    l.s              $f4,bb              # f4 = bb,loads bb from data section
    div.s            $f6,$f3,$f4         # a/bb == f3/f4

    mul.s            $f7,$f9,$f6         # input * (a/bb)== f9*( f3/f4)

    l.s              $f5, c              # loads c from data section
    add.s            $f8,$f7,$f5         # (input * (a/bb))+ c == (f9*( f3/f4))+ f5

    li               $v0,  4             # sets syscall to print string
    la               $a0, output         # loads output from data section and outputs it
    syscall                              # Return control to the os
    mov.s            $f12,$f8            # $f12 = Fahrenheit output/$f8
    li               $v0,2               # print single
    syscall                              # Return control to the os

    li               $v0, 10             # halt
    syscall                              # Return control to the os

                     .data

    prompt:          .asciiz             "Enter Celsius: "

    output:          .asciiz             "Fahrenheit: "

    newline:         .asciiz             "\n"

    a:               .float              9.0

    bb:              .float              5.0

    c:               .float              32.0
##end of file
