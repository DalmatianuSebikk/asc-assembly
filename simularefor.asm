.data
    n: .long 5
    s: .space 4
.text
    # Putem simula forul cu cicluri de salt si etichete 
.globl _start

_start:
    mov $0, %ecx # registrul pentru contor

etloop: # INCEPEREA SIMULARII FORULUI
    cmp n, %ecx
    je etexit # daca s egali, pa
    
    add %ecx, s # s += %ecx, poti sa consideri forul o suma gauss pana la n - 1
    add $1, %ecx # ecx += 1

    jmp etloop

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

