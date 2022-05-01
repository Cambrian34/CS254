## CS 254 Program 10
##
##Write a program that prompts the user for the value x, reads the value, calculates sin(x), and prints the value
##
## Programmer: Alistair Chambers
## Date: 04/30/22
##Register use table:
##                   a0=data
##                   v0=syscall functions
##                   $f0=sys input
##                   $f1= sum
##                   $f2=counter
##                   $f3=n-1
##                   $f4=n*(n-1)
##                   $f5=a/bb
##                   $f6=(a/bb)/celcius
##                   $f7=term = term*-(xˆ2/(n(n-1))
##                   $f8=-(xˆ2/(n(n-1))
##                   $f9= x/ input
##                   $f10=term
##                   $f11=a =1.0
##                   $f12=sys output
##


    .text
    .globl  main

    init:
    li               $v0,  4             #  sets system to print string
    la               $a0, prompt         # loads prompt from data section and outputs it
    syscall                              # Return control to the os
    li               $v0,  6             #  sets system to read float
    syscall                              # Return control to the os
    mov.s            $f9,$f0             # f9 = f0/input/x
    mov.s            $f10,$f9            # $f10/term = input/x
    l.s              $f11,a              # $f11 = a/ 1.0


    ori              $7,$0,3             # counter
    ori              $8,$0,23            # count end variable  + 2

    mov.s            $f1,$f9             # sum = x/input

    loop:
    beq              $7, $8, endlp       # if  r7==r8  then branch to endLp
    nop

    mtc1             $7,$f0              #Converts
    cvt.s.w          $f0,$f0             #count from int
    mov.s            $f2, $f0            #to float

    sub.s            $f3,$f2,$f11        #n-1
    mul.s            $f4,$f2,$f3         #n*(n-1)

    mul.s            $f5,$f9,$f9         #xˆ2
    div.s            $f6,$f5,$f4         #xˆ2/(n(n-1))
    neg.s            $f8,$f6             #-(xˆ2/(n(n-1))
    mul.s            $f7,$f8,$f10        #f7/term = term*-(xˆ2/(n(n-1))

    mov.s            $f10,$f7            #term += f7
    add.s            $f1,$f1,$f7         #sum+= term

    addu             $7,$7,2             #increments counter

    j                loop                # jump to loop
    nop                                  #nop

    endlp:
    li               $v0,  4             # sets syscall to print string
    la               $a0, output         # loads output from data section and outputs it
    syscall                              # Return control to the os
    mov.s            $f12,$f1            # $f12 = Fahrenheit output/$f8
    li               $v0,2               # print single
    syscall                              # Return control to the os

    li               $v0, 10             # halt
    syscall                              # Return control to the os

                     .data

    prompt:          .asciiz             "Enter x: "

    output:          .asciiz             "Sin(x): "

    newline:         .asciiz             "\n"

    sum:             .float              0.0

    a:               .float              1.0
##end of file
