    .text
/* Exact fallback; see src/overlays/ov017/overlay017_ui_sprite_group.c. */
    .extern Sound_Play
    .extern data_ov017_022016e0
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_020740a4
    .extern func_02091a70
    .extern gSoundContext
.global func_ov017_021fe894
func_ov017_021fe894:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r1, L_021fe9b4
    mov r10, r0
    ldr r2, [r1, #0x8]
    ldr r3, [r1, #0x0]
    cmp r3, r2
    blt L_021fe8c0
    ldr r0, [r10, #0x1c]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fe8dc
L_021fe8c0:
    mov r0, #0x0
    mov r1, #0x10
    bl func_02091a70
    mov r1, r0
    ldr r0, [r10, #0x1c]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fe8dc:
    ldr r0, L_021fe9b4
    mov r7, #0x0
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    bne L_021fe920
    mov r4, #0x4
L_021fe8f4:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x20]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x4
    beq L_021fe910
    mov r1, r4
    bl GraphicsSpriteState_SetAnimationIndex
L_021fe910:
    add r7, r7, #0x1
    cmp r7, #0xf
    blt L_021fe8f4
    b L_021fe9a8
L_021fe920:
    ldr r2, [r10, #0x60]
    ldr r3, [r10, #0x64]
    mov r0, r7
    mov r1, #0xf
    bl func_02091a70
    mov r8, r0
    mov r9, r7
    mov r6, #0x1
    mov r5, #0x2
    ldr r4, L_021fe9b8
    b L_021fe9a0
L_021fe94c:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x20]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x2
    beq L_021fe99c
    cmp r7, #0x0
    bne L_021fe98c
    add r0, r9, #0x5
    add r0, r0, #0x4100
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r4, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    mov r7, r6
    bl Sound_Play
L_021fe98c:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x20]
    mov r1, r5
    bl GraphicsSpriteState_SetAnimationIndex
L_021fe99c:
    add r9, r9, #0x1
L_021fe9a0:
    cmp r9, r8
    blt L_021fe94c
L_021fe9a8:
    ldr r0, [r10, #0x0]
    bl func_020740a4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fe9b4: .word data_ov017_022016e0
L_021fe9b8: .word gSoundContext
    .size func_ov017_021fe894, . - func_ov017_021fe894
