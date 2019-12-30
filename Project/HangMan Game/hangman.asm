include irvine32.inc

.data
	month1 byte "january",0
	month2 byte "febuary",0
	month3 byte "march",0
	month4 byte "april",0
	month5 byte "may",0
	month6 byte "june",0
	month7 byte "july",0
	month8 byte "august",0
	month9 byte "september",0
	month10 byte "octber",0
	month11 byte "november",0
	month12 byte "december",0
	garbage dword ?
	count byte 0
	month byte 10 dup(0)
	monthC byte 10 dup(0)
	hide_month byte 10 dup('-')
	
	msg1 byte "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0
	msg2 byte "Hangman Game!",0
	msg3 byte "You have ",0
	msg4 byte " tries to try and guess the month.",0
	msg5 byte "Play!",0		
	
	msg6 byte "Guess a letter: ",0
	msg7 byte "Incorrect letter.",0
	msg8 byte "NICE! You guess a letter",0
	msg9 byte "Congratulations! You got it!",0
	msg10 byte "The month is ", 0
	msg11 byte "NOOOOOOO!...you've been hanged.",0
	msg12 byte "The month was ", 0
	msg13 byte "play again     y/n", 0
	
	numTry byte 3
	letter byte 0
	flag1 byte 0
	flag2 byte 0
	
	
.code

secretMonth proc
				; random function and count size of string
	xor ebx,ebx
	shld bx, ax, 4
	ror eax,1
	mov garbage, eax
	xor esi, esi
	cmp bx, 0
	je L0
	cmp bx, 13
	je L13
	cmp bx, 14
	je L14
	cmp bx, 15
	je L15
	cmp bx, 1
	jne L1
		mov esi, offset month1
		mov count, sizeof month1
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC1:
			mov al, [esi]
			mov month[edi], al
			mov monthC[edi], al
			inc edi
			inc esi
		Loop arrayC1
		
	jmp last
	L1:
	cmp bx, 2
	jne L2
		mov esi, offset month2
		mov count, sizeof month2
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC2:
			mov al, [esi]
			mov month[edi], al
			mov monthC[edi], al
			inc edi
			inc esi
		Loop arrayC2
	jmp last
	L2:
	cmp bx, 3
	jne L3
		mov esi, offset month3
		mov count, sizeof month3
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC3:
			mov al, [esi]
			mov month[edi], al
			mov monthC[edi], al
			inc edi
			inc esi
		Loop arrayC3
	jmp last
	L3:
	cmp bx, 4
	jne L4
		mov esi, offset month4
		mov count, sizeof month4
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC4:
			mov al, [esi]
			mov month[edi], al
			mov monthC[edi], al
			inc edi
			inc esi
		Loop arrayC4
	jmp last
	L4:
	cmp bx, 5
	jne L5
	L0:
		mov esi, offset month5
		mov count, sizeof month5
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC5:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC5
	jmp last
	L5:
	cmp bx, 6
	jne L6
		mov esi, offset month6
		mov count, sizeof month6
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC6:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC6
	jmp last
	L6:
	cmp bx, 7
	jne L7
		mov esi, offset month7
		mov count, sizeof month7
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC7:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC7
	jmp last
	L7:
	cmp bx, 8
	jne L8
	L13:
		mov esi, offset month8
		mov count, sizeof month8
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC8:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC8
	jmp last
	L8:
	cmp bx, 9
	jne L9
		mov esi, offset month9
		mov count, sizeof month9
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC9:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC9
	jmp last
		
	L9:
	cmp bx, 10
	jne L10
	L14:
		mov esi, offset month10
		mov count, sizeof month10
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC10:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC10
	jmp last
	
	L10:
	cmp bx,11
	jne L11
		mov esi, offset month11
		mov count, sizeof month11
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC11:
			mov al, [esi]
			mov month[edi], al
			mov monthC[edi], al
			inc edi
			inc esi
		Loop arrayC11
	jmp last
	
	L11:
	cmp bx, 12
	jne L12
	L15:
		mov esi, offset month12
		mov count, sizeof month12
		dec count
		movzx ecx, count
		xor edi, edi
		arrayC12:
			mov al, [esi]
			mov monthC[edi], al
			mov month[edi], al
			inc edi
			inc esi
		Loop arrayC12
	last:
	L12:
	
	ret
secretMonth endp
hideMonth proc
	mov cl, count
	xor esi, esi
	hide:
		mov al, hide_month[esi]
		call writechar
		inc esi
	Loop hide
	call crlf
	ret
	
hideMonth endp
mainMenu proc
	call crlf
	mov edx, offset msg1
	call writestring
	call crlf
	call crlf
	mov edx, offset msg2
	call writestring
	call crlf
	call crlf
	mov edx, offset msg3
	call writestring
	
	xor eax,eax
	mov al, numTry
	call writedec
	
	mov edx, offset msg4
	call writestring
	call crlf
	call crlf
	mov edx, offset msg1
	call writestring
	call crlf
	call crlf
	ret
mainMenu endp

LoopWhile proc
	
	mov cl, numTry
	.while cl != 0
		call mainMenu
		call hideMonth
		xor eax,eax
		mov edx, offset msg6
		call writestring
		call readchar
		call crlf
		call crlf
		mov letter, al
		call checkGuess
		mov al, flag2
		cmp al, 0
		jz match
			mov edx, offset msg7
			call writestring
			call crlf
			mov al, numTry
			dec al
			mov numTry, al
			jmp nextt
		
		match:
			mov edx, offset msg8
			call writestring
			call crlf
		nextt:	
		call CompareString
		mov al, flag1
		cmp al, 1
		jnz notBreak
			mov edx, offset msg9
			call writestring
			call crlf
			call mainMenu
			mov edx, offset msg10
			call writestring
			mov cl, count
			xor esi,esi
			search:
				mov al, month[esi]
				call writechar
				inc esi
			Loop search
			call crlf
			jmp break
		
		notBreak:
		
		mov al, numTry
		cmp al, 0
		jnz continue
			mov edx, offset msg11
			call writestring
			call crlf
			call mainMenu
			mov edx, offset msg12
			call writestring
			mov cl, count
			xor esi,esi
			search1:
				mov al, month[esi]
				call writechar
				inc esi
			Loop search1
			call crlf
		continue:
		mov cl, numTry
		mov flag1,0
		mov flag2,0
	.endw
	
	break:
	ret
LoopWhile endp

checkGuess proc
	xor esi,esi
	xor edi,edi
	mov al, letter
	movzx edi, count
	.while edi != esi
		cmp al, monthC[esi]
		jz next1
		inc esi
	.endw
	mov flag2, 1
	Jmp next3
	next1:
		xor ebx,ebx
		mov bl, hide_month[esi]
		mov hide_month[esi], al
		mov monthC[esi], bl
	next3:
	ret
checkGuess endp

CompareString proc
	xor edi,esi
	xor esi,esi
	movzx edi, count
	.while edi != esi
		xor eax,eax
		mov al, hide_month[esi]
		cmp al, month[esi]
		jnz next
		inc esi
	.endw
	mov flag1, 1
	next:
	ret
CompareString endp

blankArray proc
	xor ecx,ecx
	xor esi, esi
	mov ecx, 10
	blank:
		mov hide_month[esi], '-'
		mov month[esi], 0
		mov monthC[esi],0
		
		inc esi
	Loop blank
	mov count, 0
	mov letter, 0
	mov numtry, 3
	mov flag1, 0
	mov flag2, 0
	mov eax, garbage
	ret
blankArray endp
main proc
	
	again:
	call crlf
	mov edx, offset msg5
	call writestring
	call crlf
	xor esi,esi
	xor edi,edi
	call secretMonth
	call LoopWhile
	
	mov edx, offset msg13
	call writestring
	call readchar
	cmp al, 'y'
	jnz notagain
	invoke blankArray
	jmp again
	notagain:
exit
main endp
end main