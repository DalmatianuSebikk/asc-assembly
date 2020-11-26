.data
    v:              .long 15, 13, 17, 1, 21, 2, 18, 9, 11
    n:              .long 9
    min1:           .space 4
    min2:           .space 4
    index:          .space 4
    formatPrint:    .asciz "(%d, %d)\n"
.text
 
.global main
 
main:
    lea v, %edi
 
    movl $0, %ecx
    // v[%ecx] sau %edi[%ecx]
    movl (%edi, %ecx, 4), %eax
    movl %eax, min1
    movl (%edi, %ecx, 4), %eax
    movl %eax, min2
    
    movl $1, index
et_for:
    movl index, %ecx
    cmp %ecx, n
    je et_exit
    
    movl (%edi, %ecx, 4), %ebx
    cmp min1, %ebx
    jl change_min2_min1
    
    cmp min2, %ebx
    jl change_min2
 
cont:   
    incl index
    jmp et_for
 
change_min2_min1:
    movl min1, %eax
    movl %eax, min2
    movl %ebx, min1
    jmp cont
    
change_min2:
    movl %ebx, min2
    jmp cont
 
et_exit:
 
    pushl min1
    pushl min2
    push $formatPrint
    call printf
    popl %ebx
    popl %ebx
    popl %ebx
    
    pushl $0
    call fflush
    popl %ebx
 
    movl $1, %eax
    xor %ebx, %ebx
    int $0x80