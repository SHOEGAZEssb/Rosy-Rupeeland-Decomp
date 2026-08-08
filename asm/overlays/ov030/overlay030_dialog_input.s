.text

/* Exact fallback; see src/overlays/ov030/overlay030_dialog_runtime.c for documented portable C. */
.extern func_02093360
.extern func_ov045_0220c028
.extern func_ov045_0220c128
.extern func_ov045_0220c174
.extern func_ov045_0220c280


    .global func_ov030_021fea00
func_ov030_021fea00:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r3, [r4, #0x2c]
    add r2, sp, #0x18
    mov r1, #0xb
L_021fea18:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fea18
    ldr r0, [r4, #0x2bc]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x4]
    str r1, [sp, #0x10]
    movne r0, #0x1
    bne L_021feb04
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    mov r0, r1, lsl #0x1e
    beq L_021feaa0
    str r1, [sp, #0xc]
    movs r0, r0, asr #0x1f
    beq L_021fea90
    ldr r0, [r4, #0x2c0]
    bl func_ov045_0220c280
    cmp r0, #0x0
    beq L_021fea80
    ldr r0, [r4, #0x2c0]
    bl func_ov045_0220c028
L_021fea80:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x1
    strh r0, [sp, #0x1a]
    b L_021feab4
L_021fea90:
    ldrh r0, [sp, #0x1a]
    orr r0, r0, #0x2
    strh r0, [sp, #0x1a]
    b L_021feab4
L_021feaa0:
    str r1, [sp, #0x8]
    movs r0, r0, asr #0x1f
    beq L_021feab4
    ldr r0, [r4, #0x2c0]
    bl func_ov045_0220c174
L_021feab4:
    ldr r0, [r4, #0x2bc]
    add r1, sp, #0x18
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x14]
    movs r0, r1, asr #0x1f
    beq L_021feae4
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x2c0]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
L_021feae4:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    moveq r0, #0x0
    beq L_021feb04
    ldr r0, [r4, #0x2c0]
    bl func_ov045_0220c174
    mov r0, #0x1
L_021feb04:
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.size func_ov030_021fea00, .-func_ov030_021fea00
