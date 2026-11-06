.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa

;Leer primer numero
    mov Dx, offset Msg1
    Call Imprimir
    
    mov Dx, offset Num1
    Call Leer
    Mov Num1, Al
    mov Dx, offset Salto
    Call Imprimir
    
;Leer segundo numero 
    mov Dx, offset Msg2
    Call Imprimir
    
    mov Dx, offset Num2
    Call Leer
    Mov Num2, Al
    mov Dx, offset Salto
    Call Imprimir
    
    mov Dx, offset Num1+2
    Call Imprimir
    

mov Ax, 4C00h
int 21h
                                                        
Leer Proc
   mov Ah,0Ah
   int 21h
   Ret
Leer EndP

Imprimir Proc
   mov Ah, 09h
   int 21h
   Ret
Imprimir EndP

Potencia Proc
   ; Bl recibe el valor del exponente
   ; Bh returna la potencia del exponente
 LOCAL Calcular1, Calcular2, Calcular, FinM 
   Cmp Bl,0
   jne Calcular1
   mov Bh,1
   jmp FinProc
   
   Calcular1:
   Cmp Bl,1
   jne Calcular2
   mov Bh,10
   jmp FinProc
   
   Calcular2:
   Cmp Bl,2
   jne Calcular3
   mov Bh,100
   jmp FinProc
   
   Calcular3:
   Cmp Bl,2
   jne FinProc
   mov Bh,100
                
   FinProc:
   ret 

Potencia EndP


.DATA

Salto db 10, 13, 24h

Msg1 db "Ingrese el primer numero: $"
Msg2 db "Ingrese el segundo numero: $"
MsgSuma db "La suma es: $"
MsgResta db "La resta es: $"

Num1 db 8,?,8 dup (24h+)
Num2 db 8,?,8 dup (24h)
Resultado db 8,?,8 dup (24h)



.STACK
END Inicio