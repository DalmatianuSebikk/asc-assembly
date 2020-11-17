.data
    lines:      .long 3
    columns:    .long 4
    lineIndex:  .space 4
    columnIndex:.space 4
    sum:        .space 4
    element:    .space 4
    restt:      .space 4
    matrix:     .long 10, 20, 30, 40
                .long 50, 60, 70, 80
                .long 90, 15, 25, 35
                .long 0, 9, 3, 6
                
    formatInt:  .asciz "%d "
    newLine:    .asciz "\n"
.text

.global main

main:
    lea matrix, %edi
    movl $0, lineIndex
    movl $0, sum

    for_lines:
    movl lineIndex, %ecx
    cmp %ecx, lines
    je et_exit
    
    # al doilea for
    movl $0, columnIndex
    for_columns:
        movl columnIndex, %ecx
        cmp %ecx, columns
        je cont_for_lines
        
        movl lineIndex, %eax
        # %eax = lineIndex
        mull columns
        # %eax *= columns
        addl columnIndex, %eax
        
        movl (%edi, %eax, 4), %ebx
        # %ebx acum este elementul curent din matrice
        # %ebx = matrix[lineIndex][columnIndex]
        # il adaug in suma dupa ce verific daca e par sau nu

        mov %ebx, element
        mov element, %eax
        mov $2, %ebx
        idiv %ebx
        mov %edx, restt

        cmp $0, restt
        je suma

        suma:
            movl element, %ebx
            add %ebx, sum
        
    
        pushl $0
        call fflush
        pop %ebx
        
        addl $1, columnIndex
        jmp for_columns

cont_for_lines:
    mov $4, %eax
    mov $1, %ebx
    mov $newLine, %ecx
    mov $2, %edx
    int $0x80
 
    addl $1, lineIndex
    jmp for_lines

et_exit:
    # fac si printul tot in exit
    movl sum, %ebx
    pushl %ebx 
    push $formatInt
    call printf 
    pop %ebx 
    pop %ebx

    mov $1, %eax
    mov $0, %ebx
    int $0x80

