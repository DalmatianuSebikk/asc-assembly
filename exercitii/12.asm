.data
    n:          .space 4
    format:     .asciz "%d"
    termen1:    .space 4
    termen2:    .space 4
    termen3:    .space 4
    index:      .space 4
.text

.global main

main:
    # citirea lui n
    pushl           $n
    push            $format
    call            scanf
    popl            %ebx
    popl            %ebx

    # declararea primilor termeni din Fibonacci
    movl            $0, termen1
    movl            $1, termen2
    sub             $2, n
    movl            $0, index

generare_Fibonacci:
    # termen3 = termen1 + termen2
    # termen1 = termen2
    # termen2 = termen3

    movl            index, %ecx
    cmp             n, %ecx
    je              et_exit

    movl            $0, %ebx
    add             termen1, %ebx
    add             termen2, %ebx
    movl            %ebx, termen3       # termen3 = termen1 + termen2

    movl            termen2, %ebx
    movl            %ebx, termen1       # termen1 = termen2

    movl            termen3, %ebx
    movl            %ebx, termen2       # termen2 = termen3

    incl            index
    jmp             generare_Fibonacci

et_exit:
    # print si pa
    pushl           termen3
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


