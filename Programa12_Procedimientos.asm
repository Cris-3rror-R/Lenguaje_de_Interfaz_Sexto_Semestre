.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa

;Leer primer numero
    Mov Dx, offset Msg1
    Mov Ah, offset 09h
    int 21h
    
    Call LeerNumero
    Mov Num1, Al
    
;Leer segundo numero 
    Mov Dx, offset Msg2
    Mov Ah, offset 09h
    int 21h
    
    Call LeerNumero
    Mov Num2, Al
    
;-----SUMA------
    Mov Al, Num1   ;Pasamos valores leidos en Num1 y Num2 al Al y Bl
    Mov Bl, Num2   ;que son los parametros de entrada al procidimiento
    Call Sumar
    Mov Resultado, Ax
    
    Mov Dx, offset MsgSuma
    Mov Ah, 09h
    int 21h       
    
    Mov Ax, Resultado       ; Ax es parametro de entrada al Proc ImprimirNumero
    Call ImprimirNumero
    
;----RESTA----------
    Mov Al, Num1
    Mov Bl, Num2
    Call Restar
    Mov Resultado, Ax
    
    Mov Dx, offset MsgResta
    Mov Ah, 09h
    int 21h
    
   
mov Ax, 4C00h
int 21h

;//////////////////////////////////////////////////////////
; PROCEDIMIENTO LeerNumero
; Leer un digito (0,9) y devuelve Al con su valor numerico
;//////////////////////////////////////////////////////////   
LeerNumero Proc
    Mov Ah, 01h
    Int 21h
    Sub Al, 30h
    Ret
LeerNumero EndP


;///////////////////////////////////
; PROCEDIMIENTO: Sumar
; Entrada Al = Num1, Bl = Num2
; Salida Ax = Resultado
;///////////////////////////////////
Sumar Proc
    Xor Ah, Ah
    Xor Bh, Bh
    Add Ax, Bx
    Ret
Sumar EndP 

;//////////////////////////////////
; PROCEDIMIENTO: Restar
; Entrada: Al = Num1, Bl = Num2
; Salida : Ax = Resultado
; ////////////////////////////////
Restar Proc
    Xor Ah, Ah
    Xor Bh, Bh
    Sub Ax, Bx
    Ret
Restar EndP

;//////////////////////////////////
; PROCEDIMIENTO: Imprimir numero
; Entrada: Ax = Numero a imprimir
; ////////////////////////////////
ImprimirNumero Proc
    mov Bx, 10
    Xor Dx, Dx
    Div Bx      ; Ax/10, Al = Decenas, Ah = Unidades
    
    Add Al, 30h
    Mov Dl, Al
    Mov Ah, 02h
    int 21h
    
    Mov Al, Ah
    Add Al, 30h
    Mov Dl, Al
    Mov Ah, 02h
    int 21h
    
    Mov Dl, 13h ;Mandamos a Dl una vuelta de carro (crep)
    Mov Ah, 02h
    int 21h
    Mov Dl, 10
    int 21h
    ret
ImprimirNumero EndP 


.DATA

Msg1 db "Ingrese el primer numero: $"
Msg2 db "Ingrese el segundo numero: $"
MsgSuma db "La suma es: $"
MsgResta db "La resta es: $"

Num1 db ?
Num2 db ?
Resultado dw ?



.STACK
END Inicio