.data
    n:      	.space 4
    format: 	.asciz "%d"
    index:  	.space 4
.text

.global main

main:
    # citesc numarul
    # scanf(%d, $n)
    pushl 		$n
    push 		$format
    call 		scanf
    popl 		%ebx
    popl 		%ebx

    movl 		$1, index

parcurgere_elemente_1_n:
    movl 		index, %ecx
    cmp 		n, %ecx
    jg 			et_exit

    
    movl 		n, %eax
    xor 		%edx, %edx
    divl 		index

    cmp 		$0, %edx
    je 			salt_pt_afisare

continua:
    add 		$1, index
    jmp 		parcurgere_elemente_1_n

salt_pt_afisare:

    # printf("%d", index)

    pushl 		index
    push 		$format
    call 		printf
    popl 		%ebx
    popl 		%ebx
    
    pushl 		$0
    call 		fflush
    popl 		%ebx

    jmp 		continua

et_exit:
    movl 		$1, %eax
    xor 		%ebx, %ebx
    int 		$0x80
