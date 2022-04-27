## CS 254 Program 8
##
##Determine if user-entered number is a perfect number.
##
## Programmer: Alistair Chambers
## Date: 04/16/22
##Register use table:
##          a0=data
##          v0=syscall functions
##          $7=input
##          $8=counter
##          $9=$15/$24 ,remainder
##          $10=condition for branch
##          $11=1
##          $15=sum
##


    .text
    .globl  main


    init:
        li        $v0,4              # prompt for the input
        la        $a0,prompt         # syscall
        syscall                      # Return control to the os

        li        $v0,5              # sets syscall to read integer and reads user input
        syscall                      # Return control to the os

        move      $7,$v0             #moves user input to r7

        ori       $8,$0,1            #counter
        ori       $15,$0,0           #sum
        ori       $11,$0,1           #1
        addu      $10,$0,$7         #input
        subu      $10,$10,$11        #r10  = input - 1





    loop:
        beq       $8,$10,condi       # if $9 == max then jump to endLp
        nop                          #nop

        div       $7,$8              #  $15/$24
        mfhi      $9                 # mod


        beq       $9,$0,isper        # if  remainder == 0 then jump to isper
        sll       $0,$0,0            #nop

        addiu     $8,$8,1            # count increments;

        j         loop               # jump to loop
        sll       $0,$0,0            #nop

    isper:
        addu      $15,$15,$8         #  r15= r15 + r8
        addiu     $8,$8,1            # count increments;
        beq       $15, $7,isperf     # if  remainder == 0 ,even, then jump to even
        sll       $0,$0,0            #nop
        j         loop               # jump to loop
        sll       $0,$0,0            #nop

    condi:
        beq       $15, $7,isperf     # if  remainder == 0 ,even, then jump to even
        sll       $0,$0,0            #nop

    isntperf:
        li        $v0,1              #sets syscall to print integer
        move      $a0,$7             #a0 = r7
        syscall                      # Return control to the os

        li        $v0,4              #sets syscall to print string
        la        $a0,isnot          #loads isnot from data section and outputs it
        syscall                      # Return control to the os
        j         endpr              # jump to endpr
        sll       $0,$0,0            #nop

    isperf:
        li        $v0,1              #sets syscall to print integer
        move      $a0,$7             # a0 = r7
        syscall                      # Return control to the os

        li        $v0,4              #sets syscall to print string
        la        $a0,is             #loads is from data section and outputs it
        syscall                      # Return control to the os
        j         endpr              # jump to endpr
        sll       $0,$0,0            #nop

    endpr:

        li        $v0,4              # sets syscall to print string
        la        $a0, space         #loads space from data section and outputs it
        syscall                      # Return control to the os
        li        $v0,10             # halt
        syscall                      # Return control to the os


                 .data

    prompt:      .asciiz             "Enter number : "


    is:          .asciiz             " is perfect !"

    space:       .asciiz             "\n"

    isnot:       .asciiz             " is not perfect "

##end of file
