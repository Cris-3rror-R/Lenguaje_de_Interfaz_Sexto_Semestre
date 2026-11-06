; Alumno: Venegas Venegas Cristopher Axel
; Codigo: 5 datos de mi persona
; Servicios Utilizado.
;   Servicio 01h 02, es un servicio que nos permite localizar le cursor.
;   Servicio 21h, es un servicio que nos permite imprimir texto.

.MODEL SMALL
.CODE       ; Indica el inicio del programa
Inicio:     ; Etiqueta de inicio obligatorio

mov Ax, @Data; Asignamos direccion al segmento  Ax = @Data
mov Ds, Ax;    de datos (Ds)                    Ds = Ax+

; Aqui va el codigo de tu programa

mov Dh, 03
mov Dl, 26
mov Bh, 0
mov Ah, 02
int 10h

mov Ah, 09h
mov Dx, offset mge   
int 21h

mov Dh, 06
mov Dl, 14
mov Bh, 0
mov Ah, 02
int 10h

mov Ah, 09h
mov Dx, offset mge1   
int 21h
          
mov Dh, 09
mov Dl, 24
mov Bh, 0
mov Ah, 02
int 10h
          
mov Ah, 09h
mov Dx, offset mge2   
int 21h

mov Dh, 12
mov Dl, 17
mov Bh, 0
mov Ah, 02
int 10h

mov Ah, 09h
mov Dx, offset mge3   
int 21h
     
mov Dh, 15
mov Dl, 13
mov Bh, 0
mov Ah, 02
int 10h     
     
mov Ah, 09h
mov Dx, offset mge4   
int 21h

mov Dh, 18
mov Dl, 21
mov Bh, 0
mov Ah, 02
int 10h

mov Ah, 09h
mov Dx, offset mge5   
int 21h

mov Dh, 21
mov Dl, 24
mov Bh, 0
mov Ah, 02
int 10h

mov Ah, 09h
mov Dx, offset mge6   
int 21h
        
   
mov Ax, 4C00h
int 21h

.DATA

; Declaracion de vatiables 
mge db "Hola, me presento soy Cris",24h
mge1 db "Mi nombre completo es Cristopher Axel Venegas Venegas",36
mge2 db "Actualmente tengo 21 years",36
mge3 db "Estoy en mi sexto semestre del Tecnm ITO",24h
mge4 db "No soy bueno hablando en publico, los nervios me ganan",24h
mge5 db "Me gusta lo que estoy estudiando",24h
mge6 db "Creo que seria todo, gracias.",24h


.STACK
END Inicio