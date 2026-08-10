.text

/* Exact fallback; see src/overlays/ov028/overlay028_selection_runtime.c. */
.extern data_ov028_021ff208
.extern data_ov028_021ff238
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020948e4
.extern func_02094bbc
.extern func_020954e0
.extern func_020954f4
.extern func_020ae024
.extern func_ov028_021fdf94


    .global func_ov028_021fe558
func_ov028_021fe558:
    stmdb sp!, {r4, lr}
    mov r2, #0xc
    mul r2, r1, r2
    mov r4, r0
    ldr r0, [r4, #0x220]
    ldr r0, [r0, #0x38]
    ldr r2, [r0, r2]
    cmp r2, #0x0
    beq L_021fe66c
    ldrh r0, [r2, #0x12]
    sub r0, r0, #0x100
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x274]
    ldrh r1, [r2, #0x14]
    ldrsh r0, [r2, #0x16]
    sub r1, r1, #0xc0
    sub r0, r1, r0
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x278]
    ldr r0, [r4, #0x260]
    bl func_020954e0
    ldr r0, [r4, #0x260]
    ldr r2, [r4, #0x274]
    add r0, r0, #0xc
    mov r1, #0x2
    bl func_020948e4
    ldr r0, [r4, #0x260]
    ldr r2, [r4, #0x278]
    add r0, r0, #0x1c
    mov r1, #0x2
    bl func_020948e4
    ldr r1, [r4, #0x260]
    mov r0, #0x8
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, L_021fe6b4
    ldr r3, [r4, #0x274]
    ldr r2, [r0, #0x30]
    ldr r1, [r4, #0x278]
    ldr r0, [r0, #0x34]
    sub r3, r3, r2
    sub r2, r1, r0
    mov r0, r3, asr #0xb
    mov r1, r2, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r1, r2, r1, lsr #0x14
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_020ae024
    sub r1, r0, #0x1000
    mov r0, r1, asr #0xc
    add r0, r1, r0, lsr #0x13
    mov r1, r0, asr #0xd
    ldr r0, [r4, #0x90]
    cmp r1, #0x1
    movlt r1, #0x1
    cmp r1, #0x5
    movgt r1, #0x5
    rsb r1, r1, #0xf
    ldrb r2, [r0, #0x38]
    and r1, r1, #0xff
    cmp r1, r2
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r4, pc}
L_021fe66c:
    ldr r1, L_021fe6b8
    add r0, r4, #0x274
    bl func_ov028_021fdf94
    ldr r0, [r4, #0x260]
    bl func_020954f4
    ldr r0, [r4, #0x260]
    ldr r1, [r4, #0x274]
    ldr r2, [r4, #0x278]
    mov r3, #0x0
    bl func_02094bbc
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    ldrneb r1, [r0, #0x38]
    cmpne r1, #0xc
    ldmeqia sp!, {r4, pc}
    mov r1, #0xc
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r4, pc}
L_021fe6b4: .word data_ov028_021ff208
L_021fe6b8: .word data_ov028_021ff238
.size func_ov028_021fe558, .-func_ov028_021fe558
