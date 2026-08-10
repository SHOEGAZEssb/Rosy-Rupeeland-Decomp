; Matching retail form; see src/graphics/main_bg_runtime_control.c.
.text
.global GraphicsMainBackground_SetVisible
GraphicsMainBackground_SetVisible: ; 0x0201cb70
    cmp r1, #0x0
    beq L_0201cc34
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201ccec
L_0201cb84: ; jump table
    b L_0201cb94 ; case 0
    b L_0201cbbc ; case 1
    b L_0201cbe4 ; case 2
    b L_0201cc0c ; case 3
L_0201cb94:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cbbc:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cbe4:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cc0c:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cc34:
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201ccec
L_0201cc40: ; jump table
    b L_0201cc50 ; case 0
    b L_0201cc78 ; case 1
    b L_0201cca0 ; case 2
    b L_0201ccc8 ; case 3
L_0201cc50:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cc78:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201cca0:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201ccec
L_0201ccc8:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_0201ccec:
    mov r0, #0x0
    bx lr
.size GraphicsMainBackground_SetVisible, . - GraphicsMainBackground_SetVisible
