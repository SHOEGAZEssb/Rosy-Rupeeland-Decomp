; Matching retail form; see src/graphics/main_bg_runtime_control.c.
.text
.global func_0201cabc
func_0201cabc: ; 0x0201cabc
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201cb54
L_0201cac8: ; jump table
    b L_0201cad8 ; case 0
    b L_0201caf8 ; case 1
    b L_0201cb18 ; case 2
    b L_0201cb38 ; case 3
L_0201cad8:
    ldr r0, L_0201cb5c
    ldr ip, L_0201cb60
    mov r3, r0, lsl #0x10
    and r1, r1, r0
    and r0, r3, r2, lsl #0x10
    orr r0, r1, r0
    str r0, [ip, #0x0]
    b L_0201cb54
L_0201caf8:
    ldr r0, L_0201cb5c
    ldr ip, L_0201cb64
    mov r3, r0, lsl #0x10
    and r1, r1, r0
    and r0, r3, r2, lsl #0x10
    orr r0, r1, r0
    str r0, [ip, #0x0]
    b L_0201cb54
L_0201cb18:
    ldr r0, L_0201cb5c
    ldr ip, L_0201cb68
    mov r3, r0, lsl #0x10
    and r1, r1, r0
    and r0, r3, r2, lsl #0x10
    orr r0, r1, r0
    str r0, [ip, #0x0]
    b L_0201cb54
L_0201cb38:
    ldr r0, L_0201cb5c
    ldr ip, L_0201cb6c
    mov r3, r0, lsl #0x10
    and r1, r1, r0
    and r0, r3, r2, lsl #0x10
    orr r0, r1, r0
    str r0, [ip, #0x0]
L_0201cb54:
    mov r0, #0x0
    bx lr
L_0201cb5c: .word 0x1ff
L_0201cb60: .word 0x4000010
L_0201cb64: .word 0x4000014
L_0201cb68: .word 0x4000018
L_0201cb6c: .word 0x400001c
.size func_0201cabc, . - func_0201cabc
