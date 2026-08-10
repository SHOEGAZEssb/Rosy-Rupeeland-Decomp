; Matching retail form; see src/graphics/sub_bg_text_control.c.
.text
.extern OS_Halt
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Destroy
.extern GraphicsSubBackground_WriteBg0Control
.extern GraphicsSubBackground_WriteBg1Control
.extern GraphicsSubBackground_WriteBg2Control
.extern GraphicsSubBackground_WriteBg3Control
.global GraphicsSubBackground_Configure16ColorText
GraphicsSubBackground_Configure16ColorText: ; 0x0201c3f8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    mov r4, r2
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_0201c440
L_0201c414: ; jump table
    b L_0201c424 ; case 0
    b L_0201c42c ; case 1
    b L_0201c434 ; case 2
    b L_0201c43c ; case 3
L_0201c424:
    mov r5, #0x0
    b L_0201c440
L_0201c42c:
    mov r5, #0x1
    b L_0201c440
L_0201c434:
    mov r5, #0x2
    b L_0201c440
L_0201c43c:
    mov r5, #0x3
L_0201c440:
    cmp r3, #0x7
    addls pc, pc, r3, lsl #0x2
    b L_0201c4ac
L_0201c44c: ; jump table
    b L_0201c46c ; case 0
    b L_0201c474 ; case 1
    b L_0201c47c ; case 2
    b L_0201c484 ; case 3
    b L_0201c48c ; case 4
    b L_0201c494 ; case 5
    b L_0201c49c ; case 6
    b L_0201c4a4 ; case 7
L_0201c46c:
    mov r6, #0x0
    b L_0201c4b0
L_0201c474:
    mov r6, #0x1
    b L_0201c4b0
L_0201c47c:
    mov r6, #0x2
    b L_0201c4b0
L_0201c484:
    mov r6, #0x3
    b L_0201c4b0
L_0201c48c:
    mov r6, #0x4
    b L_0201c4b0
L_0201c494:
    mov r6, #0x5
    b L_0201c4b0
L_0201c49c:
    mov r6, #0x6
    b L_0201c4b0
L_0201c4a4:
    mov r6, #0x7
    b L_0201c4b0
L_0201c4ac:
    bl OS_Halt
L_0201c4b0:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b L_0201c588
L_0201c4c4: ; jump table
    b L_0201c4d4 ; case 0
    b L_0201c504 ; case 1
    b L_0201c534 ; case 2
    b L_0201c560 ; case 3
L_0201c4d4:
    mov r1, #0x0
    mov r0, r5
    mov r3, r6
    mov r2, #0x18
    str r1, [sp, #0x0]
    bl GraphicsSubBackground_WriteBg0Control
    ldr r1, L_0201c59c
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c588
L_0201c504:
    mov r1, #0x0
    mov r0, r5
    mov r3, r6
    mov r2, #0x1a
    str r1, [sp, #0x0]
    bl GraphicsSubBackground_WriteBg1Control
    ldr r1, L_0201c5a0
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c588
L_0201c534:
    mov r0, r5
    mov r3, r6
    mov r1, #0x0
    mov r2, #0x1c
    bl GraphicsSubBackground_WriteBg2Control
    ldr r1, L_0201c5a4
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
    b L_0201c588
L_0201c560:
    mov r0, r5
    mov r3, r6
    mov r1, #0x0
    mov r2, #0x1e
    bl GraphicsSubBackground_WriteBg3Control
    ldr r1, L_0201c5a8
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r4
    strh r0, [r1, #0x0]
L_0201c588:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201c59c: .word 0x4001008
L_0201c5a0: .word 0x400100a
L_0201c5a4: .word 0x400100c
L_0201c5a8: .word 0x400100e
.size GraphicsSubBackground_Configure16ColorText, . - GraphicsSubBackground_Configure16ColorText
