; Imprime MENSAJE con el servicio 09h usando un MACRO, este MACRO se realizo en clase
IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

; Leer una variable con el servicio 0Ah usando un MACRO, este MACRO se realizo en clase
LEER Macro Entrada
    mov Ah,0Ah
    mov Dx, offset Entrada
    int 21h
ENDM


POTENCIA Macro Base, Exp
    cmp Exp, 0
    je PoteCero 

    xor Cx, Cx
    mov Cl, Exp        
    mov Al, 1          
    
    Calcula:
    mul Base           
    loop Calcula
    
    mov R+2, Al        
    jmp FinPote
    
    PoteCero:
    mov R+2, 1
    FinPote:        
ENDM

.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa
IMPRIME Mge1
LEER Num
IMPRIME Salto

mov B+2, 10      
mov E+2, 0       
xor Cx, Cx
mov Cl, Num+1    

mov Ax, offset Num
add Ax, 2
add Al, Cl
dec Ax
mov word ptr [Aux2+2], Ax 

Ciclo:
mov Al, Cl
mov Aux1+2, Al 


POTENCIA B+2, E+2 

mov Di, word ptr [Aux2+2]
mov Al, [Di]     
sub Al, 30h        

mul R+2
       
mov Al, [Di]
mov Dx, offset Sum
add Dx, 2
xor Bh, Bh
mov Bl, [Aux1+2]
add Dx, Bx         
dec Dx              
mov Di, Dx
mov [Di], Al        

inc E+2            
mov Ax, word ptr [Aux2+2]
dec Ax            
mov word ptr [Aux2+2], Ax

xor Cx, Cx
mov Cl, Aux1+2    
loop Ciclo

IMPRIME Sum+2 
 
 
Fin:
    mov ax, 4C00h
    int 21h

.DATA

Salto db 10, 13, 24h
Mge1 db "Valor de Num: $"
Num db 8,?,8 dup (24h)
R db 8,?,8 dup (24h)

B db 8,?,8 dup (24h)

E db 8,?,8 dup (24h)

Sum db 8,?,8 dup (24h)

Dig db 8,?,8 dup (24h)

Aux1 db 8,?,8 dup (24h)
Aux2 db 8,?,8 dup (24h)

.STACK
END Inicio