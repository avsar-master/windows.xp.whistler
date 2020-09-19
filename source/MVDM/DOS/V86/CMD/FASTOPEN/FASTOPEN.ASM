; fastopen.asm
;
; Copyright (c) 2000, Microsoft Corporation
;
; History:
;   13-Apr-2000 Sudeep Bharati (sudeepb)
;   Created.
;
;   On NT this utility is just a stub which does nothing.
;

code	segment byte public 'CODE'
	assume	cs:code, ds:code, es:code

	org	100h
public	start
start:
	mov	ah,4ch
	xor	al,al
	int	21h
	ret

code	ends
	end	start
