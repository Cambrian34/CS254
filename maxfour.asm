## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer:Alistair Chambers
## Date:
##
## Register use table:
##          r7=user input 1
##          r8=user input 2
##          r9=user input 3
##          r10=user input4
##          r15= max
##          a0 = data
##          v0 = syscall functions
##


    .text
    .globl    main

main:
    jal       pread               # jump to pread and save position to $ra
    nop                           # nop
    move      $7,$v0              # move input from v0 to r7

    jal       pread               # jump to pread and save position to $ra
    nop                           # nop
    move      $8,$v0              # move input from v0 to r8

    jal       pread               # jump to pread and save position to $ra
    nop                           # nop
    move      $9,$v0              # move input from v0 to r9

    jal       pread               # jump to pread and save position to $ra
    nop                           # nop
    move      $10,$v0             # move input from v0 to r10
equiv0:
    bgt       $7,$8,greater1s0    # if  r7>r8  then branch
    nop                           # nop
equiv1:
    bgt       $8,$7,greater1s1    # if  r8>r7  then branch
    nop                           # nop
equiv2:
    bgt       $9,$7,greater1s2    # if  r9>r7  then branch
    nop                           # nop
equiv3:
    bgt       $10,$7,greater1s3   # if  r10>r7  then branch
    nop                           # nop

greater1s0:
    bgt       $7,$9,greater2s0    # if  r7>r9  then branch
    nop                           # nop
    j         equiv1              # jump to equiv1
    nop                           # nop

greater1s1:
    bgt       $8,$9,greater2s1    # if  r8>r9  then branch
    nop                           # nop
    j         equiv2              # jump to equiv2
    nop                           # nop

greater1s2:
    bgt       $9,$8,greater2s2    # if  r9>r8  then branch
    nop                           # nop
    j         equiv3              # jump to equiv3
    nop                           # nop

greater1s3:
    bgt       $10,$8,greater2s3   # if  r10>r8  then branch
    nop                           # nop
    j         equiv0              # jump to equiv0
    nop                           # nop

greater2s0:
    bgt       $7,$10,ans1         # if  r7>r10  then branch
    nop                           # nop
    j         ans1                # jump to ans1
    nop                           # nop

greater2s1:
    bgt       $8,$9,ans2          # if  r8>r9  then branch
    nop                           # nop
    j         ans2                # jump to ans2
    nop                           # nop
greater2s2:
    bgt       $9,$10,ans3         # if  r9>r10  then branch
    nop                           # nop
    j         ans3                # jump to ans3
    nop                           # nop
greater2s3:
    bgt       $10,$9,ans4         # if r10>r9  then branch
    nop                           # nop
    j         ans4                # jump to ans4
    nop                           # nop

ans1:
    move      $15, $7             # r15=r7
    j         ans                 # jump to ans
    nop                           # nop

ans2:
    move      $15, $8             # r15=r8
    j         ans                 # jump to ans
    nop                           # nop
ans3:
    move      $15, $9             # r15=r9
    j         ans                 # jump to ans
    nop                           # nop
ans4:
    move      $15, $10            # r15=r10
    j         ans                 # jump to ans
    nop                           # nop

ans:
    li        $v0,4               # sets syscall to print string
    la        $a0, end            # loads end from data section and outputs it
    syscall                       # Return control to the os

    li        $v0,1               # sets syscall to print integer
    move      $a0, $15            # a0 = r15
    syscall                       # Return control to the os

endpr:
    li        $v0,4               # sets syscall to print string
    la        $a0, newline        # loads newline from data section and outputs it
    syscall                       # Return control to the os
    li        $v0,10              # halt system
    syscall                       # Return control to the os

             .data
end:         .asciiz              "The answer is: "

newline:     .asciiz              "\n"
