.data
    v:          .long 4, 5, 6
    sum:        .space 4
    media:      .space 4
    index:      .space 4
    n:          .long 3
    format:     .asciz "(%d, %d)\n"
.text

.global main

main:
    lea         v, %edi
    movl        $0, index
    movl        $0, sum
    movl        $0, media
    
for_loop:
    # conditie de iesire
    movl        index, %ecx
    cmp         %ecx, n
    je          calcule_final

    movl        sum, %eax
    add         (%edi, %ecx, 4), %eax
    movl        %eax, sum

    incl        index
    jmp         for_loop

calcule_final:
    # aici calculez media
    movl        sum, %eax
    movl        n, %ebx
    movl        $0, %edx
    divl        %ebx

    movl        %eax, media
    jmp         et_exit

et_exit:
    # print suma, print media

    pushl       media
    pushl       sum
    push        $format
    call        printf
    popl        %ebx
    popl        %ebx
    popl        %ebx

    pushl       $0
    call        fflush
    popl        %ebx

    movl        $1, %eax
    xor         %ebx, %ebx
    int         $0x80








