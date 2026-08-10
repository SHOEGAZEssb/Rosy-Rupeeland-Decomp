; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d4742
.extern data_020d4744
.extern data_020d4746
.extern data_020d6b20
.extern data_020d6b50
.extern AnimationBinding_Init
.extern DebugSpriteText_Init
.extern DebugSpriteText_SetTextResource
.extern func_02025a44
.extern func_02025d1c
.extern func_02025e88
.extern func_02025ed4
.extern GamePhaseMetadata_GetTextResourceId
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern gDebugFont
.extern gHeapContext

    .global func_020261bc
    .type func_020261bc, @function
func_020261bc: ; 0x020261bc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r4, r1
    bl func_02025a44
    ldr r1, .L_020262ec
    add r0, r5, #0xc8
    str r1, [r5, #0x0]
    bl DebugSpriteText_Init
    mov r0, #0x0
    str r0, [r5, #0xd0]
    mov r0, #0x1
    str r0, [r5, #0xd4]
    ldr r1, [r5, #0xc4]
    mov r0, r5
    bic r1, r1, #0x1
    orr r1, r1, #0x3
    str r1, [r5, #0xc4]
    bl func_02025e88
    mov r0, r5
    bl func_02025ed4
    mov r0, r5
    bl func_02025d1c
    ldr r0, .L_020262f0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl GamePhaseMetadata_GetTextResourceId
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r0, r5, #0xc8
    bl DebugSpriteText_SetTextResource
    ldr r1, .L_020262f4
    ldr r3, .L_020262f8
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02026290
    ldrsb r3, [r4, #0x4c]
    mov r1, #0x1e
    ldr r2, .L_020262fc
    smulbb r4, r3, r1
    ldrh r3, [r2, r4]
    mov r1, #0x2
    ldr r2, .L_02026300
    str r3, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, .L_02026304
    ldrh r2, [r2, r4]
    ldrh r3, [r1, r4]
    ldr r1, [r5, #0xa8]
    bl AnimationBinding_Init
.L_02026290:
    str r0, [r5, #0xd0]
    ldr r1, [r0, #0x0]
    mov r0, #0x30
    strh r0, [r1, #0x2c]
    mov r0, #0x10
    strh r0, [r1, #0x2e]
    ldr r0, [r5, #0xd0]
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r3, #0x3e8
    strb r1, [r0, #0x3a]
    ldr r1, [r5, #0xd0]
    mov r0, r5
    ldr r2, [r1, #0x0]
    mov r1, #0x1
    strh r3, [r2, #0x28]
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_020262ec: .word data_020d6b20
.L_020262f0: .word gDebugFont
.L_020262f4: .word data_020d6b50
.L_020262f8: .word gHeapContext
.L_020262fc: .word data_020d4746
.L_02026300: .word data_020d4742
.L_02026304: .word data_020d4744
    .size func_020261bc, . - func_020261bc
