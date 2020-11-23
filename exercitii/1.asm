# ex 1: A, B, C, F, 11 
.data
    x: .space 4
    y: .space 4
    z: .space 4
    aux1: .space 4
    aux2: .space 4
.text

.globl _start

_start:
    # A: ECX <- EAX + EBX - ECX -> ECX = EAX + EBX - ECX

    # mov $10, %eax
    # mov $11, %ebx
    # mov $1, %ecx

    # add %eax, %edx
    # add %ebx, %edx
    # sub %ecx, %edx
    # mov %edx, %ecx

    # SAU VARIANTA FARA %EDX : SCAZI PE ECX FIE DIN EAX FIE DIN EBX

    # sub %ecx, %ebx
    # add %ebx, %eax
    # mov %eax, %ecx


    # B: EBX ← ((EAX × 2 + EBX) × 2 + ECX)/2 => EBX <- EAX x 2 + EBX + ECX/2

    # mov $1, %eax
    # mov $1, %ebx
    # mov $1, %ecx

    # mov %eax, x
    # mov %ebx, y

    # mov $2, %ebx   
    # imul %ebx

    # add %eax, y # am rezolvat pana acum EAX x 2 + EBX

    # mov %ecx, %eax
    # mov $2, %ebx
    # idiv %ebx

    # add %eax, y
    # mov y, %ebx
    

    # C: EAX ← (EAX + EBX + ECX) × 16

    # mov $1, %eax
    # mov $2, %ebx
    # mov $3, %ecx

    # add %eax, %ecx
    # add %ebx, %ecx

    # mov %ecx, x # AM MUTAT EAX + EBX + ECX IN X
    # mov x, %eax
    # mov $16, %ebx
    # imul %ebx # AM INMULTIT CU 16


    # F: EAX ← (EAX + EBX)/(EAX + ECX)

    # mov $1, %eax
    # mov $1, %ebx
    # mov $1, %ecx

    # EAX + EBX SALVAT IN X
    # movl $0, x
    # add %eax, x
    # add %ebx, x

    # EAX + ECX SALVAT IN Y
    # movl $0, y
    # add %eax, y
    # add %ecx, y

    # EAX = X / Y
    # mov x, %eax
    # mov y, %ebx
    # idiv %ebx

    # 11: EAX ← EAX×((EAX+EBX)/ECX+1)

    # mov $1, %eax
    # mov $1, %ebx
    # mov $1, %ecx

    # mov %eax, aux1

    # EAX + EBX
    # movl $0, x
    # add %eax, x
    # add %ebx, x

    # (EAX + EBX)/ECX
    # mov x, %eax
    # mov %ecx, %ebx
    # idiv %ebx

    # MUT SI MAI ADAUG UN 1
    # mov %eax, x
    # add $1, x

    # inmultesc cu EAX UL DIN FATA
    # mov aux1, %eax
    # mov x, %ebx
    # imul %ebx


    # INCHIDEREA
    mov $1, %eax
    mov $0, %ebx
    int $0x80

    


