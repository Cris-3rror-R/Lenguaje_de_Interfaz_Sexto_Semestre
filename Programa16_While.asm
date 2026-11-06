IMPRIME Macro Mensaje 
    mov Ah, 09h
    mov Dx, offset Mensaje
    int 21h
ENDM

.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa
    
EtiMientras1:
xor Ax, Ax
mov Al, K + 2







; Cx = (Lsuperior - Linferior) + 1
; Inmersion = Lo que hace es iniciar los procesos
;             es decir mandar los valores a Cx
;             recuerda que sino metermo el Cx a la pila
;             se va a hacer un desmadre culero porque se
;             pierde el valor. Tambien se abre la etiqueta del
;             ciclo.

;Finmersion = Cuando llegue a esta etiqueta loopea hasta el 
;             inicio del Inmersion correspodiente entonces
;             tenemos que utilizar nuestro TDA pila.


; En casos de ciclos anidados,
; recuerda antes de hacer todo el show guardar el Cx por si
; acaso estamos trabajando con ciclos anidados 
;
;   Ciclo 1
;   push Cx
;
;
;
;
;




mov Ax, 4C00h
int 21h


.DATA

Salto db 10, 13, 24h
J db 5,?,5 dup (24h)
K db 5,?,5 dup (24h)
.STACK
END Inicio