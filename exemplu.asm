.data
    # Declararea variabilelor programului
    # nume_variabila: .tip valoare
.text
    # Aici incepe codul propriu zis
    # Definim _start ca fiind o eticheta globala reprezentand entry-ul in programul nostru
.globl _start

_start:
    # aici se scrie programul principal, echivalent cu main
    # oprirea programului
    mov $1, %eax    
    mov $0, %ebx
    int $0x80
