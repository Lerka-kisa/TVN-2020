.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 concat PROTO : DWORD, : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 sdword 1
		LTRL2 byte 'Len + 1:', 0
		LTRL3 byte 'Resultat: ', 0
		LTRL4 sdword 327
		LTRL5 sdword 9
		LTRL6 sdword -9
		LTRL7 byte 'Kursach ', 0
		LTRL8 byte 'sdelanij', 0
		LTRL9 byte '70', 0
		LTRL10 byte 'from string in lichba:', 0
		LTRL11 sdword 2
		LTRL12 byte 'sdvig left:', 0
		LTRL13 sdword 3
		LTRL14 sdword 52
		LTRL15 byte ' ', 0
		LTRL16 byte ' after cycle ', 0
		LTRL17 byte '!!!!!!', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres sdword 0
		standk sdword 0
		standstr dword ?
		mainl sdword 0
		mainx sdword 0
		mainy sdword 0
		mainstrx dword ?
		mainstry dword ?
		mainstrz dword ?
		maine sdword 0
		mainresult sdword 0
		maint sdword 0
		mainab sdword 0
		maind sdword 0
		mainyra dword ?
		mainend dword ?
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

jl right1
jg wrong1
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

push standa
push offset buffer
call lenght
push eax
push LTRL1
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov standk, ebx


push offset LTRL2
call outstr


push standk
call outnum

push offset newline
call outstr


push standb
push standa
push offset buffer
call concat
mov standstr, eax
push offset newline
call outstr


push offset LTRL3
call outstr


push standstr
call outstr

push offset newline
call outstr

; --- restore registers ---
pop edx
pop ebx
; -------------------------
ret
stand ENDP
;------------------------------


;----------- MAIN ------------
main PROC
push LTRL4

pop ebx
mov mainl, ebx

push LTRL5

pop ebx
mov mainx, ebx

push LTRL6

pop ebx
mov mainy, ebx

mov mainstrx, offset LTRL7
mov mainstry, offset LTRL8
mov mainstrz, offset LTRL9

push offset LTRL10
call outstr


push mainstrz
push offset buffer
call atoii
push eax

pop ebx
mov maine, ebx


push maine
call outnum

push offset newline
call outstr

push mainx
push LTRL1
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax
push LTRL11
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax

pop ebx
mov mainresult, ebx


push offset LTRL12
call outstr


push mainresult
call outnum

push offset newline
call outstr


push mainy
push mainx
call min
push eax

pop ebx
mov maint, ebx


push maint
call outnum

push offset newline
call outstr

push LTRL13

pop ebx
mov mainab, ebx


pop ebx
mov maind, ebx

mov edx, mainab
cmp edx, LTRL14

jnz cycle2
jmp cyclenext2
cycle2:

push mainab
call outnum


push offset LTRL15
call outstr

push mainab
push LTRL11
pop ebx
pop eax
add eax, ebx
push eax
push LTRL11
pop ebx
pop eax
imul eax, ebx
push eax

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL14

jnz cycle2
cyclenext2:

push offset LTRL16
call outstr


push mainab
call outnum

push offset newline
call outstr

push offset newline
call outstr


push mainstry
push mainstrx
push offset buffer
call concat
mov mainyra, eax
mov mainend, offset LTRL17
push offset newline
call outstr


push mainend
push mainyra
call stand

push offset newline
call outstr

push 0
call ExitProcess
main ENDP
end main
