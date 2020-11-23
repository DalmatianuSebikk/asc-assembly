.data

.text

.globl _start


_start:

    movl $6, %eax
    movl $1, %ecx # contor
    movl $2, %ebx
etloop:
    cmp $1, %eax
    je etexit

    
    idiv %ebx
    add %edx, %ecx

    jmp etloop

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
