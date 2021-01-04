.data
    x:              .long 28
    formatPrint:    .asciz "%d, "
    formatPrint2:    .asciz "%d\n"
    aux:            .space 4
    numar:          .space 4
.text
/* 
4. Procedura care primeste un numar natural si care afiseaza pe ecran toti 
divizorii numarului dat ca argument.
4 -> 1, 2, 4
13 -> 1, 13
28 -> 1, 2, 4, 7, 14, 28*/

.global main

divizori:
    pushl       %ebp
    movl        %esp, %ebp

    movl        8(%ebp), %eax
    movl        %eax, aux
    movl        $1, numar

    et_while:
        movl    aux, %eax
        movl    numar, %ecx
        cmp     %eax, %ecx
        je      gata

        movl    $0, %edx
        divl    %ecx
        cmp     $0, %edx
        je      afisezi
        jne     continui

        afisezi:
            pushl   numar
            pushl   $formatPrint
            call    printf
            popl    %ebx
            popl    %ebx

            pushl   $0
            call    fflush
            popl    %ebx

        continui:
            incl    numar
            jmp     et_while

    gata:
        pushl   numar
        pushl   $formatPrint2
        call    printf
        popl    %ebx
        popl    %ebx

        pushl   $0
        call    fflush
        popl    %ebx
        
        popl    %ebp
        ret


main:
    pushl   x
    call    divizori
    popl    %ebx

exit:
    movl    $1, %eax
    xor     %ebx, %ebx
    int     $0x80



