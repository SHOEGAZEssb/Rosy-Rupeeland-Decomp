.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern TitleDialog_UpdateTextPage
.extern TitleDialog_ClearTextRect
.extern func_ov045_0220c028
.extern func_ov045_0220c068
.extern func_ov045_0220c128
.extern func_ov045_0220c174


    .global func_ov023_021fe88c
func_ov023_021fe88c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    mov r4, r0
    ldr r3, [r4, #0x2c]
    add r2, sp, #0x1c
    mov r1, #0xb
L_021fe8a4:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fe8a4
    ldr r0, [r4, #0x4b8]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x4]
    str r1, [sp, #0x18]
    movne r0, #0x1
    bne L_021fe98c
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    mov r0, r1, lsl #0x1e
    beq L_021fe918
    movs r0, r0, asr #0x1f
    ldreqh r0, [sp, #0x1e]
    str r1, [sp, #0x14]
    orreq r0, r0, #0x2
    streqh r0, [sp, #0x1e]
    beq L_021fe92c
    ldr r0, [r4, #0x4bc]
    bl func_ov045_0220c028
    ldrh r0, [sp, #0x1e]
    orr r0, r0, #0x1
    strh r0, [sp, #0x1e]
    b L_021fe92c
L_021fe918:
    str r1, [sp, #0x10]
    movs r0, r0, asr #0x1f
    beq L_021fe92c
    ldr r0, [r4, #0x4bc]
    bl func_ov045_0220c174
L_021fe92c:
    ldr r0, [r4, #0x4b8]
    add r1, sp, #0x1c
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0xc]
    movs r0, r1, asr #0x1f
    beq L_021fe964
    ldr r0, [r4, #0x4bc]
    bl func_ov045_0220c068
    ldr r0, [r4, #0x4b8]
    bl TitleDialog_ClearTextRect
    mov r0, #0x1
    b L_021fe98c
L_021fe964:
    ldr r2, [r4, #0x4b8]
    ldr r1, [r2, #0x38]
    mov r0, r1, lsl #0x16
    str r1, [sp, #0x8]
    movs r0, r0, asr #0x1f
    beq L_021fe988
    ldr r0, [r4, #0x4bc]
    ldr r1, [r2, #0xe8]
    bl func_ov045_0220c128
L_021fe988:
    mov r0, #0x0
L_021fe98c:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.size func_ov023_021fe88c, .-func_ov023_021fe88c

