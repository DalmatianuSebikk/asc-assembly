.data
    v:              .long 1, 9, 3, 4, 5, 9
    n:              .long 6
    index:          .space 4
    nr_ap:          .space 4
    maxim:          .space 4
    format:         .asciz "(%d, %d)\n"
.text

.global main

main:
    lea             v, %edi
    movl            $0, index
    movl            $1, %ecx
    movl            (%edi, %ecx, 4), %eax   
    movl            %eax, maxim   # maximul = v[0]
    movl            $0, nr_ap

for_loop:
    # conditia de iesire
    movl            index, %ecx
    cmp             n, %ecx
    je              pr_for2

    movl            (%edi, %ecx, 4), %eax
    cmp             maxim, %eax
    jg              modifica_maxim

continua:
    incl            index
    jmp             for_loop

modifica_maxim:
    movl            %eax, maxim
    jmp             continua

pr_for2:
    movl            $0, index

for_loop2:
    movl            index, %ecx
    cmp             n, %ecx
    je              et_exit

    movl            (%edi, %ecx, 4), %eax
    cmp             %eax, maxim
    je              inc_aparitii

continua2:
    incl            index
    jmp             for_loop2

inc_aparitii:
    incl            nr_ap
    jmp             continua2

et_exit:
    pushl           nr_ap
    pushl           maxim
    push            $format
    call            printf
    popl            %ebx
    popl            %ebx
    popl            %ebx

    pushl           $0
    call            fflush
    popl            %ebx

    movl            $1, %eax
    xor             %ebx, %ebx
    int             $0x80











