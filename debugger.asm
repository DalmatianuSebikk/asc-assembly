.data
    x: .long 15
.text
.globl _start

_start:
    movl x, %eax
    movl $0, %eax
    movl x, %ebx

    # inchiderea 
    mov $1, %eax
    mov $0, %ebx
    int $0x80
