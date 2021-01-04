.data
    aux:        .space 4
    n:          .long 4
    alt_n:      .space 4
    x:          .space 4
    y:          .space 4
    z:          .space 4
    contor:     .space 4
    format:     .asciz  "%d\n"
.text
/*
5. Procedura care primeste un numar natural n si 
intoarce al n-lea termen al sirului lui Fibonacci. (de la 0 1)
n = 0 -> 0
n = 1 -> 1 
n = 2 -> 1 
n = 3 -> 2 
n = 4 -> 3 
n = 5 -> 5
n = 6 -> 8 ...
*/

.global main

fibo:
    /*
    int x, y, z, contor = 0, n;
    cin >> n;

    if(n == 0) cout << 0;
    if(n == 1) cout << 1;
    else{
        x = 0;
        y = 1;
        for(int i = 1; i < n; i++){
            z = x + y;
            x = y;
            y = z;
        }
        cout << z;
    }
    */
    pushl       %ebp
    movl        %esp, %ebp
    movl        8(%ebp), %eax
    movl        %eax, alt_n

    cmp         $0, %eax
    je          afisez_0

    cmp         $1, %eax
    je          afisez_1
    jne         else

    afisez_0:
        pushl   $0
        pushl   $format
        call    printf
        popl    %ebx
        popl    %ebx

        pushl   $0
        call    fflush
        popl    %ebx

        jmp     gata

    afisez_1:
        pushl   $0
        pushl   $format
        call    printf
        popl    %ebx
        popl    %ebx

        pushl   $0
        call    fflush
        popl    %ebx

        jmp     gata


    
    else:
        movl        $0, x
        movl        $1, y
        movl        $1, contor
        movl        alt_n, %eax

        for_loop:
            movl        contor, %ecx
            cmp         %ecx, %eax
            je          gata

            /*
            z = x + y;
            x = y;
            y = z;
            */

            # z = x + y
            movl    x, %edx
            addl    y, %edx
            movl    %edx, z

            movl    y, %ebx
            movl    %ebx, x

            movl    z, %ebx
            movl    %ebx, y

            incl        contor
            jmp         for_loop

    gata:
        pushl   z
        pushl   $format
        call    printf
        popl    %ebx
        popl    %ebx

        pushl   $0
        call    fflush
        popl    %ebx

        popl    %ebp
        ret



main:
    pushl   n
    call    fibo
    popl    %ebx

exit:
    movl    $1, %eax
    xor     %ebx, %ebx
    int     $0x80
