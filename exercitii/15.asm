.data
    factorialul:        .space 4
    index:              .space 4
    format:             .asciz "%d"
    n:                  .space 4
.text

.global main

main:
    # citim n
    pushl           $n
    push            $format
    call            scanf
    popl            %ebx
    popl            %ebx

    movl            $1, index
    movl            $1, factorialul

for_inmultire:
    # conditia de oprire
    movl            index, %ecx
    cmp             n, %ecx
    jg              et_exit

    movl            factorialul, %eax
    movl            index, %ebx
    mull            %ebx
    movl            %eax, factorialul

    incl            index
    jmp             for_inmultire

et_exit:
    # print
    pushl           factorialul
    push            $format
    call            printf
    popl            %ebx
    popl            %ebx

    pushl           $0
    call            fflush
    popl            %ebx

    movl            $1, %eax
    xor             %ebx, %ebx
    int             $0x80





