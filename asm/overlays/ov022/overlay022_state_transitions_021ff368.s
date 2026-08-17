.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_transitions.c. */
.extern TitleDialog_UpdateTextPage
.extern func_ov022_021fd4d4
.extern func_ov022_021fd514
.extern func_ov022_021fd5d4
.extern func_ov022_021fd6dc


    .global func_ov022_021ff368
func_ov022_021ff368:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r3, [r4, #0x2c]
    add r2, sp, #0x18
    mov r1, #0xb
L_021ff380:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021ff380
    ldr r0, [r4, #0x2cc]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x4]
    str r1, [sp, #0x10]
    movne r0, #0x1
    bne L_021ff478
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    mov r0, r1, lsl #0x1e
    beq L_021ff408
    str r1, [sp, #0xc]
    movs r0, r0, asr #0x1f
    beq L_021ff3f8
    ldr r0, [r4, #0x350]
    bl func_ov022_021fd6dc
    cmp r0, #0x0
    beq L_021ff3e8
    ldr r0, [r4, #0x350]
    bl func_ov022_021fd4d4
L_021ff3e8:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x1
    strh r0, [sp, #0x1a]
    b L_021ff428
L_021ff3f8:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x2
    strh r0, [sp, #0x1a]
    b L_021ff428
L_021ff408:
    str r1, [sp, #0x8]
    movs r0, r0, asr #0x1f
    beq L_021ff428
    ldr r0, [r4, #0x350]
    ldr r1, [r0, #0x28]
    cmp r1, #0x2
    bne L_021ff428
    bl func_ov022_021fd514
L_021ff428:
    ldr r0, [r4, #0x2cc]
    add r1, sp, #0x18
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x14]
    movs r0, r1, asr #0x1f
    beq L_021ff458
    ldr r1, [r4, #0x2cc]
    ldr r0, [r4, #0x350]
    ldr r1, [r1, #0xe8]
    bl func_ov022_021fd5d4
L_021ff458:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    moveq r0, #0x0
    beq L_021ff478
    ldr r0, [r4, #0x350]
    bl func_ov022_021fd514
    mov r0, #0x1
L_021ff478:
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.size func_ov022_021ff368, .-func_ov022_021ff368

