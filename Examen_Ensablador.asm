; Estudiante: Venegas Venegas Cristopher Axel
; Programa que lea dos cadenas A y B, las cuales solo pueden ser de 20 caracteres
; Comparar dos cadenas y debe decir cual es el mayor y si son iguales 
; Imprime que son iguales sino lo son que imprima que no son iguales y diga quien es el mayor

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

; Limpia la pantalla usando un MACRO, este MACRO se realizo en clase
CLS Macro
    mov Ah, 0Fh
    int 10h
    mov Ah, 0h
    int 10h
ENDM
    
.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa
; Tarea: Pedir al usuario un numeor y mostrar su numeros de multiplicar
CLS

IMPRIME Mge1
LEER A
mov [A+21], 24h
IMPRIME Salto

IMPRIME Mge2
LEER B
mov [B+21], 24h
IMPRIME Salto

mov Cx, 20      
mov Cont, 0h         

FinCiclo:
xor Ax, Ax        
add Cont, 1
mov Bl, Cont      

mov Si, offset A+2
add Si, Bx
mov Ah, [Si]

mov Di, offset B+2
add Di, Bx
mov Al, [Di]

cmp Ah, Al          
je Iguales
ja MayorB           
jb MayorA           
          

Iguales:
loop FinCiclo
IMPRIME Mge3
jmp Fin       

MayorA:
IMPRIME Mge4
IMPRIME Salto
IMPRIME Mge6
IMPRIME B+2
jmp Fin

MayorB:
IMPRIME Mge4
IMPRIME Salto
IMPRIME Mge5
IMPRIME A+2
jmp Fin

Fin:
mov Ax, 4C00h
int 21h

.DATA

Mge1 db "Ingrese la cadena A: $"
Mge2 db "Ingrese la cadena B: $"
Mge3 db "Son iguales: $"  
Mge4 db "No son iguales: $" 
Mge5 db "El mayor es A $"
Mge6 db "El mayor es B $"

A db 20,?,20 dup(24h)
B db 20,?,20 dup(24h)
Cont db 5,?,5 dup(24h)
Salto db 10, 13, 24h

                        
.STACK
