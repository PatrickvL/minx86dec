; recompiler test code #1
org 0

_start:
; JMP [reg] 16-bit
	jmp	ax
	jmp	bx
	jmp	cx
	jmp	dx
	jmp	si
	jmp	di
	jmp	bp
	jmp	sp
; JMP [reg] 32-bit
	jmp	eax
	jmp	ebx
	jmp	ecx
	jmp	edx
	jmp	esi
	jmp	edi
	jmp	ebp
	jmp	esp
; JMP [addr] 16-bit single-memref
	jmp	[bx]
	jmp	[bp]
	jmp	[si]
	jmp	[di]
; JMP [addr] 16-bit single-memref with offset
	jmp	[bx+3]
	jmp	[bp+4]
	jmp	[si+5]
	jmp	[di+6]
; JMP [addr] 16-bit single-memref with large offset
	jmp	[bx+0x1111]
	jmp	[bp+0x2222]
	jmp	[si+0x3333]
	jmp	[di+0x4444]
; JMP [addr] 16-bit single-memref with negative offset
	jmp	[bx-3]
	jmp	[bp-4]
	jmp	[si-5]
	jmp	[di-6]
; JMP [addr] 16-bit single-memref with large negative offset
	jmp	[bx-0x1111]
	jmp	[bp-0x2222]
	jmp	[si-0x3333]
	jmp	[di-0x4444]
; JMP [addr] 16-bit double-memref
	jmp	[bx+si]
	jmp	[bx+di]
	jmp	[bp+si]
	jmp	[bp+di]
; JMP [addr] 16-bit double-memref and offset
	jmp	[bx+si+3]
	jmp	[bx+di+4]
	jmp	[bp+si+5]
	jmp	[bp+di+6]
; JMP [addr] 16-bit double-memref and large offset
	jmp	[bx+si+0x1111]
	jmp	[bx+di+0x2222]
	jmp	[bp+si+0x3333]
	jmp	[bp+di+0x4444]
; JMP [addr] 32-bit single-memref
	jmp	[eax]
	jmp	[ebx]
	jmp	[ecx]
	jmp	[edx]
	jmp	[esi]
	jmp	[edi]
	jmp	[esp]
	jmp	[ebp]
; JMP [addr] 32-bit single-memref with offset
	jmp	[eax+3]
	jmp	[ebx+4]
	jmp	[ecx+5]
	jmp	[edx+6]
	jmp	[esi+7]
	jmp	[edi+8]
	jmp	[esp+9]
	jmp	[ebp+10]
; JMP [addr] 32-bit single-memref with large offset
	jmp	[eax+0x11111111]
	jmp	[ebx+0x22222222]
	jmp	[ecx+0x33333333]
	jmp	[edx+0x44444444]
	jmp	[esi+0x55555555]
	jmp	[edi+0x66666666]
	jmp	[esp+0x77777777]
	jmp	[ebp+0x88888888]
; JMP [addr] 32-bit double-memref
	jmp	[eax+eax]
	jmp	[ebx+eax]
	jmp	[ecx+eax]
	jmp	[edx+eax]
	jmp	[esi+eax]
	jmp	[edi+eax]
	jmp	[esp+eax]
	jmp	[ebp+eax]
; JMP [addr] 32-bit double-memref
	jmp	[eax+ebx]
	jmp	[ebx+ebx]
	jmp	[ecx+ebx]
	jmp	[edx+ebx]
	jmp	[esi+ebx]
	jmp	[edi+ebx]
	jmp	[esp+ebx]
	jmp	[ebp+ebx]
; JMP [addr] 32-bit double-memref and scalar
	jmp	[eax*2+ebx]
	jmp	[ebx*2+ebx]
	jmp	[ecx*2+ebx]
	jmp	[edx*2+ebx]
	jmp	[esi*2+ebx]
	jmp	[edi*2+ebx]
	jmp	[ebp*2+ebx]
; JMP [addr] 32-bit double-memref and scalar
	jmp	[eax*2+ebx+4]
	jmp	[ebx*2+ebx+5]
	jmp	[ecx*2+ebx+6]
	jmp	[edx*2+ebx+7]
	jmp	[esi*2+ebx+8]
	jmp	[edi*2+ebx+9]
	jmp	[ebp*2+ebx+10]
; JMP <near>
	jmp	0x1234
	jmp	0x5678
; JMP <short>
	jmp	short $+1
	jmp	short $+2
; JMP <32-bit near>
	jmp	dword 0x12345678
	jmp	dword 0x89ABCDEF
; JMP <far immediate>
	jmp	0x1234:0x5678
; jmp <32-bit far immediate>
	jmp	0x1234:dword 0x89ABCDEF
; JMP <far [addr]>
	jmp far	[bx]
	jmp far	[si]
	jmp far	[bp]
	jmp far	[bx+si]
	jmp far	[bx+di]
; JMP <far [32-bit addr]>
	jmp far	[eax]
	jmp far	[ebx]
	jmp far	[ecx]
	jmp far	[edx]
	jmp far	[esi]
	jmp far [edi]
	jmp far [esp]
	jmp far [ebp]
; JMP <32-bit far [addr]>
	jmp far dword [bx]
	jmp far dword [si]
	jmp far dword [bp]
	jmp far dword [bx+si]
	jmp far dword [bx+di]
; JMP <32-bit far 32-bit addr>
	jmp far dword [eax]
	jmp far dword [ebx]
	jmp far dword [ecx]
	jmp far dword [edx]
	jmp far dword [esi]
	jmp far dword [edi]
	jmp far dword [esp]
	jmp far dword [ebp]
; JMP <addr>
	jmp	word [0x1234]
	jmp	[dword 0x12345678]
	jmp far	word [0x1234]
	jmp far	[dword 0x12345678]

; JMP [reg] 16-bit
	call	ax
	call	bx
	call	cx
	call	dx
	call	si
	call	di
	call	bp
	call	sp
; JMP [reg] 32-bit
	call	eax
	call	ebx
	call	ecx
	call	edx
	call	esi
	call	edi
	call	ebp
	call	esp
; JMP [addr] 16-bit single-memref
	call	[bx]
	call	[bp]
	call	[si]
	call	[di]
; JMP [addr] 16-bit single-memref with offset
	call	[bx+3]
	call	[bp+4]
	call	[si+5]
	call	[di+6]
; JMP [addr] 16-bit single-memref with large offset
	call	[bx+0x1111]
	call	[bp+0x2222]
	call	[si+0x3333]
	call	[di+0x4444]
; JMP [addr] 16-bit single-memref with negative offset
	call	[bx-3]
	call	[bp-4]
	call	[si-5]
	call	[di-6]
; JMP [addr] 16-bit single-memref with large negative offset
	call	[bx-0x1111]
	call	[bp-0x2222]
	call	[si-0x3333]
	call	[di-0x4444]
; JMP [addr] 16-bit double-memref
	call	[bx+si]
	call	[bx+di]
	call	[bp+si]
	call	[bp+di]
; JMP [addr] 16-bit double-memref and offset
	call	[bx+si+3]
	call	[bx+di+4]
	call	[bp+si+5]
	call	[bp+di+6]
; JMP [addr] 16-bit double-memref and large offset
	call	[bx+si+0x1111]
	call	[bx+di+0x2222]
	call	[bp+si+0x3333]
	call	[bp+di+0x4444]
; JMP [addr] 32-bit single-memref
	call	[eax]
	call	[ebx]
	call	[ecx]
	call	[edx]
	call	[esi]
	call	[edi]
	call	[esp]
	call	[ebp]
; JMP [addr] 32-bit single-memref with offset
	call	[eax+3]
	call	[ebx+4]
	call	[ecx+5]
	call	[edx+6]
	call	[esi+7]
	call	[edi+8]
	call	[esp+9]
	call	[ebp+10]
; JMP [addr] 32-bit single-memref with large offset
	call	[eax+0x11111111]
	call	[ebx+0x22222222]
	call	[ecx+0x33333333]
	call	[edx+0x44444444]
	call	[esi+0x55555555]
	call	[edi+0x66666666]
	call	[esp+0x77777777]
	call	[ebp+0x88888888]
; JMP [addr] 32-bit double-memref
	call	[eax+eax]
	call	[ebx+eax]
	call	[ecx+eax]
	call	[edx+eax]
	call	[esi+eax]
	call	[edi+eax]
	call	[esp+eax]
	call	[ebp+eax]
; JMP [addr] 32-bit double-memref
	call	[eax+ebx]
	call	[ebx+ebx]
	call	[ecx+ebx]
	call	[edx+ebx]
	call	[esi+ebx]
	call	[edi+ebx]
	call	[esp+ebx]
	call	[ebp+ebx]
; JMP [addr] 32-bit double-memref and scalar
	call	[eax*2+ebx]
	call	[ebx*2+ebx]
	call	[ecx*2+ebx]
	call	[edx*2+ebx]
	call	[esi*2+ebx]
	call	[edi*2+ebx]
	call	[ebp*2+ebx]
; JMP [addr] 32-bit double-memref and scalar
	call	[eax*2+ebx+4]
	call	[ebx*2+ebx+5]
	call	[ecx*2+ebx+6]
	call	[edx*2+ebx+7]
	call	[esi*2+ebx+8]
	call	[edi*2+ebx+9]
	call	[ebp*2+ebx+10]
; JMP <near>
	call	0x1234
	call	0x5678
; JMP <32-bit near>
	call	dword 0x12345678
	call	dword 0x89ABCDEF
; JMP <far immediate>
	call	0x1234:0x5678
; call <32-bit far immediate>
	call	0x1234:dword 0x89ABCDEF
; JMP <far [addr]>
	call far	[bx]
	call far	[si]
	call far	[bp]
	call far	[bx+si]
	call far	[bx+di]
; JMP <far [32-bit addr]>
	call far	[eax]
	call far	[ebx]
	call far	[ecx]
	call far	[edx]
	call far	[esi]
	call far [edi]
	call far [esp]
	call far [ebp]
; JMP <32-bit far [addr]>
	call far dword [bx]
	call far dword [si]
	call far dword [bp]
	call far dword [bx+si]
	call far dword [bx+di]
; JMP <32-bit far 32-bit addr>
	call far dword [eax]
	call far dword [ebx]
	call far dword [ecx]
	call far dword [edx]
	call far dword [esi]
	call far dword [edi]
	call far dword [esp]
	call far dword [ebp]
; JMP <addr>
	call	word [0x1234]
	call	[dword 0x12345678]
	call far word [0x1234]
	call far [dword 0x12345678]

; NOPs
	nop
	nop
; XCHG <8-bit>
	xchg	al,al
	xchg	al,bl
	xchg	al,cl
	xchg	al,dl
	xchg	al,ah
	xchg	al,bh
	xchg	al,ch
	xchg	al,dh
; XCHG ax,<16-bit>
	xchg	ax,ax
	xchg	ax,bx
	xchg	ax,cx
	xchg	ax,dx
	xchg	ax,si
	xchg	ax,di
	xchg	ax,sp
	xchg	ax,bp
; XCHG <16-bit>
	xchg	bx,ax
	xchg	cx,bx
	xchg	dx,cx
	xchg	si,dx
	xchg	di,si
	xchg	sp,di
	xchg	bp,sp
	xchg	ax,bp
; XCHG <8-bit w/ mem>
	xchg	[si],al
	xchg	[si],bl
	xchg	[si],cl
	xchg	[si],dl
	xchg	[si],ah
	xchg	[si],bh
	xchg	[si],ch
	xchg	[si],dh
; XCHG <8-bit w/ mem>
	xchg	[esi],al
	xchg	[esi],bl
	xchg	[esi],cl
	xchg	[esi],dl
	xchg	[esi],ah
	xchg	[esi],bh
	xchg	[esi],ch
	xchg	[esi],dh
; XCHG <16-bit w/ mem>
	xchg	[si],ax
	xchg	[si],bx
	xchg	[si],cx
	xchg	[si],dx
	xchg	[si],si
	xchg	[si],di
	xchg	[si],sp
	xchg	[si],bp
; XCHG eax,<32-bit>
	xchg	eax,eax
	xchg	eax,ebx
	xchg	eax,ecx
	xchg	eax,edx
	xchg	eax,esi
	xchg	eax,edi
	xchg	eax,esp
	xchg	eax,ebp
; XCHG <32-bit>
	xchg	ebx,eax
	xchg	ecx,ebx
	xchg	edx,ecx
	xchg	esi,edx
	xchg	edi,esi
	xchg	esp,edi
	xchg	ebp,esp
	xchg	eax,ebp
; XCHG <32-bit w/ mem>
	xchg	[si],eax
	xchg	[si],ebx
	xchg	[si],ecx
	xchg	[si],edx
	xchg	[si],esi
	xchg	[si],edi
	xchg	[si],ebp
	xchg	[si],esp
; XCHG <32-bit w/ 32-bit mem>
	xchg	[esi],eax
	xchg	[esi],ebx
	xchg	[esi],ecx
	xchg	[esi],edx
	xchg	[esi],esi
	xchg	[esi],edi
	xchg	[esi],ebp
	xchg	[esi],esp
; JMP <addr>
	xchg	[0x1234],ax
	xchg	[dword 0x12345678],ax
	xchg	[0x1234],eax
	xchg	[dword 0x12345678],eax

; MOV reg,reg
	mov	al,al
	mov	al,ah
	mov	al,bl
	mov	al,bh
	mov	al,cl
	mov	al,ch
	mov	al,dl
	mov	al,dh
; MOV reg,reg (other than AL)
	mov	bl,al
	mov	bh,ah
	mov	cl,bl
	mov	ch,bh
	mov	dl,cl
	mov	dh,ch
	mov	al,dl
	mov	ah,dh
; MOV reg,reg
	mov	ax,ax
	mov	ax,bx
	mov	ax,cx
	mov	ax,dx
	mov	ax,si
	mov	ax,di
	mov	ax,bp
	mov	ax,sp
; MOV reg,reg
	mov	cx,ax
	mov	dx,bx
	mov	si,cx
	mov	di,dx
	mov	sp,si
	mov	bp,di
	mov	ax,bp
	mov	bx,sp
; MOV reg,reg
	mov	eax,eax
	mov	eax,ebx
	mov	eax,ecx
	mov	eax,edx
	mov	eax,esi
	mov	eax,edi
	mov	eax,ebp
	mov	eax,esp
; MOV reg,reg
	mov	ecx,eax
	mov	edx,ebx
	mov	esi,ecx
	mov	edi,edx
	mov	esp,esi
	mov	ebp,edi
	mov	eax,ebp
	mov	ebx,esp
; MOV reg,imm (byte)
	mov	al,0
	mov	al,1
	mov	al,0xCC
	mov	ah,1
	mov	bl,2
	mov	cl,3
	mov	ch,4
	mov	dl,5
	mov	dh,6
; MOV reg,imm (word)
	mov	ax,0
	mov	bx,1
	mov	cx,2
	mov	dx,3
	mov	si,4
	mov	di,5
	mov	sp,6
	mov	bp,7
; MOV reg,imm (dword)
	mov	eax,0
	mov	ebx,1
	mov	ecx,2
	mov	edx,3
	mov	esi,4
	mov	edi,5
	mov	esp,6
	mov	ebp,7
; MOV r/m,imm (byte)
	mov	byte [si],1
	mov	byte [di],2
	mov	byte [bx],3
	mov	byte [bx+si],4
	mov	byte [bx+di],5
; MOV r/m,imm (byte 32-bit)
	mov	byte [eax],1
	mov	byte [ebx],2
	mov	byte [ecx],3
	mov	byte [edx],4
	mov	byte [esi],5
	mov	byte [edi],5
; MOV r/m,imm (word)
	mov	word [si],1
	mov	word [di],2
	mov	word [bx],3
	mov	word [bx+si],4
	mov	word [bx+di],5
; MOV r/m,imm (word 32-bit)
	mov	word [eax],1
	mov	word [ebx],2
	mov	word [ecx],3
	mov	word [edx],4
	mov	word [esi],5
	mov	word [edi],5
; MOV r/m,imm (dword)
	mov	dword [si],1
	mov	dword [di],2
	mov	dword [bx],3
	mov	dword [bx+si],4
	mov	dword [bx+di],5
; MOV r/m,imm (dword 32-bit)
	mov	dword [eax],1
	mov	dword [ebx],2
	mov	dword [ecx],3
	mov	dword [edx],4
	mov	dword [esi],5
	mov	dword [edi],5
; MOV AX <=> [mem addr]
	mov	al,[0x1234]
	mov	ax,[0x1234]
	mov	eax,[0x1234]
	mov	[0x1234],al
	mov	[0x1234],ax
	mov	[0x1234],eax
; MOV AX <=> [mem addr 32]
	mov	al,[dword 0x12345678]
	mov	ax,[dword 0x12345678]
	mov	eax,[dword 0x12345678]
	mov	[dword 0x12345678],al
	mov	[dword 0x12345678],ax
	mov	[dword 0x12345678],eax
; MOV reg,reg
	mov	[eax],eax
	mov	[ebx],ebx
	mov	[edx],ecx
	mov	[esi],edx
	mov	[edi],esi
	mov	[ebp],edi
	mov	[esi],ebp
	mov	[ecx],esp

