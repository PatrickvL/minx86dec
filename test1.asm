; 8086 test code
org 0

_start:
	add	bl,[esp]
	add	bl,[a32 12345678h]
	add	bl,[a32 12345678h+edx+eax]
	add	bl,[ebp]
	add	bl,[ebp+42h]

	idiv	eax
	idiv	ebx
	idiv	ecx
	idiv	edx
	idiv	esi
	idiv	edi
	idiv	word [eax]
	idiv	word [ebx]
	idiv	word [ecx]
	idiv	word [edx]
	idiv	word [esi]
	idiv	word [edi]

	nop
	lea	bx,[si+3]
	lea	cx,[bx+di+33h]
	mov	ax,es
	mov	ds,ax
	mov	bx,cs
	mov	cs,bx
	mov	cx,ds
	mov	dx,ss
	mov	[di],es
	mov	[si],ds
	test	ax,bx
	test	si,cx
	test	cl,bh
	test	[di],bx
	test	[si+bx+43],cx
	xchg	bl,dl
	xchg	[si],cl
	xchg	[di],si
	cmp	bl,44h
	cmp	bx,2446h
	cmp	byte [bx+3],35h
	cmp	word [bp-3],2244h
	cmp	word [di],62h
	mov	ah,dh
	mov	bl,[si+bx+3]
	mov	si,[di+bx+34h]
	inc	ax
	inc	bx
	inc	cx
	inc	dx
	inc	si
	inc	di
	inc	bp
	inc	sp
	dec	sp
	dec	bp
	dec	di
	dec	si
	dec	dx
	dec	cx
	dec	bx
	dec	ax
	push	ax
	push	bx
	push	cx
	push	dx
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	jo	j2
j2:	jno	j2
	ja	j2
	jz	j2
	xchg	ax,bx
	xchg	ax,cx
	xchg	ax,dx
	xchg	ax,si
	mov	al,13h
	mov	bl,44h
	mov	dh,11h
	mov	si,2456h
	mov	bp,2222h
	daa
	das
	aaa
	aas
	add	al,ah
	add	cl,bh
	add	bl,byte [345h]
	add	byte [123h],dh
	adc	bh,byte [bx+si]
	sub	si,word [si]
	sub	di,word [bp+di+0x1234]
	add	al,12h
	add	ax,1245h
	mov	al,[1234h]
	mov	ax,[5050h]
	mov	[1111h],al
	mov	[5421h],ax
	mov	ax,[cs:3]
	mov	[ss:4444h],ax
	push	cs
	push	es
	pop	cs
	pop	ds

	mov	cr0,eax
	mov	cr0,ebx
	mov	eax,cr0
	mov	cr2,eax
	mov	eax,cr2
	mov	dr0,eax
	mov	eax,dr0
	mov	dr3,eax
	mov	eax,dr3
	mov	tr0,eax
	mov	eax,tr0
	mov	tr3,eax
	mov	eax,tr3

	salc
	icebp
	umov	eax,ebx
	umov	[edi],ebx
	umov	esi,[edi]
	umov	al,cl
	umov	ah,[esi]

	nop
	nop
	nop
	db	0x0F,0x05	; 286 loadall

	nop
	nop
	nop
	db	0x0F,0x07	; 386 loadall

