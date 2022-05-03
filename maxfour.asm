## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer:Alistair Chambers
## Date:
##
## Register use table:

.text
.globl  main

main:
    jal        pread                # jump to pread and save position to $ra
    nop
    move       $s0, $v0        #s0=

    jal        pread                # jump to pread and save position to $ra
    nop
    move       $s1, $v0        #s0=

    jal        pread                # jump to pread and save position to $ra
    nop
    move       $s2, $v0        #s0=

    jal        pread                # jump to pread and save position to $ra
    nop
    move       $s3, $v0        #s0=
equiv0:
bgt        $s0, $s1, greater1s0    # if  >  then
nop
equiv1:
bgt        $s1, $s0, greater1s1    # if  >  then
nop
equiv2:
bgt        $s2, $s0, greater1s2    # if  >  then
nop
equiv3:
bgt        $s3, $s0, greater1s3    # if  >  then
nop









greater1s0:
    bgt        $s0, $s2, greater2s0    # if  >  then
    nop
    j               equiv1         # jump to
    nop

greater1s1:
    bgt        $s1, $s2, greater2s1    # if  >  then
    nop
    j        equiv2               # jump to
    nop

greater1s2:
    bgt        $s2, $s1, greater2s2    # if  >  then
    nop
    j        equiv3                # jump to
    nop

greater1s3:
    bgt        $s3, $s1, greater2s3    # if  >  then
    nop
    j        equiv                # jump to equiv
    nop

greater2s0:
    bgt        $s0, $s3, ans    # if  >  then
    move     $15, $s0        #  =
    j        equiv1                # jump to
    nop

greater2s1:
    bgt       $s1, $s3, ans    # if  >  then
    move     $15, $s1        #  =
    j        equiv2                # jump to
    nop
greater2s2:
    bgt       $s2, $s3, ans    # if  >  then
    move      $15, $s2        #  =
    j        equiv3                # jump to
    nop
greater2s3:
    bgt        $s3, $s2, ans    # if  >  then
    move       $15, $        #  =
    j        equiv                # jump to
    nop



ans:
    li        $v0,4           #  =
    la        $a0, end        #
    syscall

    li        $v0,1         #$v0 1=
    move      $a0, $15        #  =
    syscall



endpr:
    li        $v0,10         #v0=10




    .data
end:   .asciiz      "The answer is:"
