.text
/* Exact fallback; see overlay038_selection_accessors.c for portable C. */
    .extern func_ov038_021fd508
    .extern func_ov038_021fd40c
    .extern func_ov046_0220c3bc
    .extern func_ov046_0220c410
    .extern func_ov046_0220c46c
    .extern func_ov038_021fd540
    .extern func_ov046_0220bffc
    .extern AreaInfoPanelPresentation_ShowIndex
    .extern func_ov038_021fd624
    .global func_ov038_021fd578
func_ov038_021fd578:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_ov038_021fd508
    ldr r2, [r5, #0x314]
    mov r4, r0
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd5c4
    mov r0, r5
    bl func_ov038_021fd40c
L_021fd5c4:
    ldr r0, [r5, #0x340]
    mov r1, r4
    bl func_ov046_0220c3bc
    mov r6, r0
    ldr r0, [r5, #0x340]
    mov r1, r4
    bl func_ov046_0220c410
    mov r2, r0
    ldr r0, [r5, #0x340]
    mov r1, r6
    bl func_ov046_0220c46c
    mov r0, r5
    bl func_ov038_021fd540
    mov r3, r0
    ldr r0, [r5, #0x340]
    mov r1, r4
    mov r2, #0x1
    bl func_ov046_0220bffc
    mov r1, r4
    ldr r0, [r5, #0x344]
    bl AreaInfoPanelPresentation_ShowIndex
    mov r0, r5
    bl func_ov038_021fd624
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov038_021fd578, .-func_ov038_021fd578
