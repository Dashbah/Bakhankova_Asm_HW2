	.file	"getResult.c"
	.intel_syntax noprefix
	.text
	.globl	getResult
	.type	getResult, @function
getResult:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 40
	jne	.L3
	mov	eax, DWORD PTR checker[rip]
	add	eax, 1
	mov	DWORD PTR checker[rip], eax
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 41
	jne	.L4
	mov	eax, DWORD PTR checker[rip]
	sub	eax, 1
	mov	DWORD PTR checker[rip], eax
	mov	eax, DWORD PTR checker[rip]
	test	eax, eax
	jns	.L9
	mov	eax, 0
	jmp	.L6
.L9:
	nop
.L4:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	test	al, al
	jne	.L7
	mov	eax, DWORD PTR checker[rip]
	test	eax, eax
	jle	.L8
	mov	eax, 0
	jmp	.L6
.L8:
	mov	eax, 1
.L6:
	pop	rbp
	ret
	.size	getResult, .-getResult
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
