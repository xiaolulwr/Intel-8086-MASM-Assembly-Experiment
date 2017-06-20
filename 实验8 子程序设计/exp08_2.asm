DATA SEGMENT
SCORES DW 76,69,84,90,73,88,99,63,100,80
TOTAL DW ($-SCORES)/2
S6 DW ?
S7 DW ?
S8 DW ?
S9 DW ?
S10 DW ?
DATA ENDS

STACK SEGMENT STACK
DB 200 DUP(0)
STACK ENDS

CODE SEGMENT
	ASSUME DS:DATA,SS:STACK,CS:CODE 

;子程序功能：判断成绩
;入口参数：[BX+SI]中的成绩
;出口参数：S6-S10

sol PROC
	PUSH DI
	PUSH AX
	PUSH DX
	
	MOV DI,[BX+SI]
	MOV AX,DI
	MOV DH,10
	IDIV DH
	MOV AH,0
	MOV DI,AX
	SUB DI,6
	ADD DI,DI
	INC [S6+DI]
	
	POP DX
	POP AX
	POP DI
	RET
sol ENDP

START:
	MOV AX,DATA
	MOV DS,AX
	
	MOV CX,TOTAL
	LEA BX,SCORES
	MOV SI,0
	
cal:CALL sol
	ADD SI,2
	LOOP cal
	
	MOV AH,4CH
	INT 21H
CODE ENDS
	END START