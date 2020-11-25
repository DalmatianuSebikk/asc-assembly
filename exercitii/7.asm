.data
    n:                  .space 4
    maxim:              .space 4
    nr_biti:            .space 4
    format:             .asciz "%d"

.text

.global main

main:
    movl                $0, nr_biti
    movl                $0, maxim

    # citesc n
    pushl               $n
    push                $format
    call                scanf
    popl                %ebx
    popl                %ebx

    movl                $2, %ebx

for_impartiri:
    movl                n, %eax
    cmp                 $0, %eax
    je                  verificare_maxim_finala

    movl                $0, %edx
    divl                %ebx
    cmp                 $1,%edx
    je                  incrementare_bit
    jne                 verificare_maxim
    
continua:
    movl                %eax, n
    jmp                 for_impartiri

incrementare_bit:
    incl                nr_biti
    jmp                 continua

verificare_maxim:
    movl                nr_biti, %edx
    cmp                 maxim, %edx
    jg                  modificare_maxim

modificare_maxim:
    # maxim = nr_biti
    movl                nr_biti, %edx
    movl                %edx, maxim

    movl                $0, %edx
    movl                %edx, nr_biti

    jmp                 continua

verificare_maxim_finala:
    movl                nr_biti, %edx
    cmp                 maxim, %edx
    jg                  modificare_maxim_finala

modificare_maxim_finala:
    # maxim = nr_biti
    movl                nr_biti, %edx
    movl                %edx, maxim


et_exit:
    pushl               maxim
    push                $format
    call                printf
    popl                %ebx
    popl                %ebx

    pushl               $0
    call                fflush
    popl                %ebx

    movl                $1, %eax
    xor                 %ebx, %ebx
    int                 $0x80



    



