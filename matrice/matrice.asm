#	Afisarea unei matrice
.data
	lines: 		.long 3
	columns: 		.long 4
	lineIndex:		.space 4
	columnIndex:		.space 4
	matrix:		.long 10, 20, 30, 40
				.long 50, 60, 70, 80
				.long 90, 15, 25, 35
				
	formatInt:		.asciz "%d"
	newLine:		.asciz "\n"	
.text

.global main

main:
	lea 			matrix, %edi
	movl			$0, index

for_lines:
	movl			lineIndex, %ecx
	cmp			%ecx, lines
	je			et_exit
	
	movl			$0, col_index
	
	for_columns:
		movl			columnIndex, %ecx
		cmp			%ecx, columns
		je			cont_lines
	
		movl			lineIndex, %eax	# %eax, lineIndex
		mull			columns		# %eax = %eax * columns
		addl			columnindex, %eax	# %eax = %eax + columnIndex
		
		movl 			(%edi, %eax, 4), %ebx	# %ebx este elementul curent din matrice
		
		# print corespunzator
		# ...
		incl			columnIndex
		jmp			for_columns
		

cont_lines:
	incl			lineIndex
	jmp			for_lines
	
et_exit:
	movl			$1, %eax
	xor			%ebx, %ebx
	int			$0x80
		
		
		
		
		
	
