;Alumno: Cristopher Axel Venegas Venegas
;Examen de Ensamblador 2 de Junio del 2026

.MODEL SMALL
.CODE
Inicio:

mov Ax, @Data
mov Ds, Ax

Menu:
mov Ah,09h
mov Dx, offset Msg1
int 21h

mov Ah,0Ah
mov Dx,offset Salir
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h

mov Si, offset [Salir+2]
mov Si, Bx
mov Ah, [Si]
mov Di, offset [MsgS+2]
add Di, Bx
mov Al, [Di]
cmp Ah,Al
je Fin

mov Si, offset [Salir+2]
mov Si, Bx
mov Ah, [Si]
mov Di, offset [MsgN+2]
add Di, Bx
mov Al, [Di]
cmp Ah,Al
je Leer 

mov Ah,09h
mov Dx, offset Msg2
int 21h

mov Ah,0Ah
mov Dx, offset Salto
int 21h

jmp Menu

Leer:
mov Ah,09h
mov Dx, offset MsgA
int 21h

mov Ah,0Ah
mov Dx,offset A
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h

mov Ah,09h
mov Dx, offset MsgB
int 21h

mov Ah,09h
mov Dx,offset B
int 21h

mov Ah,0Ah
mov Dx, offset Salto
int 21h

mov Ah,09h
mov Dx, offset MsgC
int 21h

mov Ah,0Ah
mov Dx,offset C
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h


xor Cx, Cx   
mov Cl, [A+1]
mov Sum+2, 0      
mov Si, offset A+2
add Si, Cx
dec Si
mov Exp+2, 0
mov Base+2, 10

CicloA:
push Cx

Cmp Exp,0
jne CalcularA1
mov R+2,1
    
CalcularA1:
Cmp Exp,1
jne CalcularA2
mov R+2, 10
    
CalcularA2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularA:
mul Base
loop CalcularA
mov R+2, Al 

pop Cx

xor Al, Al
mov Al, [Si]
sub Al, 30h
mul R+2 
add Sum+2, Al
inc Exp+2
dec Si
loop CicloA

mov Exp+2, 2       
mov Cx, 3           
mov Si, offset AuxR+2

mov Ah, AuxR+2
mov A, Ah
sub A,30h

xor Cx, Cx   
mov Cl, [B+1]
mov Sum+2, 0      
mov Si, offset B+2
add Si, Cx
dec Si
mov Exp+2, 0
mov Base+2, 10

CicloB:
push Cx

Cmp Exp,0
jne CalcularB1
mov R+2,1
    
CalcularB1:
Cmp Exp,1
jne CalcularB2
mov R+2, 10
    
CalcularB2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularB:
mul Base
loop CalcularB
mov R+2, Al 

pop Cx

xor Al, Al
mov Al, [Si]
sub Al, 30h
mul R+2 
add Sum+2, Al
inc Exp+2
dec Si
loop CicloB

mov Exp+2, 2       
mov Cx, 3           
mov Si, offset AuxR+2

mov Ah, AuxR+2
mov B, Ah
sub B,30h


xor Cx, Cx   
mov Cl, [C+1]
mov Sum+2, 0      
mov Si, offset C+2
add Si, Cx
dec Si
mov Exp+2, 0
mov Base+2, 10

CicloC:
push Cx

Cmp Exp,0
jne CalcularC1
mov R+2,1
    
CalcularC1:
Cmp Exp,1
jne CalcularC2
mov R+2, 10
    
CalcularC2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularC:
mul Base
loop CalcularC
mov R+2, Al 

pop Cx

xor Al, Al
mov Al, [Si]
sub Al, 30h
mul R+2 
add Sum+2, Al
inc Exp+2
dec Si
loop CicloC

mov Exp+2, 2       
mov Cx, 3           
mov Si, offset AuxR+2

mov Ah, AuxR+2
mov C, Ah
sub C,30h

mov Ah,A
cmp Ah,B
ja MayorA

mov Ah,B
cmp Ah,C
ja MayorB

mov Ah,09h
mov Dx, offset MsgMayor
int 21h

mov Exp+2, 2       
mov Cx, C+1           
mov Si, offset AuxR+2

CicloInversoCA:
push Cx     

Cmp Exp,0
jne CalcularCA1
mov R+2,1
    
CalcularCA1:
Cmp Exp,1
jne CalcularCA2
mov R+2, 10
    
CalcularCA2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularCA:
mul Base
loop CalcularCA
mov R+2, Al 
   
xor Ax, Ax
mov Al, Sum+2  
mov Bl, R+2 
div Bl  

add Al, 30h
mov [Si], Al  
inc Si

mov Sum+2, Ah   
dec Exp+2
    
pop Cx       
loop CicloInversoCA
mov [Si], 24h

mov Ah, 09h
mov Dx, offset AuxR+2
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h

mov Ah,09h
mov Dx, offset MsgMenor
int 21h

mov Exp+2, 2       
mov Cx, A+1           
mov Si, offset AuxR+2

CicloInversoAA:
push Cx     

Cmp Exp,0
jne CalcularAA1
mov R+2,1
    
CalcularAA1:
Cmp Exp,1
jne CalcularAA2
mov R+2, 10
    
CalcularAA2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularAA:
mul Base
loop CalcularAA
mov R+2, Al 
   
xor Ax, Ax
mov Al, Sum+2  
mov Bl, R+2 
div Bl  

add Al, 30h
mov [Si], Al  
inc Si

mov Sum+2, Ah   
dec Exp+2
    
pop Cx       
loop CicloInversoAA
mov [Si], 24h

mov Ah, 09h
mov Dx, offset AuxR+2
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h


MayorA:
mov Ah, A
cmp Ah,C
jb MayorC

mov Ah,09h
mov Dx, offset MsgMayor
int 21h

mov Exp+2, 2       
mov Cx, A+1           
mov Si, offset AuxR+2

CicloInversoAAA:
push Cx     

Cmp Exp,0
jne CalcularCA1
mov R+2,1
    
CalcularAAA1:
Cmp Exp,1
jne CalcularCA2
mov R+2, 10
    
CalcularAAA2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularAAA:
mul Base
loop CalcularAAA
mov R+2, Al 
   
xor Ax, Ax
mov Al, Sum+2  
mov Bl, R+2 
div Bl  

add Al, 30h
mov [Si], Al  
inc Si

mov Sum+2, Ah   
dec Exp+2
    
pop Cx       
loop CicloInversoAAA
mov [Si], 24h

mov Ah, 09h
mov Dx, offset AuxR+2
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h

mov Ah,09h
mov Dx, offset MsgMenor
int 21h

mov Ah,B
cmp Ah,C
ja MenorC

mov Exp+2, 2       
mov Cx, B+1           
mov Si, offset AuxR+2

CicloInversoBBB:
push Cx     

Cmp Exp,0
jne CalcularBBB1
mov R+2,1
    
CalcularBBB1:
Cmp Exp,1
jne CalcularBBB2
mov R+2, 10
    
CalcularBBB2:
xor Cx, Cx
mov Cl, Exp 
dec Cx
xor Ax, Ax
mov Al, Base
    
CalcularBBB:
mul Base
loop CalcularBBB
mov R+2, Al 
   
xor Ax, Ax
mov Al, Sum+2  
mov Bl, R+2 
div Bl  

add Al, 30h
mov [Si], Al  
inc Si

mov Sum+2, Ah   
dec Exp+2
    
pop Cx       
loop CicloInversoBBB
mov [Si], 24h

mov Ah, 09h
mov Dx, offset AuxR+2
int 21h

mov Ah,09h
mov Dx, offset Salto
int 21h

mov Ah,09h
mov Dx, offset MsgMenor
int 21h

MayorB:





























jmp Menu





Fin:
mov Ax, 4C00h
int 21h

.DATA
Msg1 db "Quieres salir del programa? $"
Msg2 db "Respuesta invalida $" 
MsgA db "Valor A$"
MsgB db "Valor B$"
MsgC db "Valor C$"
MsgS db "SI$"
MsgN db "NO$" 
MsgMayor db "El mayor es $"
MsgMenor db "El menor es $"


A db 8,?,8 dup (24h)
B db 8,?,8 dup (24h)
C db 8,?,8 dup (24h)

R db 8,?,8 dup (24h)
AuxR db 8,?,8 dup (24h)
Sum db 8,?,8 dup (24h)
Exp db 8,?,8 dup (24h)
Base db 8,?,8 dup (24h)


Salir db 8,?,8 dup (24h)


Salto db 10h, 13h, 24h

.STACK
End Inicio