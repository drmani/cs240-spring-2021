INCLUDE cs240.inc

.8086
	
TERMINATE = 4C00h
DOS = 21h

.data

msg	BYTE	"Hello, world!", 0

.code

pow PROC
	; AX = base
	; DX = exponent
	; Return:
	; DX = AX ^ DX
	pushf
	push	ax
	push	bx
	push	cx

	mov	bx, ax	; Base
	mov	ax, 1	; Intermediate result
	mov	cx, dx	; Loop counter (exponent)

	cmp	cx, 0
	je	zero 

top:
	imul	bx	; dx:ax = ax * bx
	call	DumpRegs
	loop	top

zero:	
	mov	dx, ax

	pop	cx
	pop	bx
	pop	ax
	popf
	ret
	
pow ENDP

END
