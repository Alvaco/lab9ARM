.text
.align 2
.global main
.type main,%function

main:
        stmfd sp!, {lr}
        mov r10,#10
        mov r9,#0

        ldr r8,=arreglo
ciclo1:
        add r8, r8, r9
        ldr r0,=formatoI
        bl puts
        mov r1,r8
        ldr r0,=formatoD
        bl scanf

        add r9,r9,#4


        @ldr r0,=formatoD
        @ldr r1,[r8]
        @bl printf
        subs r10,r10,#1
        bne ciclo1

        ldr r0,=formatoOrd
        bl puts
        mov r10,#0
        ldr r8,=arreglo
        ldr r7,=arregloR
        add r7,r7,#40


ciclo2:
        add r8,r8,r10
        sub r7,r7,r10
        ldr r6,[r8]
        str r6,[r7]
        ldr r0,=formatoE
        mov r1,r6
        bl printf
        add r10,r10,#4
        cmp r10,#40
        bne ciclo2

        @ldr r0,=formatoInv
        @bl puts
        mov r10,#0
        ldr r7, =arregloR

ciclo3:
        ldr r1,[r7]
        ldr r0,=formatoE
        bl printf
        add r7,r7,r10
        adds r10,r10,#4
        cmp r10,#40
        bne ciclo3


salir:
        mov r3, #0
        mov r0, r3
        ldmfd sp!, {lr}
        bx lr




.data
.align 2
arreglo: .word 0,0,0,0,0,0,0,0,0,0
arregloR: .word 0,0,0,0,0,0,0,0,0,0
formatoI: .asciz "\nIngrese un numero: \n"
formatoD: .asciz "%d"
formatoE: .asciz "%d\n"
formatoBlank: .asciz "\n"
formatoOrd: .asciz "\nOriginal: \n"
formatoInv: .asciz "\nInvertido: \n"

