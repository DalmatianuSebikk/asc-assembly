.data
.text
.globl _start

_start:
    # [log2(EAX)]

    mov $8, %eax
    mov $2, %ebx
    mov $0, %ecx

etloop:
    cmp $1, %eax
    je etexit

    idiv %ebx
    add $1, %ecx
    jmp etloop
    
etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80


