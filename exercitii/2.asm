.data
    pozitiv: .asciz "Pozitiv\n"
    negativ: .asciz "Negativ\n"
    zero: .asciz "Zero\n"
.text

.globl _start

_start:
    mov $-1, %eax
    mov $0, %ebx

    cmp %ebx, %eax
    jg nr_pozitiv
    je egal_cu_zero
    jl nr_negativ

    mov $1, %eax
    mov $0, %ebx
    int $0x80

egal_cu_zero:
    mov $4, %eax
    mov $1, %ebx 
    mov $zero, %ecx
    mov $10, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

nr_negativ:
    mov $4, %eax
    mov $1, %ebx 
    mov $negativ, %ecx
    mov $10, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

nr_pozitiv:
    mov $4, %eax
    mov $1, %ebx 
    mov $pozitiv, %ecx
    mov $10, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80


