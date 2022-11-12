	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 1048576
str:
	.zero	1048576
	.globl	checker
	.align 4
	.type	checker, @object
	.size	checker, 4
checker:
	.zero	4
	.section	.rodata
.LC0:
	.string	"Choose input type: "
.LC1:
	.string	"For console input enter 1 "
.LC2:
	.string	"For file input enter 2 "
	.align 8
.LC3:
	.string	"For random generation enter 3 "
.LC4:
	.string	"%d"
.LC5:
	.string	"Incorrect file name!"
.LC6:
	.string	"Incorrect input!"
.LC7:
	.string	"w"
.LC8:
	.string	"output.txt"
.LC9:
	.string	"Congrats! It is correct"
.LC10:
	.string	"Oops! It is not correct..."
.LC11:
	.string	"\"Oops! It is not correct...\""
.LC12:
	.string	"\nExecution time: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -28[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, 3
	je	.L2
	cmp	eax, 3
	jg	.L3
	cmp	eax, 1
	je	.L4
	cmp	eax, 2
	je	.L5
	jmp	.L3
.L4:
	mov	eax, 0
	call	consoleInput@PLT
	jmp	.L6
.L5:
	mov	eax, 0
	call	fileInput@PLT
	xor	eax, 1
	test	al, al
	je	.L14
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L2:
	mov	eax, 0
	call	randomGeneration@PLT
	jmp	.L6
.L3:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L14:
	nop
.L6:
	lea	rax, .LC7[rip]
	mov	rsi, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L9
.L10:
	mov	eax, 0
	call	getResult@PLT
	mov	BYTE PTR -1[rbp], al
	add	DWORD PTR -8[rbp], 1
.L9:
	cmp	DWORD PTR -8[rbp], 19999
	jle	.L10
	call	clock@PLT
	sub	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -24[rbp], rax
	cmp	BYTE PTR -1[rbp], 0
	je	.L11
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 23
	mov	esi, 1
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L12
.L11:
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 28
	mov	esi, 1
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L12:
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
