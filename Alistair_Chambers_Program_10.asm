## CS 254 Program 9
##
##Write a program that prompts the user for the value x, reads the value, calculates sin(x), and prints the value
##
## Programmer: Alistair Chambers
## Date: /22
##Register use table:
##                   a0=data
##                   v0=syscall functions
##                   $f0=input
##                   $f2=sum
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
    l.s              $f10,sum         # $f2 =

    ori              $7,$0,3             # counter
    ori              $8,$0,21

#########################################################################################
    loop:
    beq              $7, $21, endLp       # if  r7==r8  then branch to endLp

    j                preter                # jump to preter
    nop

    preter:
    mtc1             $7,$f0
    cvt.s.w          $f0,$f0
    mov.s            $f3, $f0        #  =

    sub.s            $f4,$f3,1.0
    mul.s            $f5,$f4,$f3        #
    mul.s            $f6,$f5,$f3        #
    mul.s            $f7,$f6,$f3        #

    div.s            $f8, $f7            #  /


    neg              $f10,$f8

    addu             $7,$7,2

    j        loop                # jump to loop
    nop

#########################################################################################
    endlp:
    li               $v0,  4             # sets syscall to print string
    la               $a0, output         # loads output from data section and outputs it
    syscall                              # Return control to the os
    mov.s            $f12,$f8            # $f12 = Fahrenheit output/$f8
    li               $v0,2               # print single
    syscall                              # Return control to the os

    li               $v0, 10             # halt
    syscall                              # Return control to the os

                     .data

    prompt:          .asciiz             "Enter x: "

    output:          .asciiz             "Sin(x): "

    newline:         .asciiz             "\n"

    sum:             .float              0
##end of file
