.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_runtime.c. */
.extern GraphicsAnimationInstance_SetAnimation
.extern Presentation_UpdateScript
.extern func_ov027_021fd3d8
.extern func_ov027_021fd3f0


    .global func_ov027_021fd258
func_ov027_021fd258:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa8]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_021fd3c8
L_021fd270: ; jump table
    b L_021fd288 ; case 0
    b L_021fd2ac ; case 1
    b L_021fd2e0 ; case 2
    b L_021fd324 ; case 3
    b L_021fd39c ; case 4
    b L_021fd3c8 ; case 5
L_021fd288:
    ldrh r1, [r4, #0x98]
    tst r1, #0x1
    beq L_021fd3c8
    ldr r1, [r4, #0xa4]
    bl func_ov027_021fd3d8
    ldr r0, [r4, #0xa8]
    add r0, r0, #0x1
    str r0, [r4, #0xa8]
    b L_021fd3c8
L_021fd2ac:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    beq L_021fd3c8
    mov r0, #0x1
    str r0, [r4, #0xac]
    mov r0, #0x14
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xa8]
    add r0, r0, #0x1
    str r0, [r4, #0xa8]
    b L_021fd3c8
L_021fd2e0:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    beq L_021fd3c8
    ldr r1, [r4, #0xa0]
    ldr r0, [r4, #0x9c]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x6
    and r1, r1, #0xff
    bl GraphicsAnimationInstance_SetAnimation
    ldr r1, [r4, #0x9c]
    ldrh r0, [r1, #0x50]
    bic r0, r0, #0x2
    strh r0, [r1, #0x50]
    ldr r0, [r4, #0xa8]
    add r0, r0, #0x1
    str r0, [r4, #0xa8]
    b L_021fd3c8
L_021fd324:
    ldr r0, [r4, #0x9c]
    ldrh r0, [r0, #0x50]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021fd3c8
    mov r0, #0x1
    str r0, [r4, #0xac]
    ldr r1, [r4, #0xa0]
    ldr r0, [r4, #0x9c]
    ldr r1, [r1, #0x0]
    add r1, r1, #0xc
    and r1, r1, #0xff
    bl GraphicsAnimationInstance_SetAnimation
    ldr r3, [r4, #0x9c]
    mov r1, #0x1e
    ldrh r2, [r3, #0x50]
    mov r0, #0x0
    orr r2, r2, #0x2
    strh r2, [r3, #0x50]
    ldr r3, [r4, #0x9c]
    ldrh r2, [r3, #0x50]
    bic r2, r2, #0x1
    strh r2, [r3, #0x50]
    ldr r2, [r4, #0xa8]
    add r2, r2, #0x1
    str r2, [r4, #0xa8]
    str r1, [r4, #0x7c]
    str r0, [r4, #0x80]
    b L_021fd3c8
L_021fd39c:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    beq L_021fd3c8
    ldrh r1, [r4, #0x98]
    mov r0, #0x1
    orr r1, r1, #0x2
    strh r1, [r4, #0x98]
    str r0, [r4, #0xac]
    ldr r0, [r4, #0xa8]
    add r0, r0, #0x1
    str r0, [r4, #0xa8]
L_021fd3c8:
    mov r0, r4
    bl Presentation_UpdateScript
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov027_021fd258, .-func_ov027_021fd258

