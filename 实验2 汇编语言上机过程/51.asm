DATA SEGMENT

STR DB 0AH,'Hello World!$'

DATA ENDS

STACK SEGMENT STACK

STACK ENDS

CODE SEGMENT
	ASSUME DS:DATA,SS:STACK,CS:CODE
START:

MOV AX,DATA
MOV DS,AX
LEA DX,STR
MOV CX,04H

s: 	MOV AH,9
	INT 21H	
	loop s

MOV AX,4C00H
INT 21H

CODE ENDS
END START