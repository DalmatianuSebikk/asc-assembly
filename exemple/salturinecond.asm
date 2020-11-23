.data
    text1: .asciz "Text 1 \n"
    text2: .asciz "Text 2 \n"
.text
    # saltul neconditional => Sari direct la o anumita secventa de cod data de eticheta (??)
    # Sintaxa: jmp et
.globl _start
    
_start:
    jmp et2
    mov $4, %eax
    mov $1, %ebx
    mov $text2, %ecx
    mov $9, %edx
    int $0x80

et2:
    mov $4, %eax
    mov $1, %ebx
    mov $text1, %ecx
    mov $9, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ecx
    int $0x80

