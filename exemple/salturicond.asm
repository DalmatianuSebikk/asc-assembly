.data
    a: .word 5
    b: .word -3
    text1: .asciz "a >= b \n"
    text2: .asciz "a < b \n"
.text
    # Sintaxa: j<conditie> eticheta
    # Daca este indeplinita conditia, atunci sare la eticheta. Altfel, continua cu urmatoarea linie
    # pot fi testate flagurile dar si operatorii relationali (<, <=, ==, !=, =>, >)

    # OPERATORI PENTRU SALTURILE CONDITIONATE:

    # OPERATORI PENTRU FLAGURI:
    # jc -> jump if carry
    # jnc -> jump if not carry
    # jo -> jump if overflow
    # jno -> jump if not overflow
    # jz -> jump if zero
    # jnz -> jump if not zero
    # js -> jump if sign
    # jns -> jump if not sign

    # OPERATORI PENTRU NUMERE FARA SEMN:
    # jb -> jump if below (op1 < op2)
    # jbe -> jump if below or equal (op1 <= op2)
    # ja -> jump if above (op1 > op2)
    # jae -> jump if above or equal (op1 >= op2)

    # OPERATORI PENTRU NUMERE CU SEMN:
    # jl -> jump if less (op1 < op2)
    # jle -> jump if less or equal (op1 <= op2)
    # jg -> jump if greater (op1 > op2)
    # jge -> jump if greater or equal (op1 >= op2)

    # OPERATORI PENTRU EGALITATE:
    # je -> jump if equal (op1 == op2)
    # jne -> jump if not equal (op1 != op2)
.globl _start

_start:
    mov a, %eax
    mov b, %ebx
    cmp %eax, %ebx # compari eax cu ebx
    jge et

    mov $4, %eax
    mov $1, %ebx
    mov $text1, %ecx
    mov $9, %edx
    int $0x80

et:
    mov $4, %eax
    mov $1, %ebx
    mov $text2, %ecx
    mov $9, %edx
    int $0x80

    # inchiderea
    mov $1, %eax
    mov $0, %ebx
    int $0x80

