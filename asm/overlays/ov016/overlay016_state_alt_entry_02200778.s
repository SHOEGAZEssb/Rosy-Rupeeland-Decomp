    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_alt_entry.c. */
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern data_020f4e14
    .extern data_ov016_022014a0
    .extern data_ov016_022014a8
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern ModalState_UpdateInput
    .extern func_ov000_021fc9d4
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021ff7bc
    .extern func_ov016_021ff908
    .extern func_ov016_021ff9b8
    .extern func_ov016_021ffc2c
    .extern gDebugFont
    .extern gGameWork
.global func_ov016_02200778
func_ov016_02200778:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02200798
    cmp r0, #0x1
    beq L_022008a0
    b L_022008d8
L_02200798:
    ldr r1, [r4, #0x4c]
    ldr r0, L_022008e8
    orr r1, r1, #0x2
    bic r1, r1, #0x4
    str r1, [r4, #0x4c]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_022008ec
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl func_ov016_021ffc2c
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc9d4
    ldr r0, [r4, #0x46c]
    cmp r0, #0x0
    beq L_02200844
    ldr r0, L_022008f0
    ldr r1, L_022008f4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02200830
    ldr r0, L_022008f0
    ldr r1, L_022008f4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov016_021ff908
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022008d8
L_02200830:
    ldr r1, L_022008f8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_022008d8
L_02200844:
    ldr r0, L_022008f0
    mov r1, #0x3a8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02200874
    mov r2, #0x0
    mov r0, r4
    mov r3, r2
    mov r1, #0x1b
    bl func_ov016_021ff908
    b L_02200888
L_02200874:
    mov r0, r4
    mov r1, #0x1a
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov016_021ff908
L_02200888:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022008d8
L_022008a0:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x460]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_022008d8
    mov r0, r4
    bl func_ov016_021ff9b8
    ldr r1, L_022008fc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_022008d8:
    mov r0, r4
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022008e8: .word data_020f4e14
L_022008ec: .word gDebugFont
L_022008f0: .word gGameWork
L_022008f4: .word 0x3a7
L_022008f8: .word data_ov016_022014a8
L_022008fc: .word data_ov016_022014a0
    .size func_ov016_02200778, . - func_ov016_02200778

