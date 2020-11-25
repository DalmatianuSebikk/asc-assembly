.data
    n:                  .space 4 
    index:              .space 4
    numar_divizori:     .space 4
    formatScan:         .asciz "%d"
    formatPrint:        .asciz "%s"
    nAre:               .asciz "Nu are divizori\n"
    are:                .asciz "Are divizori\n"
.text
.global main

main:

    # citim numarul: scanf("%d", &n)
    pushl       $n
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx

    movl        $2, index
    movl        $0, numar_divizori

parcurgere_pana_la_n:
    movl        index, %ecx
    cmp         n, %ecx
    je          verificare_nr_div

    movl        n, %eax
    movl        $0, %edx
    divl        index

    cmp         $0, %edx
    je          incrementeaza_nr_div

continua:
    incl        index
    jmp         parcurgere_pana_la_n

incrementeaza_nr_div:
    incl        numar_divizori
    jmp         continua

verificare_nr_div:
    movl        numar_divizori, %ecx
    cmp         $0, %ecx
    je          nu_are_divizori
    jg          are_divizori

nu_are_divizori:
    # afisez mesajul nu are divizori
    push        $nAre
    push        $formatPrint
    call        printf
    popl        %ebx
    popl        %ebx

    pushl       $0
    call        fflush
    popl        %ebx
    jmp         et_exit

are_divizori:
    # afisez mesajul are divizori
    push        $are
    push        $formatPrint
    call        printf
    popl        %ebx
    popl        %ebx

    pushl       $0
    call        fflush
    popl        %ebx
    jmp         et_exit

et_exit:
    movl        $1, %eax
    xor         %ebx, %ebx
    int         $0x80





