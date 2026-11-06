; Estudiante: Venegas Venegas Cristopher Axel
; Programa: Examen de Ensamblador

CLS Macro
    mov Ah, 0Fh
    int 10h
    mov Ah, 0h
    int 10h
ENDM

.MODEL SMALL
.CODE
Inicio:

mov Ax, @Data
mov Ds, Ax

CLS

call Menu
mov Dx, offset Salto
call Imprimir
mov Dx, offset Opciones
add Dx, 2
call Imprimir

mov Ax, 4C00h
int 21h

Menu PROC
CicloMenu:
mov Dx, offset Msg1
call Imprimir 
mov Dx, offset Salto
call Imprimir
mov Dx, offset Msg2 
call Imprimir 
mov Dx, offset Salto
call Imprimir
mov Dx, offset Msg3 
call Imprimir 
mov Dx, offset Salto
call Imprimir
mov Dx, offset Msg4 
call Imprimir 
mov Dx, offset Salto
call Imprimir
mov Dx, offset Msg6 
call Imprimir 
mov Dx, offset Salto
call Imprimir
mov Dx, offset Msg7
call Imprimir

mov Dx, offset Opciones
call LEER

mov Ah, Opciones+2
sub Ah, 30h    
    
mov Al,1    
Cmp Ah,Al
je Serie

mov Al,2    
Cmp Ah,Al
je Tabla

mov Al,3    
Cmp Ah,Al
je Aritmeticas

mov Al,4    
Cmp Ah,Al
je Salir    
    
Serie:
mov Dx, offset Salto
call Imprimir
call SerieFibonacci
mov Dx, offset Salto
call Imprimir
jmp CicloMenu

Tabla:
mov Dx, offset Salto
call Imprimir
call TablaMulti
mov Dx, offset Salto
call Imprimir
jmp CicloMenu

Aritmeticas:
mov Dx, offset Salto
call Imprimir
call OpeAritme
mov Dx, offset Salto
call Imprimir
jmp CicloMenu
                 
Salir:       
mov Dx, offset Salto
call Imprimir
ret    
Menu EndP    


SerieFibonacci PROC
    mov Dx, offset Msg8
    call Imprimir
    
    mov Dx, offset NumFibonacci
    call LEER
    
    mov Dx, offset Salto
    call Imprimir
    
    xor Ax, Ax
    mov Al, 2
    mov Ah, NumFibonacci+2
    sub Ah, 30h
    push Cx
    xor Cx, Cx
    mov Cl, Ah
    sub Cl, Al
    add Cl, 2
    mov Fibonacci+2, 1
    mov AuxFibonacci+2, 0
    
    CicloFibo:
    mov Dx, offset Fibonacci+2
    call Imprimir
    mov Dx, offset Msg9
    call Imprimir
    mov Ah, Fibonacci+2
    mov Bl, Ah
    mov Al, AuxFibonacci+2
    add Ah,Al
    mov Fibonacci+2,Ah
    mov AuxFibonacci+2,Bl
    loop CicloFibo
    pop Cx
    mov Dx, offset Salto
    call Imprimir
    ret    
SerieFibonacci EndP



TablaMulti Proc
    mov Dx, offset Msg10
    call Imprimir             
    
    mov Dx, offset NumTabla
    call LEER
    
    mov Dx, offset Salto
    call Imprimir
    
    mov Si, offset NumTabla
    call ConvertirDecimal
    mov AuxNum, Al        
    
    mov AuxMulti, 1       
    mov Cx, 10              
    
CicloMulti:
    push Cx              

    mov Al, AuxNum     
    mov Bl, AuxMulti     
    mul Bl                    
    mov TablaResu, Al
    
    mov Dx, offset NumTabla
    add Dx, 2
    call Imprimir
    
    mov Dx, offset Msg11
    call Imprimir
    
    mov Al, AuxMulti          
    mov Di, offset AuxMulti
    add Di, 2     
    call ConvertirAscii
    
    mov Dx, offset AuxMulti
    add Dx, 2
    call Imprimir
    
    mov Dx, offset Msg12
    call Imprimir
    
    mov Al, TablaResu     
    mov Di, offset TablaResu
    add Di, 2
    call ConvertirAscii          
   
    mov Dx, offset TablaResu
    add Dx, 2
    call Imprimir
    
    mov Dx, offset Salto
    call Imprimir             
    inc AuxMulti
    pop Cx            
    loop CicloMulti
    
    ret
TablaMulti EndP

OpeAritme Proc
    mov Dx, offset Msg24
    call Imprimir
    mov Dx, offset Salto
    call Imprimir     
    mov Dx, offset A
    call LEER
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg25
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir 
    mov Dx, offset B
    call LEER
    mov Dx, offset Salto
    call Imprimir
Arit:
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg15
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg16 
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg17 
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg18 
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg19 
    call Imprimir 
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg20
    call Imprimir
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg21
    call Imprimir
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg22
    call Imprimir
    mov Dx, offset Salto
    call Imprimir
    mov Dx, offset Msg23
    call Imprimir
    mov Dx, offset Salto
    call Imprimir
    
    xor Ax, Ax
    mov Dx, offset Opciones
    call LEER
    
    mov Ah, Opciones+2
    sub Ah, 30h
    mov OpSeleccionada, Ah
    mov Dx, offset Salto
    call Imprimir    
    
    mov Al, 8    
    cmp OpSeleccionada, Al
    je FinArit
 
    
    push Cx
    mov Si, offset A
    call ConvertirDecimal
    mov AuxA, Al
    mov Si, offset B
    call ConvertirDecimal
    mov AuxB, Al
    pop Cx

    mov Al, 1    
    cmp OpSeleccionada, Al
    je Sumaa

    mov Al, 2    
    cmp OpSeleccionada, Al
    je Restaa

    mov Al, 3    
    cmp OpSeleccionada, Al
    je Multii

    mov Al, 4    
    cmp OpSeleccionada, Al
    je Divi

    mov Al, 5    
    cmp OpSeleccionada, Al
    je Pote

    mov Al, 6    
    cmp OpSeleccionada, Al
    je Residuo

    mov Al, 7    
    cmp OpSeleccionada, Al
    je DiviEnte
    jmp Arit

Sumaa:
    mov Al, AuxA
    mov Ah, AuxB
    call SUMA
    jmp Mostrar

Restaa:         
    mov Al, AuxA
    mov Ah, AuxB
    call RESTA
    jmp Mostrar

Multii:
    mov Al, AuxA
    mov Bl, AuxB
    call MULTI
    jmp Mostrar

Divi:
    mov Al, AuxA
    mov Bl, AuxB
    call DIVIDIR
    jmp Mostrar

Pote:
    mov Al, AuxA
    mov Cl, AuxB
    call POTENCIA
    jmp Mostrar

Residuo:
    mov Al, AuxA
    mov Bl, AuxB
    call DIVIDIR
    mov Al, AuxResi
    jmp Mostrar

DiviEnte:
    mov Al, AuxA
    mov Bl, AuxB
    call DIVIDIR
    jmp Mostrar

Mostrar:
    mov Di, offset Resul+2
    call ConvertirAscii
    mov byte ptr [Resul+1], 3
    mov Dx, offset Resul+2
    call Imprimir
    mov Dx, offset Salto
    call Imprimir 
    jmp Arit

FinArit:
    ret
OpeAritme EndP              

ConvertirDecimal Proc
    xor Cx, Cx
    mov Cl, [Si+1]
    cmp Cl, 0
    je FinConvDec
    add Si, 2
    xor Bx, Bx
ConvDecCiclo:
    xor Ah, Ah              
    mov Al, 10
    mul Bl
    mov Bl, Al
    mov Al, [Si]
    sub Al, 30h
    add Bl, Al
    inc Si
    loop ConvDecCiclo
    mov Al, Bl
FinConvDec:
    ret
ConvertirDecimal EndP

ConvertirAscii Proc
    mov Ah, 0
    mov Bl, 100
    div Bl
    add Al, 30h
    mov [Di], Al
    inc Di
    mov Al, Ah
    mov Ah, 0
    mov Bl, 10
    div Bl
    add Al, 30h
    mov [Di], Al
    inc Di
    mov Al, Ah
    add Al, 30h
    mov [Di], Al
    mov byte ptr [Di+1], 24h
    ret
ConvertirAscii EndP

LEER Proc
    mov Ah, 0Ah
    int 21h
    ret
LEER EndP

SUMA Proc
    add Al, Ah
    mov Ah, 0
    ret
SUMA EndP

RESTA Proc
    sub Al, Ah
    mov Ah, 0
    ret
RESTA EndP

MULTI Proc
    mul Bl
    ret
MULTI EndP

DIVIDIR Proc
    xor Ah, Ah
    div Bl
    mov AuxResi, Ah
    ret
DIVIDIR EndP

POTENCIA PROC
    mov Bl, Al
    mov Al, 1
    mov Ah, 0
    cmp Cl, 0
    je FinPoten
CicloPoten:
    mul Bl
    dec Cl
    jnz CicloPoten
FinPoten:
    ret
POTENCIA EndP

Imprimir Proc
    mov Ah, 09h
    int 21h
    ret
Imprimir EndP


.DATA
Msg1 db "'''''MENU''''$"
Msg2 db "1.Serie $"
Msg3 db "2.Tablas $"
Msg4 db "3.Aritmeticas $"
Msg6 db "4.Salir $"
Msg7 db "Selecione la opcion a ejecutar: $"

Msg8 db "Ingrese la cantidad de elementos de la serie de Fibonacci: $"
Msg9 db ", $"

Msg10 db "Ingrese el numero para imprimir la tabla:$"
Msg11 db " x $"
Msg12 db " = $" 

Msg15 db "SELECIONE QUE OPERACION DESEAS REALIZAR:$"
Msg16 db "1.Suma$"
Msg17 db "2.Resta$"
Msg18 db "3.Multiplicacion$"
Msg19 db "4.Division$"
Msg20 db "5.Potencia$"
Msg21 db "6.Residuo$"
Msg22 db "7.DivisionEntera$"
Msg23 db "8.Salir$"

Msg24 db "Valor A$"
Msg25 db "Valor B$"


Opciones db 5,?,5 dup (24h)
OpSeleccionada db 0        

AuxFibonacci db 5,?,5 dup (24h)
Fibonacci db 5,?,5 dup (24h)
NumFibonacci db 5,?,5 dup (24h)

NumTabla db 5,?,5 dup (24h)
AuxMulti db 5,?,5 dup (24h)
TablaResu db 5,?,5 dup (24h)
AuxNum db 5,?,5 dup (24h) 

A db 5, ?,5 dup (24h)
B db 5, ?,5 dup (24h)

AuxA db 0                    
AuxB db 0                    

Resul db 5, ?,5 dup (24h)
AuxResi db 0
                                                
Salto db 10, 13, 24h
                        
.STACK
END Inicio