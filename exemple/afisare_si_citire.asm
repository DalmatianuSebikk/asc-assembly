.data
    n: .space 4
    formatInt: .asciz "%d"
.text

.global main

main:
    # scanf(%d, $n)
    push $n
    push $formatInt
    call scanf
    popl %ebx
    popl %ebx

    # printf(%d, n)
    pushl n
    push $formatInt
    call printf
    popl %ebx
    popl %ebx

    pushl $0
    call fflush
    popl %ebx


exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
