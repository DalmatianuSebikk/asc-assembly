.data
    # Declararea variabilelor programului
    # nume_variabila: .tip valoare
.text
    # Aici incepe codul propriu zis
    salut: .asciz "Salut!\n"
    
    # Definim _start ca fiind o eticheta globala reprezentand entry-ul in programul nostru
.globl _start

_start:
    # aici se scrie programul principal, echivalent cu main
    # afisam pe ecran o data
    mov $4, %eax
    mov $1, %ebx
    mov $salut, %ecx
    mov $7, %edx
    int $0x80

    # oprirea programului
    mov $1, %eax
    mov $0, %ecx
    int $0x80

