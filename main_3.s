	.file	"main_3.c"
	.text
	.p2align 4,,15
	.globl	_identificador
	.def	_identificador;	.scl	2;	.type	32;	.endef
_identificador:
LFB18:
	.cfi_startproc
	movzbl	4(%esp), %eax
	subl	$65, %eax
	cmpb	$25, %al
	setbe	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "Parametros.txt\0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "%s\0"
	.text
	.p2align 4,,15
	.globl	_lectura_datos
	.def	_lectura_datos;	.scl	2;	.type	32;	.endef
_lectura_datos:
LFB19:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	_fopen
	testl	%eax, %eax
	movl	%eax, %esi
	je	L3
	movl	12(%eax), %edx
	xorl	%ebx, %ebx
	testb	$16, %dl
	je	L13
	jmp	L11
	.p2align 4,,7
L7:
	cmpl	$2, %ebx
	je	L9
	cmpl	$3, %ebx
	.p2align 4,,5
	jne	L5
	movl	_terminales, %eax
	movl	$LC3, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 8(%esp)
	call	_fscanf
	movl	_terminales, %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	12(%esi), %edx
	movl	%eax, _tlen
L5:
	addl	$1, %ebx
	testb	$16, %dl
	jne	L11
L13:
	cmpl	$1, %ebx
	je	L6
	jg	L7
	testl	%ebx, %ebx
	.p2align 4,,6
	jne	L5
	movl	$_lon, 8(%esp)
	addl	$1, %ebx
	movl	$LC2, 4(%esp)
	movl	%esi, (%esp)
	call	_fscanf
	movl	12(%esi), %edx
	testb	$16, %dl
	je	L13
	.p2align 4,,7
L11:
	movl	%esi, (%esp)
	call	_fclose
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L9:
	.cfi_restore_state
	movl	_noterminales, %eax
	movl	$LC3, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 8(%esp)
	call	_fscanf
	movl	_noterminales, %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	12(%esi), %edx
	movl	%eax, _ntlen
	jmp	L5
	.p2align 4,,7
L6:
	movl	$_nvueltas, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	%esi, (%esp)
	call	_fscanf
	movl	12(%esi), %edx
	jmp	L5
L3:
	movl	$1, (%esp)
	call	_exit
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC4:
	.ascii "Gramatica.txt\0"
	.text
	.p2align 4,,15
	.globl	_lectura_gramatica
	.def	_lectura_gramatica;	.scl	2;	.type	32;	.endef
_lectura_gramatica:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	$LC0, 4(%esp)
	movl	$LC4, (%esp)
	call	_fopen
	testl	%eax, %eax
	movl	%eax, %ebp
	je	L19
	testb	$16, 12(%eax)
	jne	L27
	movl	_lon, %eax
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	leal	28(%esp), %edi
	testl	%eax, %eax
	jle	L27
	.p2align 4,,7
L37:
	movl	%edi, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	%ebp, (%esp)
	call	_fscanf
	movl	%edi, %eax
L22:
	movl	(%eax), %ecx
	addl	$4, %eax
	leal	-16843009(%ecx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	L22
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leal	2(%eax), %ecx
	cmove	%ecx, %eax
	addb	%dl, %dl
	movzbl	28(%esp), %edx
	sbbl	$3, %eax
	subl	%edi, %eax
	subl	$3, %eax
	movb	%dl, _conjunto(%ebx)
	xorl	%edx, %edx
	testl	%eax, %eax
	jle	L28
	.p2align 4,,7
L36:
	movzbl	31(%esp,%edx), %ecx
	movb	%cl, _conjunto+1(%ebx,%edx)
	addl	$1, %edx
	cmpl	%eax, %edx
	jne	L36
L28:
	movl	%eax, _conjunto+24(%ebx)
	addl	$1, %esi
	addl	$28, %ebx
	cmpl	%esi, _lon
	jle	L27
	testb	$16, 12(%ebp)
	je	L37
L27:
	movl	%ebp, (%esp)
	call	_fclose
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
L19:
	.cfi_restore_state
	movl	$1, (%esp)
	call	_exit
	.cfi_endproc
LFE20:
	.p2align 4,,15
	.globl	_conjunto_primero
	.def	_conjunto_primero;	.scl	2;	.type	32;	.endef
_conjunto_primero:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	movl	_nvueltas, %ebx
	movl	40(%esp), %eax
	movzbl	36(%esp), %esi
	testl	%ebx, %ebx
	movl	%eax, 12(%esp)
	movb	%al, 10(%esp)
	movl	%ebx, 4(%esp)
	jle	L54
	movl	_lon, %ebx
	subl	$65, %eax
	movl	$0, (%esp)
	movb	%al, 11(%esp)
	.p2align 4,,7
L45:
	testl	%ebx, %ebx
	jle	L49
	movl	%esi, %ecx
	movl	$_conjunto, %eax
	xorl	%edx, %edx
	movl	%ebx, %esi
	movb	%cl, 9(%esp)
	jmp	L50
	.p2align 4,,7
L46:
	addl	$1, %edx
	addl	$28, %eax
	cmpl	%esi, %edx
	je	L56
L50:
	movzbl	9(%esp), %ebx
	cmpb	%bl, (%eax)
	jne	L46
	movzbl	1(%eax), %ecx
	cmpb	10(%esp), %cl
	je	L57
	leal	-65(%ecx), %ebp
	movl	%ebp, %ebx
	cmpb	$25, %bl
	cmovbe	%ecx, %edi
	addl	$1, %edx
	addl	$28, %eax
	cmpl	%esi, %edx
	jne	L50
L56:
	movl	%esi, %ebx
L49:
	addl	$1, (%esp)
	movl	4(%esp), %eax
	cmpl	%eax, (%esp)
	je	L54
	movl	%edi, %esi
	jmp	L45
	.p2align 4,,7
L57:
	cmpb	$25, 11(%esp)
	jbe	L52
	movzbl	12(%esp), %eax
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L52:
	.cfi_restore_state
	movzbl	10(%esp), %edi
	jmp	L46
L54:
	addl	$16, %esp
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC5:
	.ascii "\12Conjunto primero\0"
LC6:
	.ascii "%c\11\0"
	.text
	.p2align 4,,15
	.globl	_busqueda_primero
	.def	_busqueda_primero;	.scl	2;	.type	32;	.endef
_busqueda_primero:
LFB21:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	xorl	%esi, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	$LC5, (%esp)
	call	_puts
	movl	_ntlen, %ecx
	testl	%ecx, %ecx
	jle	L58
	.p2align 4,,7
L66:
	movl	_noterminales, %eax
	xorl	%ebx, %ebx
	movsbl	(%eax,%esi), %eax
	movl	$LC6, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	movl	_tlen, %edx
	testl	%edx, %edx
	jle	L63
	.p2align 4,,7
L67:
	movl	_terminales, %eax
	movsbl	(%eax,%ebx), %eax
	addl	$1, %ebx
	movl	%eax, 4(%esp)
	movl	_noterminales, %eax
	movsbl	(%eax,%esi), %eax
	movl	%eax, (%esp)
	call	_conjunto_primero
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	cmpl	%ebx, _tlen
	jg	L67
L63:
	movl	$10, (%esp)
	addl	$1, %esi
	call	_putchar
	cmpl	%esi, _ntlen
	jg	L66
L58:
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC7:
	.ascii "Ingrese no terminal %i : \0"
LC8:
	.ascii " %c\0"
LC9:
	.ascii "Ingrese cadena %i : \0"
LC10:
	.ascii " %c -> %s \12\0"
	.text
	.p2align 4,,15
	.globl	_get_datos
	.def	_get_datos;	.scl	2;	.type	32;	.endef
_get_datos:
LFB23:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	xorl	%esi, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$_conjunto, %ebx
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	_lon, %edi
	testl	%edi, %edi
	jle	L73
	.p2align 4,,7
L75:
	addl	$1, %esi
	movl	%esi, 4(%esp)
	leal	1(%ebx), %edi
	movl	$LC7, (%esp)
	call	_printf
	movl	%ebx, 4(%esp)
	addl	$28, %ebx
	movl	$LC8, (%esp)
	call	_scanf
	movsbl	-28(%ebx), %eax
	movl	%eax, (%esp)
	call	_toupper
	movl	%esi, 4(%esp)
	movl	$LC9, (%esp)
	movb	%al, -28(%ebx)
	call	_printf
	movl	%edi, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	%edi, (%esp)
	call	_strlen
	movl	$10, (%esp)
	movl	%eax, -4(%ebx)
	call	_putchar
	movl	_lon, %eax
	cmpl	%esi, %eax
	jg	L75
	testl	%eax, %eax
	jle	L73
	movl	$_conjunto+1, %ebx
	xorl	%esi, %esi
	.p2align 4,,7
L74:
	movsbl	-1(%ebx), %eax
	addl	$1, %esi
	movl	%ebx, 8(%esp)
	addl	$28, %ebx
	movl	$LC10, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	%esi, _lon
	jg	L74
L73:
	movl	$10, (%esp)
	call	_putchar
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC11:
	.ascii "E_C\0"
LC12:
	.ascii "0\0"
	.text
	.p2align 4,,15
	.globl	_getterminal
	.def	_getterminal;	.scl	2;	.type	32;	.endef
_getterminal:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	68(%esp), %edi
	movl	$20, (%esp)
	movl	64(%esp), %esi
	movl	%edi, %eax
	movb	%al, 25(%esp)
	movl	%esi, %ebx
	call	_malloc
	movl	%eax, 28(%esp)
	leal	-65(%esi), %eax
	cmpb	$25, %al
	jbe	L79
	movl	%edi, %edx
	cmpb	%dl, %bl
	je	L99
L79:
	movl	_lon, %esi
	testl	%esi, %esi
	jle	L100
	imull	$28, %esi, %edi
	movl	$_conjunto, %eax
	xorl	%edx, %edx
	movl	$1, %ecx
	addl	$_conjunto, %edi
	.p2align 4,,7
L94:
	cmpb	%bl, (%eax)
	cmove	%ecx, %edx
	addl	$28, %eax
	cmpl	%edi, %eax
	jne	L94
	testl	%edx, %edx
	movl	$LC12, %eax
	je	L104
	movl	_nvueltas, %edi
	testl	%edi, %edi
	movl	%edi, 20(%esp)
	jle	L104
	movzbl	25(%esp), %eax
	movl	$0, 16(%esp)
	subl	$65, %eax
	movb	%al, 27(%esp)
	.p2align 4,,7
L84:
	movl	$_conjunto, %eax
	xorl	%edx, %edx
	movb	%bl, 24(%esp)
	jmp	L93
	.p2align 4,,7
L85:
	addl	$1, %edx
	addl	$28, %eax
	cmpl	%esi, %edx
	je	L112
L93:
	movzbl	(%eax), %ecx
	cmpb	24(%esp), %cl
	jne	L85
	movzbl	1(%eax), %edi
	movl	%edi, %ebx
	cmpb	25(%esp), %bl
	je	L113
	leal	-65(%edi), %ecx
	cmpb	$25, %cl
	ja	L85
L87:
	movl	16(%esp), %ecx
	movl	%edi, %ebx
	movb	%bl, 26(%esp)
	testl	%ecx, %ecx
	cmove	%edx, %ebp
	addl	$1, %edx
	addl	$28, %eax
	cmpl	%esi, %edx
	jne	L93
	.p2align 4,,7
L112:
	addl	$1, 16(%esp)
	movl	20(%esp), %eax
	cmpl	%eax, 16(%esp)
	je	L100
	movzbl	26(%esp), %ebx
	jmp	L84
	.p2align 4,,7
L113:
	cmpb	$25, 27(%esp)
	jbe	L87
	movl	16(%esp), %ebx
	testl	%ebx, %ebx
	je	L95
	imull	$28, %ebp, %eax
	movl	%ebp, %edx
	movzbl	_conjunto(%eax), %ecx
L95:
	imull	$28, %edx, %edx
	movl	28(%esp), %eax
	movl	28(%esp), %esi
	movl	_conjunto+24(%edx), %ebx
	movb	$40, (%eax)
	movb	%cl, 1(%eax)
	movb	$45, 2(%eax)
	movb	$62, 3(%eax)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	jle	L90
	.p2align 4,,7
L105:
	movzbl	_conjunto+1(%edx,%eax), %ecx
	movb	%cl, 4(%esi,%eax)
	addl	$1, %eax
	cmpl	%ebx, %eax
	jne	L105
L90:
	movl	28(%esp), %eax
	movb	$41, 4(%eax,%ebx)
	movb	$0, 5(%eax,%ebx)
L104:
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
L100:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$LC12, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
L99:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	movl	$LC11, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC13:
	.ascii "\12Tabla de la funcion accion\0"
LC14:
	.ascii "\11#\0"
LC15:
	.ascii "\11%c\0"
LC16:
	.ascii "\11%s\0"
LC17:
	.ascii "\11"
	.ascii "0\0"
LC18:
	.ascii "\11ACEPTAR\0"
	.text
	.p2align 4,,15
	.globl	_get_tabla
	.def	_get_tabla;	.scl	2;	.type	32;	.endef
_get_tabla:
LFB25:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	$LC13, (%esp)
	call	_puts
	movl	_tlen, %eax
	testl	%eax, %eax
	jle	L118
	.p2align 4,,7
L140:
	movl	_terminales, %eax
	movsbl	(%eax,%ebx), %eax
	addl	$1, %ebx
	movl	$LC15, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	%ebx, _tlen
	jg	L140
L118:
	movl	$LC14, (%esp)
	xorl	%esi, %esi
	call	_puts
	movl	_ntlen, %eax
	testl	%eax, %eax
	jle	L117
	.p2align 4,,7
L141:
	movl	_tlen, %eax
	testl	%eax, %eax
	js	L124
	xorl	%ebx, %ebx
	jmp	L125
	.p2align 4,,7
L145:
	movl	_noterminales, %eax
	addl	$1, %ebx
	movsbl	(%eax,%esi), %eax
	movl	%eax, (%esp)
	call	_putchar
	cmpl	%ebx, _tlen
	jl	L124
L125:
	testl	%ebx, %ebx
	je	L145
	movl	_terminales, %eax
	movsbl	-1(%eax,%ebx), %eax
	addl	$1, %ebx
	movl	%eax, 4(%esp)
	movl	_noterminales, %eax
	movsbl	(%eax,%esi), %eax
	movl	%eax, (%esp)
	call	_getterminal
	movl	$LC16, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	%ebx, _tlen
	jge	L125
L124:
	movl	$LC17, (%esp)
	addl	$1, %esi
	call	_puts
	cmpl	%esi, _ntlen
	jg	L141
L117:
	movl	_tlen, %eax
	testl	%eax, %eax
	jle	L126
	xorl	%esi, %esi
	.p2align 4,,7
L127:
	testl	%eax, %eax
	js	L131
	xorl	%ebx, %ebx
	jmp	L132
	.p2align 4,,7
L146:
	movsbl	(%eax,%esi), %eax
	addl	$1, %ebx
	movl	%eax, (%esp)
	call	_putchar
	cmpl	%ebx, _tlen
	jl	L131
L132:
	testl	%ebx, %ebx
	movl	_terminales, %eax
	je	L146
	movsbl	-1(%eax,%ebx), %edx
	addl	$1, %ebx
	movl	%edx, 4(%esp)
	movsbl	(%eax,%esi), %eax
	movl	%eax, (%esp)
	call	_getterminal
	movl	$LC16, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	%ebx, _tlen
	jge	L132
L131:
	movl	$LC17, (%esp)
	addl	$1, %esi
	call	_puts
	movl	_tlen, %eax
	cmpl	%esi, %eax
	jg	L127
L126:
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jns	L142
	jmp	L136
	.p2align 4,,7
L147:
	movl	$35, (%esp)
	addl	$1, %ebx
	call	_putchar
	cmpl	%ebx, _tlen
	jl	L136
L142:
	testl	%ebx, %ebx
	je	L147
	movl	$LC17, (%esp)
	addl	$1, %ebx
	call	_printf
	cmpl	%ebx, _tlen
	jge	L142
L136:
	movl	$LC18, (%esp)
	call	_puts
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE25:
	.p2align 4,,15
	.globl	_get_rastreo
	.def	_get_rastreo;	.scl	2;	.type	32;	.endef
_get_rastreo:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	72(%esp), %eax
	movzbl	(%eax), %ecx
	leal	-65(%ecx), %eax
	cmpb	$25, %al
	ja	L149
	movl	_nvueltas, %eax
	testl	%eax, %eax
	movl	%eax, 28(%esp)
	jle	L150
	movl	_lon, %esi
	xorl	%ebp, %ebp
	movl	$0, 20(%esp)
	.p2align 4,,7
L151:
	testl	%esi, %esi
	jle	L165
	movl	$_conjunto, %eax
	xorl	%ebx, %ebx
	movl	%ebp, 16(%esp)
	movb	%cl, 12(%esp)
	jmp	L166
	.p2align 4,,7
L152:
	addl	$1, %ebx
	addl	$28, %eax
	cmpl	%esi, %ebx
	je	L178
L166:
	movzbl	(%eax), %edx
	cmpb	12(%esp), %dl
	jne	L152
	movzbl	1(%eax), %edi
	movl	68(%esp), %ebp
	movl	%edi, %ecx
	cmpb	0(%ebp), %cl
	je	L179
	leal	-65(%edi), %edx
	cmpb	$25, %dl
	ja	L152
L154:
	movl	%edi, %ecx
	movl	20(%esp), %edx
	movb	%cl, 27(%esp)
	movl	16(%esp), %ecx
	testl	%edx, %edx
	cmove	%ebx, %ecx
	addl	$1, %ebx
	addl	$28, %eax
	cmpl	%esi, %ebx
	movl	%ecx, 16(%esp)
	jne	L166
	.p2align 4,,7
L178:
	movl	16(%esp), %ebp
L165:
	addl	$1, 20(%esp)
	movl	28(%esp), %eax
	cmpl	%eax, 20(%esp)
	je	L150
	movzbl	27(%esp), %ecx
	jmp	L151
L150:
	movl	64(%esp), %eax
	movl	$LC12, (%eax)
	movl	$LC12, 4(%eax)
	movl	$LC12, 8(%eax)
	movl	64(%esp), %eax
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L179:
	.cfi_restore_state
	leal	-65(%edi), %ecx
	cmpb	$25, %cl
	jbe	L154
	movl	20(%esp), %ecx
	movl	16(%esp), %ebp
	testl	%ecx, %ecx
	je	L170
	imull	$28, %ebp, %eax
	movl	%ebp, %ebx
	movzbl	_conjunto(%eax), %edx
L170:
	imull	$28, %ebx, %ebp
	movl	$20, (%esp)
	movl	%edx, 12(%esp)
	call	_malloc
	movl	12(%esp), %edx
	movl	_conjunto+24(%ebp), %ebx
	testl	%ebx, %ebx
	movl	%eax, %esi
	movb	$40, (%eax)
	movb	%dl, 1(%eax)
	movb	$45, 2(%eax)
	movb	$62, 3(%eax)
	jle	L156
	xorl	%eax, %eax
	.p2align 4,,7
L158:
	movzbl	_conjunto+1(%ebp,%eax), %edx
	movb	%dl, 4(%esi,%eax)
	addl	$1, %eax
	cmpl	%ebx, %eax
	jne	L158
	movb	$41, 4(%esi,%ebx)
	movb	$0, 5(%esi,%ebx)
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, %edi
	xorl	%eax, %eax
	.p2align 4,,7
L160:
	movzbl	_conjunto+1(%ebp,%eax), %edx
	movb	%dl, (%edi,%eax)
	addl	$1, %eax
	cmpl	%ebx, %eax
	jne	L160
L159:
	movl	%esi, 12(%esp)
	xorl	%ebp, %ebp
	addl	%edi, %ebx
	movl	72(%esp), %esi
	jmp	L161
	.p2align 4,,7
L162:
	movzbl	1(%esi,%ebp), %eax
	movb	%al, (%ebx,%ebp)
	addl	$1, %ebp
L161:
	movl	%esi, (%esp)
	call	_strlen
	cmpl	%eax, %ebp
	jb	L162
	movl	68(%esp), %eax
	movl	12(%esp), %esi
	movl	%eax, (%esp)
	call	_strlen
	movl	68(%esp), %ecx
	movb	$0, -1(%eax,%ebx)
	movl	64(%esp), %eax
	movl	%ecx, (%eax)
	movl	%edi, 4(%eax)
	movl	%esi, 8(%eax)
	movl	64(%esp), %eax
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
L149:
	.cfi_restore_state
	movl	$20, (%esp)
	xorl	%esi, %esi
	call	_malloc
	movl	72(%esp), %edi
	movl	%eax, %ebx
	jmp	L171
	.p2align 4,,7
L167:
	movzbl	1(%edi,%esi), %eax
	movb	%al, (%ebx,%esi)
	addl	$1, %esi
L171:
	movl	%edi, (%esp)
	call	_strlen
	cmpl	%eax, %esi
	jb	L167
	movb	$0, (%ebx,%eax)
	xorl	%edi, %edi
	movl	$20, (%esp)
	call	_malloc
	movl	68(%esp), %ebp
	movl	%eax, %esi
	jmp	L168
	.p2align 4,,7
L169:
	movzbl	1(%ebp,%edi), %eax
	movb	%al, (%esi,%edi)
	addl	$1, %edi
L168:
	movl	%ebp, (%esp)
	call	_strlen
	cmpl	%eax, %edi
	jb	L169
	movb	$0, (%ebx,%eax)
	movl	64(%esp), %eax
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
	movl	$LC11, 8(%eax)
	movl	64(%esp), %eax
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
L156:
	.cfi_restore_state
	movb	$41, 4(%eax,%ebx)
	movb	$0, 5(%eax,%ebx)
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, %edi
	jmp	L159
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC19:
	.ascii "ERROR\11\11\11ERROR\11ERROR\0"
LC20:
	.ascii "#\11\11\11#\11E_C -> ACEPTAR\0"
LC21:
	.ascii "%s\11\11\11%s\11%s\12\0"
	.text
	.p2align 4,,15
	.globl	_rastreo
	.def	_rastreo;	.scl	2;	.type	32;	.endef
_rastreo:
LFB27:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$32, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebx
	movl	52(%esp), %esi
	movzbl	(%ebx), %eax
	cmpb	$35, %al
	je	L181
	leal	20(%esp), %edi
	jmp	L198
	.p2align 4,,7
L192:
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	_get_rastreo
	movl	20(%esp), %ebx
	movl	24(%esp), %esi
	movl	28(%esp), %eax
	movl	$LC21, (%esp)
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, 12(%esp)
	call	_printf
	movzbl	(%ebx), %eax
	cmpb	$35, %al
	je	L181
L198:
	cmpb	$48, %al
	jne	L192
	movl	$LC19, 48(%esp)
	addl	$32, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	jmp	_puts
	.p2align 4,,7
L181:
	.cfi_restore_state
	movl	$LC20, 48(%esp)
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	jmp	_puts
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC22:
	.ascii "Datos y gramatica leidos \0"
LC23:
	.ascii "\12Ingrese cadena a rastrear : \0"
LC24:
	.ascii "producciones usada\0"
LC25:
	.ascii "La pila\0"
LC26:
	.ascii "La cadena a reconocer\0"
LC27:
	.ascii "%s\11%s\11%s\12\0"
LC28:
	.ascii "lambda\0"
LC29:
	.ascii "%s\11\11\11%c#\11%s\12\0"
	.text
	.p2align 4,,15
	.globl	_programa
	.def	_programa;	.scl	2;	.type	32;	.endef
_programa:
LFB28:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$52, %esp
	.cfi_def_cfa_offset 64
	movl	$20, (%esp)
	leal	28(%esp), %esi
	call	_malloc
	movl	$20, (%esp)
	movl	%eax, _noterminales
	call	_malloc
	movl	$20, (%esp)
	movl	%eax, _terminales
	call	_malloc
	movl	%eax, %ebx
	call	_lectura_datos
	call	_lectura_gramatica
	movl	$LC22, (%esp)
	call	_puts
	call	_busqueda_primero
	call	_get_tabla
	movl	$LC23, (%esp)
	call	_printf
	movl	%esi, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	$10, (%esp)
	call	_putchar
	movl	$LC24, 12(%esp)
	movl	$LC25, 8(%esp)
	movl	$LC26, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	movl	_noterminales, %eax
	movl	$LC28, 12(%esp)
	movsbl	(%eax), %eax
	movl	%esi, 4(%esp)
	movl	$LC29, (%esp)
	movl	%eax, 8(%esp)
	call	_printf
	movl	_noterminales, %eax
	movzbl	(%eax), %eax
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	movb	$35, 1(%ebx)
	movb	%al, (%ebx)
	movb	$0, 2(%ebx)
	call	_rastreo
	addl	$52, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE28:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	call	___main
	call	_programa
	call	_getch
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	.p2align 4,,2
	ret
	.cfi_endproc
LFE29:
	.comm	_conjunto, 560, 5
	.globl	_tlen
	.bss
	.align 4
_tlen:
	.space 4
	.globl	_ntlen
	.align 4
_ntlen:
	.space 4
	.comm	_terminales, 4, 2
	.comm	_noterminales, 4, 2
	.globl	_nvueltas
	.align 4
_nvueltas:
	.space 4
	.globl	_lon
	.align 4
_lon:
	.space 4
	.ident	"GCC: (GNU) 4.8.1"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_toupper;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
