; Matching retail form; see src/graphics/sub_bg_control.c.
.text
.extern GXS_SetGraphicsMode
.extern OS_Halt
.extern GraphicsSubBackground_WriteBg0Control
.extern GraphicsSubBackground_WriteBg1Control
.extern GraphicsSubBackground_WriteBg2Control
.extern GraphicsSubBackground_WriteBg3Control
.global GraphicsSubBackground_Configure256ColorText
GraphicsSubBackground_Configure256ColorText: ; 0x0201c174
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r4, r2
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_0201c1b8
L_0201c18c: ; jump table
    b L_0201c19c ; case 0
    b L_0201c1a4 ; case 1
    b L_0201c1ac ; case 2
    b L_0201c1b4 ; case 3
L_0201c19c:
    mov r5, #0x0
    b L_0201c1b8
L_0201c1a4:
    mov r5, #0x1
    b L_0201c1b8
L_0201c1ac:
    mov r5, #0x2
    b L_0201c1b8
L_0201c1b4:
    mov r5, #0x3
L_0201c1b8:
    cmp r3, #0x7
    addls pc, pc, r3, lsl #0x2
    b L_0201c224
L_0201c1c4: ; jump table
    b L_0201c1e4 ; case 0
    b L_0201c1ec ; case 1
    b L_0201c1f4 ; case 2
    b L_0201c1fc ; case 3
    b L_0201c204 ; case 4
    b L_0201c20c ; case 5
    b L_0201c214 ; case 6
    b L_0201c21c ; case 7
L_0201c1e4:
    mov r6, #0x0
    b L_0201c228
L_0201c1ec:
    mov r6, #0x1
    b L_0201c228
L_0201c1f4:
    mov r6, #0x2
    b L_0201c228
L_0201c1fc:
    mov r6, #0x3
    b L_0201c228
L_0201c204:
    mov r6, #0x4
    b L_0201c228
L_0201c20c:
    mov r6, #0x5
    b L_0201c228
L_0201c214:
    mov r6, #0x6
    b L_0201c228
L_0201c21c:
    mov r6, #0x7
    b L_0201c228
L_0201c224:
    bl OS_Halt
L_0201c228:
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b L_0201c320
L_0201c234: ; jump table
    b L_0201c244 ; case 0
    b L_0201c280 ; case 1
    b L_0201c2bc ; case 2
    b L_0201c2f0 ; case 3
L_0201c244:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov ip, #0x0
    mov r0, r5
    mov r3, r6
    mov r1, #0x1
    mov r2, #0x1c
    str ip, [sp, #0x0]
    bl GraphicsSubBackground_WriteBg0Control
    ldr r1, L_0201c328
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c320
L_0201c280:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov ip, #0x0
    mov r0, r5
    mov r3, r6
    mov r1, #0x1
    mov r2, #0x1e
    str ip, [sp, #0x0]
    bl GraphicsSubBackground_WriteBg1Control
    ldr r1, L_0201c32c
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c320
L_0201c2bc:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov r0, r5
    mov r3, r6
    mov r1, #0x1
    mov r2, #0x1e
    bl GraphicsSubBackground_WriteBg2Control
    ldr r1, L_0201c330
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c320
L_0201c2f0:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    mov r0, r5
    mov r3, r6
    mov r1, #0x1
    mov r2, #0x1e
    bl GraphicsSubBackground_WriteBg3Control
    ldr r1, L_0201c334
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
L_0201c320:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201c328: .word 0x4001008
L_0201c32c: .word 0x400100a
L_0201c330: .word 0x400100c
L_0201c334: .word 0x400100e
.size GraphicsSubBackground_Configure256ColorText, . - GraphicsSubBackground_Configure256ColorText
