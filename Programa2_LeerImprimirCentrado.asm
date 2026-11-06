.MODEL SMALL; Define el tamano de memoria
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa

mov Ah, 09h
mov Dx, offset Mge1
int 21h

mov Ah,0Ah
mov Dx, offset Nom ;Dx contiene la direccion de la variable NOM
int 21h

mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Ah, 09h
mov Dx, offset Mge2
int 21h

mov Ah,0Ah
mov Dx, offset Eda ;Dx contiene la direccion de la variable Eda
int 21h

mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Ah, 09h
mov Dx, offset Mge3
int 21h

mov Ah,0Ah
mov Dx, offset Sem ;Dx contiene la direccion de la variable Sem
int 21h

mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Ah, 09h
mov Dx, offset Mge4
int 21h
                 
mov Ah,0Ah
mov Dx, offset Car ;Dx contiene la direccion de la variable Car
int 21h

mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Ah, 09h
mov Dx, offset Mge5
int 21h

mov Ah,0Ah
mov Dx, offset NGu ;Dx contiene la direccion de la variable NGu
int 21h

mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Ah, 09h
mov Dx, offset Mge6
int 21h

mov Ah,0Ah
mov Dx, offset SGu ;Dx contiene la direccion de la variable SGu
int 21h

;El proceso para alinear, el comentario es necesario para no perdeme en el codigo
; Nombre
mov Dx, offset Nom ; Dx contiene la direccion de la variable Nom
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna, 80  ; Movemos el valor de Ah a Columna
sub Columna, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 7

mov Dh,Fila
mov Dl,Columna
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset Nom + 2
int 21h

; Edad

mov Dx, offset Eda ; Dx contiene la direccion de la variable Eda
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna1, 80  ; Movemos el valor de Ah a Columna
sub Columna1, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna1  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna1, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 10

mov Dh,Fila
mov Dl,Columna1
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset Eda + 2
int 21h

; Semestre
mov Dx, offset Sem ; Dx contiene la direccion de la variable Sem
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna2, 80  ; Movemos el valor de Ah a Columna
sub Columna2, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna2  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna2, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 13

mov Dh,Fila
mov Dl,Columna2
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset Sem + 2
int 21h

; Carrera

mov Dx, offset Car ; Dx contiene la direccion de la variable Car
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna3, 80  ; Movemos el valor de Ah a Columna
sub Columna3, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna3  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna3, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 16

mov Dh,Fila
mov Dl,Columna3
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset Car + 2
int 21h

; No gusta
mov Dx, offset NGu ; Dx contiene la direccion de la variable NGu
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna4, 80  ; Movemos el valor de Ah a Columna
sub Columna4, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna4  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna4, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 19

mov Dh,Fila
mov Dl,Columna4
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset NGu + 2
int 21h

; Gusta
mov Dx, offset SGu ; Dx contiene la direccion de la variable SGu
mov Si, Dx ; Movemos la direcciom Dx a Si
add Si, 1  ; Ahora aumentamos en 1 en Si

mov Ah, byte ptr [Si] ;Movemos la direccion de Si por bit a Ah
mov Columna5, 80  ; Movemos el valor de Ah a Columna
sub Columna5, Ah

xor Ax, Ax       ; Pone a cero Ax o sea Ax = 0
mov Al, Columna5  ; Pasamos el valor de Columna a Al

mov Bl, 2    ; Bl contiene el resultado de la division o sea la columna
div Bl
mov Columna5, Al ; Columna tiene la columna


mov Ah, 09h
mov Dx, offset Salto
int 21h

mov Fila, 22

mov Dh,Fila
mov Dl,Columna5
mov Bh,0
mov Ah,2
int 10h

mov Ah, 09h
mov Dx, offset SGu + 2
int 21h


mov Ax, 4C00h
int 21h

.DATA
                          
Mge1 db "Cual es tu nombre: $"

Mge2 db "Cual es tu edad: $"

Mge3 db "En que semestre vas: $"

Mge4 db "Que carrera estudias: $"

Mge5 db "Que no te gusta: $"

Mge6 db "Que te gusta: $"

Nom db 20, ?, 20 dup (24h)

Eda db 20,?, 20 dup (24h)

Sem db 20,?, 20 dup (24h)

Car db 20,?, 20 dup (24h)

NGu db 20,?, 20 dup (24h)

SGu db 20,?, 20 dup (24h)   

Salto db 10, 13, 24h

Fila db 2 dup (24h)

Columna db 2 dup (24h)
Columna1 db 2 dup (24h)
Columna2 db 2 dup (24h)
Columna3 db 2 dup (24h)
Columna4 db 2 dup (24h)
Columna5 db 2 dup (24h)
                        

.STACK
END Inicio