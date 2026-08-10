; Matching retail form; see src/graphics/sub_bg_runtime_control.c.
.text
.global GraphicsSubBackground_SetVisible
GraphicsSubBackground_SetVisible: ; 0x0201c610
    cmp r1, #0x0
    beq L_0201c6d4
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201c78c
L_0201c624: ; jump table
    b L_0201c634 ; case 0
    b L_0201c65c ; case 1
    b L_0201c684 ; case 2
    b L_0201c6ac ; case 3
L_0201c634:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c65c:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c684:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c6ac:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c6d4:
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201c78c
L_0201c6e0: ; jump table
    b L_0201c6f0 ; case 0
    b L_0201c718 ; case 1
    b L_0201c740 ; case 2
    b L_0201c768 ; case 3
L_0201c6f0:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c718:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c740:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b L_0201c78c
L_0201c768:
    ldr r2, L_0201c794
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_0201c78c:
    mov r0, #0x0
    bx lr
L_0201c794: .word 0x4001000
.size GraphicsSubBackground_SetVisible, . - GraphicsSubBackground_SetVisible
