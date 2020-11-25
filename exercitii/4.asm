.data
    putere:         .space 4
    nr_nat:         .space 4
.text

.globl _start

_start:
    mov             $6, %eax
    mov             %eax, nr_nat

    # incep for-ul
    mov             $1, %eax
    jmp             etloop


etloop:
    mov             $2, %ebx
    imul            %ebx

    cmp             nr_nat, %eax
    ja              etexit

    jmp             etloop


etexit:
    mov             $1, %eax
    mov             $0, %ebx
    int             $0x80
