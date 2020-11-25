.data
    n: .long 3
    index: .space 4
    numar: .space 4
    v: .long 4, 5, 6
    formatInt: .asciz "%d\n"
.text

.global main

main:
    lea v, %edi
    movl $0, index

afisare_elem_vector:
    movl index, %ecx
    cmp %ecx, n
    je et_exit

    movl (%edi, %ecx, 4), %eax

    # printf("%d\n", numar)
    movl %eax, numar

    push numar
    push $formatInt
    call printf
    popl %ebx
    popl %ebx

    pushl $0
    call fflush
    popl %ebx

    incl index
    jmp afisare_elem_vector



et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
