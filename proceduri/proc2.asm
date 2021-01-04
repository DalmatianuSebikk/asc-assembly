.data
    contor:         .space 4
    x:              .long 10
    aux:            .space 4
    formatPrint:    .asciz "%d\n"
.text
# 2. Procedura care primeste un numar natural si care intoarce numarul de biti
# egali cu 1 din reprezentarea binara.
# 7  -> 3 
# 10 -> 2 

.global main

nr_biti:
    pushl       %ebp
    movl        %esp, %ebp

    movl        8(%ebp), %eax
    

    movl        $0, contor

    et_while:
        cmp     $0, %eax
        je      printuleanu

        movl    $0, %edx
        movl    $2, %ebx
        divl    %ebx

        cmp     $1, %edx
        je      contorincl
        jne     continuare_et_while

        contorincl:
            incl    contor
            jmp     continuare_et_while

        continuare_et_while:
            jmp     et_while

    printuleanu:
        pushl   contor
        pushl   $formatPrint
        call    printf
        popl    %ebx
        popl    %ebx

        pushl   $0
        call fflush
        popl    %ebx

    popl    %ebp
    ret

main:
    pushl   x
    call    nr_biti
    popl    %ebx

exit:
    movl    $1, %eax
    xor     %ebx, %ebx
    int     $0x80

