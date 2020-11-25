.data
.text
.globl _start

_start:

    mov         $2, %eax
    mov         $3, %ebx

    xor         %eax, %ebx
    xor         %ebx, %eax
    xor         %eax, %ebx

    mov         $1, %eax
    mov         $0, %ebx
    int         $0x80
    