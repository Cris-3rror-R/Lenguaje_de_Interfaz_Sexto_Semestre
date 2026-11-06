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
    
    mov Num2, Al
    mov Dx, offset Salto
    Call Imprimir

    
;Suma
    mov Dx, offset MsgSuma
    call Imprimir

    mov Si, offset Num1
    call ConvertirDecimal   
    push Ax                

    mov Si, offset Num2
    call ConvertirDecimal  
    mov Bl, Al             
    
    pop Ax                 
    
    
    mov Ah, Bl             
    call Suma             
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir

;Resta
    mov Dx, offset MsgResta
    call Imprimir

    mov Si, offset Num1
    call ConvertirDecimal
    push Ax

    mov Si, offset Num2
    call ConvertirDecimal
    mov Bl, Al             
    
    pop Ax                 
    
    mov Ah, Bl             
    call Resta              
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir
   
;Multiplicacion
    mov Dx, offset MsgMulti
    call Imprimir
    
    mov Si, offset Num1
    call ConvertirDecimal
    
    push Ax
    
    mov Si, offset Num2
    call ConvertirDecimal
    
    mov Bl, Al              
    pop Ax                 
    call Multi            
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir
   
;Dividir
    mov Dx, offset MsgDivi
    call Imprimir
    
    mov Si, offset Num1
    call ConvertirDecimal
    
    push Ax
    
    mov Si, offset Num2
    call ConvertirDecimal
    
    mov Bl, Al       
    pop Ax
                     
    call Dividir     
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir
    
;Residuo
    mov Dx, offset MsgResi
    call Imprimir
    
    mov Al, AuxResi 
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir
    
;Potencia 
    mov Dx, offset MsgPote
    call Imprimir
    
    mov Si, offset Num1
    call ConvertirDecimal
    
    push Ax
    
    mov Si, offset Num2
    call ConvertirDecimal
    
    mov Cl, Al             
    pop Ax
                    
    call Potencia          
    call ConvertirAscii
    
    mov Dx, offset Salto
    Call Imprimir


mov Ax, 4C00h
int 21h



; Procedimiento Leer                                                       
Leer Proc
    mov Ah,0Ah
    int 21h
    ret
Leer EndP

; Procedimiento Imprimir
Imprimir Proc
    mov Ah, 09h
    int 21h
    ret
Imprimir EndP

; Procedimiento Suma
Suma Proc
    add Al, Ah
    mov Ah, 00h   
    ret
Suma EndP

; Procedimiento Resta
Resta Proc
    sub Al, Ah
    mov Ah, 00h
    ret
Resta EndP

; Procedimiento Multi
Multi Proc
    mul Bl
    ret
Multi EndP

; Procedimiento Dividir
Dividir Proc
    xor Ah, Ah
    div Bl
    mov AuxResi, Ah
    ret
Dividir EndP

; Procedimiento Potencia
Potencia Proc
    cmp Cl, 0
    jne Poten1
    mov Ax, 1
    jmp FinPoten

Poten1:
    cmp Cl, 1
    jne Poten10
    jmp FinPoten

Poten10:
    mov Bl, Al
    dec Cl
CicloPoten:
    mul Bl
    loop CicloPoten

FinPoten:
    ret
Potencia EndP

; Procedimiento Convertir de Decimal a Ascii
ConvertirDecimal Proc
    xor Cx, Cx
    mov Cl, [Si+1]         
    mov AuxConver+2, 0   
    mov AuxExpo+2, 0
    add Si, 2             
    add Si, Cx             
    dec Si               
ConvDec:
    push Cx
    mov Cl, AuxExpo+2
    call PoBase10          
    xor Ax, Ax
    mov Al, [Si]           
    sub Al, 30h           
    mul Bl                
    add AuxConver+2, Al 
    inc AuxExpo+2
    dec Si
    pop Cx
    loop ConvDec
    mov Al, AuxConver+2 
    ret
ConvertirDecimal EndP


; Procedimiento Convertir de Ascii a Decimal
ConvertirAscii Proc
    mov AuxConver+2, Al   
    mov AuxExpo+2, 2     
    mov Cx, 3
    mov Di, offset Resultado+2  
ConvAsc:
    push Cx
    mov Cl, AuxExpo+2
    call PoBase10         
    xor Ax, Ax
    mov Al, AuxConver+2
    div Bl                
    add Al, 30h           
    mov [Di], Al          
    inc Di
    mov AuxConver+2, Ah    
    dec AuxExpo+2
    pop Cx
    loop ConvAsc
    mov byte ptr [Di], "$" 
    mov Dx, offset Resultado+2
    call Imprimir  
    ret
ConvertirAscii EndP

; Procedimiento Potencia a Base 10
PoBase10 Proc
    cmp Cl, 0
    jne Calc10
    mov Bl, 1
    ret
Calc10:
    mov Al, 10
    mov Bl, 10
    cmp Cl, 1
    je Fin10
    dec Cl
Ciclo10:
    mul Bl
    loop Ciclo10
Fin10:
    mov Bl, Al
    ret
PoBase10 EndP


.DATA

Salto db 10, 13, 24h

Msg1 db "Ingrese el primer numero: $"
Msg2 db "Ingrese el segundo numero: $"
MsgSuma db "La suma es: $"
MsgResta db "La resta es: $"
MsgMulti db "La multi es: $"
MsgDivi db "La dividir es: $"
MsgResi db "La residuo es: $"
MsgPote db "La potencia es: $"

Num1 db 5,?,5 dup (24h)
Num2 db 5,?,5 dup (24h)

Resultado db 5,?,5 dup (24h) 

AuxConver db 5,?,5 dup (24h)
AuxResi db 5,?,5 dup (24h)
AuxExpo db 5,?,5 dup (24h) 

.STACK
END Inicio