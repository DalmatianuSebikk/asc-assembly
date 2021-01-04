.data
    x:              .long 59
    aux:            .space 4
    putere:         .space 4
    numar:          .space 4
    formatPrint:    .asciz "%d\n"
.text
# 1. Procedura care primeste ca argument un numar natural si care 
# intoarce cea mai mica putere a lui 2, mai mare decat numarul dat.
# 15 -> 4 pentru ca 2^4 (=16) >= 15
# 32 -> 5 pentru ca 2^5 (=32) >= 32
# 59 -> 6 pentru ca 2^6 (=64) >= 59

.global main

puteri:
    pushl       %ebp
    movl        %esp, %ebp

    # mutam pe x in eax
    movl        8(%ebp), %eax
    movl        %eax, aux

    movl        $1, %eax
    movl        $0, putere

    et_while:
        movl    aux, %ecx
        cmp     %eax, %ecx
        jbe     printuleanu

        movl    $2, %ebx
        mull    %ebx

        incl    putere
        jmp     et_while

    
    printuleanu:
        pushl   putere
        pushl   $formatPrint
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
    call    puteri
    popl    %ebx

exit:
    movl    $1, %eax
    xor     %ebx, %ebx
    int     $0x80



