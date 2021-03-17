.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outlich PROTO : DWORD

 outrad PROTO : DWORD

 concat PROTO : DWORD, : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 byte 'Resultat: ', 0
		LTRL2 sdword 327
		LTRL3 sdword 9
		LTRL4 sdword -9
		LTRL5 byte 'Kursach ', 0
		LTRL6 byte 'sdelan!!!', 0
		LTRL7 byte '32', 0
		LTRL8 byte 'Peravod z radka y lichby: ', 0
		LTRL9 sdword 1
		LTRL10 byte 'Dayjhinia radka a:', 0
		LTRL11 sdword 2
		LTRL12 sdword 3
		LTRL13 byte 'Zdvig yleva: ', 0
		LTRL14 byte 'Pamijh 327 i 9 bolsh: ', 0
		LTRL15 byte 'Cycle ad 1 da 5: ', 0
		LTRL16 sdword 5
		LTRL17 byte ' ', 0
		LTRL18 byte 'Resht ad dzyalennya 32 na 5: ', 0
		LTRL19 byte '---------------------------------', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres sdword 0
		standstr dword ?
		mainx sdword 0
		mainy sdword 0
		mainz sdword 0
		maina dword ?
		mainb dword ?
		mainc dword ?
		maine sdword 0
		maink sdword 0
		mainresult sdword 0
		maint sdword 0
		mainab sdword 0
		mainh sdword 0
.code

;----------- min ------------
min PROC,
	minx : sdword, miny : sdword  
; --- save registers ---
push ebx
push edx
; ----------------------
mov edx, minx
cmp edx, miny

jg right1
jl wrong1
right1:
push minx

pop ebx
mov minres, ebx

jmp next1
wrong1:
push miny

pop ebx
mov minres, ebx

next1:
; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, minres
ret
min ENDP
;------------------------------


;----------- stand ------------
stand PROC,
	standa : dword, standb : dword  
; --- save registers ---
push ebx
push edx
; ----------------------

push standb
push standa
push offset buffer
call concat
mov standstr, eax
push offset newline
call outrad


push offset LTRL1
call outrad


push standstr
call outrad

push offset newline
call outrad

; --- restore registers ---
pop edx
pop ebx
; -------------------------
ret
stand ENDP
;------------------------------


;----------- MAIN ------------
main PROC
push LTRL2

pop ebx
mov mainx, ebx

push LTRL3

pop ebx
mov mainy, ebx

push mainx
push mainy
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov mainx, ebx


push mainx
call outlich

push LTRL4

pop ebx
mov mainz, ebx

mov maina, offset LTRL5
mov mainb, offset LTRL6
mov mainc, offset LTRL7

push offset LTRL8
call outrad


push mainc
push offset buffer
call atoii
push eax

pop ebx
mov maine, ebx


push maine
call outlich

push offset newline
call outrad


push maina
push offset buffer
call lenght
push eax
push LTRL9
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov maink, ebx


push offset LTRL10
call outrad


push maink
call outlich

push offset newline
call outrad

push mainx
push LTRL11
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax
push LTRL12
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax

pop ebx
mov mainresult, ebx


push offset LTRL13
call outrad


push mainresult
call outlich

push offset newline
call outrad


push offset LTRL14
call outrad

push offset newline
call outrad

push LTRL9

pop ebx
mov mainab, ebx


push offset LTRL15
call outrad

mov edx, mainab
cmp edx, LTRL16

jnz cycle2
jmp cyclenext2
cycle2:

push mainab
call outlich


push offset LTRL17
call outrad

push mainab
push LTRL9
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL16

jnz cycle2
cyclenext2:

push mainab
call outlich

push offset newline
call outrad

push maine
push LTRL16
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov mainh, ebx


push offset LTRL18
call outrad


push mainh
call outlich

push offset newline
call outrad


push offset LTRL19
call outrad


push mainb
push maina
call stand


push offset LTRL19
call outrad

push 0
call ExitProcess
main ENDP
end main
