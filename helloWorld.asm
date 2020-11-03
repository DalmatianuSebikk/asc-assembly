.data
    helloWorld: .asciz "Hello!\n"
.text
.globl _start

_start:
    # pentru a afisa Hello World avem nevoie de 2 functii (care au un cod de functie):
    #   - SYSTEM CALL (pentru intreruperea rularii programului) 
    #   - PRINT 
    # si 3 argumente, %eax, %ebx, %ecx
    mov $4, %eax
    mov $1, %ebx
    mov $helloWorld, %ecx
    mov $9, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80


