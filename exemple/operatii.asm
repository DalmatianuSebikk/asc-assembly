.data
    x: .long 30
    y: .long 7
    sum: .space 4
    dif: .space 4
    prod: .space 4
    cat: .space 4
    restt: .space 4
.text
.globl _start

_start:
    # adunare
    mov x, %eax
    add y, %eax
    mov %eax, sum

    # scadere

    mov x, %eax
    sub y, %eax
    mov %eax, dif

    # inmultire

    mov x, %eax
    mov y, %ebx
    imul %ebx
    mov %eax, prod

    # impartire
    mov x, %eax
    mov y, %ebx
    idiv %ebx
    mov %eax, cat
    mov %edx, restt

    # inchidere
    mov $1, %eax
    mov $0, %ebx
    int $0x80


