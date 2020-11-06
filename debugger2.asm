.data
.text
.globl _start

_start:
    movl $0, %eax
    mov $1, %al

    # inchide
    mov $1, %eax
    mov $0, %ebx
    int $0x80
