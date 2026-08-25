.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_transitions.c. */
.extern data_ov024_021fe1e4
.extern AreaInfoPanelPresentation_ShowIndex
.extern Presentation_InterpolateSmoothStep
.extern func_02091b98
.extern func_ov002_021fbd64
.extern Overlay005_SetSceneSelection
.extern func_ov046_0220bffc
.extern func_ov046_0220c3bc
.extern func_ov046_0220c410
.extern func_ov046_0220c46c


    .global func_ov024_021fdac4
func_ov024_021fdac4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, [r7, #0x2ec]
    cmp r0, #0x0
    beq L_021fdc48
    ldr r0, [r7, #0x2f0]
    add r0, r0, #0x1
    str r0, [r7, #0x2f0]
    ldr r6, [r7, #0x290]
    ldr r0, [r7, #0x2c0]
    mov r1, r6
    ldr r5, [r7, #0x2f4]
    bl func_ov046_0220c3bc
    mov r9, r0
    ldr r0, [r7, #0x2c0]
    mov r1, r6
    bl func_ov046_0220c410
    mov r4, r0
    ldr r0, [r7, #0x2c0]
    mov r1, r5
    bl func_ov046_0220c3bc
    mov r8, r0
    ldr r0, [r7, #0x2c0]
    mov r1, r5
    bl func_ov046_0220c410
    mov r1, r8, lsl #0x8
    mov r8, r0
    ldr r2, [r7, #0x2ec]
    ldr r3, [r7, #0x2f0]
    mov r0, r9, lsl #0x8
    bl Presentation_InterpolateSmoothStep
    mov r2, r0, asr #0x7
    add r0, r0, r2, lsr #0x18
    mov r1, r8, lsl #0x8
    mov r8, r0, asr #0x8
    ldr r2, [r7, #0x2ec]
    ldr r3, [r7, #0x2f0]
    mov r0, r4, lsl #0x8
    bl Presentation_InterpolateSmoothStep
    mov r2, r0, asr #0x7
    add r0, r0, r2, lsr #0x18
    mov r2, r0, asr #0x8
    ldr r0, [r7, #0x2c0]
    mov r1, r8
    bl func_ov046_0220c46c
    ldr r1, L_021fdc50
    ldr r2, [r7, #0x2ec]
    ldr r0, [r1, r6, lsl #0x2]
    ldr r1, [r1, r5, lsl #0x2]
    ldr r3, [r7, #0x2f0]
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x8
    bl Presentation_InterpolateSmoothStep
    mov r1, r0, asr #0x7
    add r0, r0, r1, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r7, #0x2e8]
    rsb r2, r0, #0x0
    ldr r0, [r7, #0x2bc]
    mov r1, #0x0
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    ldr r0, [r7, #0x48]
    orr r0, r0, #0x7
    str r0, [r7, #0x48]
    ldr r0, [r7, #0x2e8]
    cmp r0, #0xc0
    ldr r0, [r7, #0x48]
    biclt r0, r0, #0x4
    bicge r0, r0, #0x1
    str r0, [r7, #0x48]
    ldr r0, [r7, #0x2ec]
    ldr r1, [r7, #0x2f0]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fdc30
    ldr r0, [r7, #0x2c4]
    mov r1, r5
    bl AreaInfoPanelPresentation_ShowIndex
    mov r2, #0x0
    ldr r0, [r7, #0x2c0]
    mov r1, r5
    mov r3, r2
    bl func_ov046_0220bffc
    ldr r0, [r7, #0x2bc]
    mov r1, r5
    bl Overlay005_SetSceneSelection
    add r0, r7, #0x2c8
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r7, #0x2e4]
L_021fdc30:
    ldr r1, [r7, #0x2f0]
    ldr r0, [r7, #0x2ec]
    cmp r1, r0
    mov r0, #0x0
    streq r0, [r7, #0x2ec]
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fdc48:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fdc50: .word data_ov024_021fe1e4
.size func_ov024_021fdac4, .-func_ov024_021fdac4

