.data
    x:              .long 27
    x_inversat:     .space 4
    aux:            .space 4
    aux2:           .space 4
    rest:           .space 4
    formatPrintf:   .asciz "%d\n"
.text
# 3. Procedura care primeste un numar natural si care intoarce in %eax valoarea 1 
# daca numarul dat ca argument este palindrom, respectiv 0, altfel.
# 1331 -> 1 
# 272 -> 1
# 27 -> 0

.global main

palindromix:
    pushl       %ebp
    movl        %esp, %ebp

    movl        8(%ebp), %eax
    movl        %eax, aux
    movl        %eax, aux2
    movl        $0, x_inversat

    # int x, x_inversat = 0, aux, aux2, p = 1;
    # cin >> x;

    # while(x){
    #    x_inversat = x % 10 + x_inversat * 10;
    #    x /= 10;
    # }

    et_while:
        movl    aux, %eax
        cmp     $0, %eax
        je      compara

        # x_inversat = x % 10 + x_inversat * 10;

        # x_inversat * 10
        movl    $0, %edx

        movl    x_inversat, %eax
        movl    $10, %ebx

        mull    %ebx
        movl    %eax, x_inversat

        # x % 10
        movl    $0, %edx

        movl    aux, %eax
        movl    $10, %ebx

        # x % 10 + x_inversat * 10
        divl    %ebx
        addl    %edx, x_inversat

        movl    %eax, aux

        jmp     et_while

    compara:
        movl    aux2, %eax
        movl    x_inversat, %ebx
        cmp     %ebx, %eax

        je      pun_1
        jne     pun_0

    pun_0:
        movl    $0, %eax
        jmp     gata

    pun_1:
        movl    $1, %eax
        jmp     gata

    gata:
        popl    %ebp
        ret

        

main:
    pushl   x
    call    palindromix
    popl    %ebx

    pushl   %eax
    pushl   $formatPrintf
    call    printf
    popl    %ebx
    popl    %ebx

    pushl   $0
    call    fflush
    popl    %ebx

exit:
    movl    $1, %eax
    xor     %ebx, %ebx
    int     $0x80

