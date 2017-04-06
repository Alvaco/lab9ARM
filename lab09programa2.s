.text
.align 2
.global main
.type main,%function

main:
        stmfd sp!, {lr}
        mov r10,#0b10000	 @agregar a un char para pasarlo a mayus
	mov r9, #0 		@contador para 10 caracteres
						@en r8 está el string
						@r7 es contador de 1 a 10
        ldr r0,=msj	 	@poner mensaje de bienvenida
        bl puts 		@imprimir msj bienvenida
        ldr r0,=cadena
        bl scanf		@input mensaje de bienvenida
	ldr r1,=cadena		@cadena en r1
	str r8,[r1]		@valor de cadena a r8
	mov r7, #0		@contador a 0

tomayus:
        add r8, r8, r9 		@string incrementado en contador 
        ldr r6,[r8]	  	@cargar string en r6
	sub r6, r10		@pasar a minuscula		
        add r9,r9,#4		@incrementar contador en 1
	cmp r9, #40		@comparar r9 con 40
	bne tomayus		@si no es igual, ir a tomayus

imprimir:
	ldr r1,[r7]		 @cargar a r1 r7
        ldr r0,=cadena		 @r0 valor de cadena
        bl printf		 @imprimir string

salir:
        mov r3, #0
        mov r0, r3
        ldmfd sp!, {lr}
        bx lr




.data
.align 2
msj: .asciz "Por favor ingrese su nombre (max. 10 caracteres) y sin espacios :/n"
cadena: .asciz "          "

