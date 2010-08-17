; MS-DOS real-mode 8086 executable (*.com)
		org	100h
		mov	ax,cs
		mov	ds,ax
		mov	es,ax
		mov	ss,ax

; Open file for reporting==================================
		mov	ah,0x3C		; create file
		xor	cx,cx
		mov	dx,reportfile
		int	21h
		jnc	open_ok
		mov	ax,4C01h
		int	21h
open_ok:	mov	[reportfd],ax

; Announce the test========================================
		mov	si,s_begintest
		call	puts

; Test=====================================================
		call	test8086_imp_seg
		call	test8086_exp_seg

; EXIT=====================================================
exit:		mov	bx,[reportfd]
		test	bx,bx
		jz	close_ok
		mov	ah,0x3E		; close file
		int	21h
close_ok:	mov	ax,4C00h	; exit
		int	21h

; util=====================================================
puts:		push	si
		push	di
		push	ax
		push	bx
		push	cx
		push	dx
; how long is it?
		xor	cx,cx
		dec	cx
		mov	di,si
		cld
		xor	al,al
		repne	scasb
		not	cx
		dec	cx
; print it to console
		push	si
		push	cx
putsl:		lodsb
		mov	ah,0xE
		xor	bx,bx
		int	10h
		loop	putsl
		pop	cx
		pop	si
; write it to the file (CX=count)
		mov	bx,[reportfd]
		mov	dx,si
		mov	ah,0x40
		int	21h
; done
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		pop	di
		pop	si
		ret

%include	"8086/imp_seg.inc"		; test8086_imp_seg
%include	"8086/exp_seg.inc"		; test8086_exp_seg

; data=====================================================
reportfile	db	'test8086.log',0
reportfd	dw	0
s_begintest	db	'Test8086: 8086 emulation compat tests',13,10,0
s_pass		db	'PASS',0
s_fail		db	'FAIL',0
s_crlf		db	13,10,0
s_sp:		dw	0
s_testval:	dw	0x1234

