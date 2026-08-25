; Matching retail form; see src/game/game_phase_currency_hud_lifecycle.c.
.text
.extern data_020f4e14
.extern data_020f4e18
.extern GraphicsSpriteState_Create
.extern AnimationResource_InitEmpty
.extern GamePhaseCurrencyHud_UpdateDigits
.extern GamePhaseCurrencyHud_SetVisible
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork

    .global GamePhaseCurrencyHud_Init
GamePhaseCurrencyHud_Init: ; 0x02010878
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x8
    bl AnimationResource_InitEmpty
    add r0, r10, #0x18
    bl AnimationResource_InitEmpty
    add r0, r10, #0x28
    bl AnimationResource_InitEmpty
    add r0, r10, #0x38
    bl AnimationResource_InitEmpty
    mov r0, #0x1
    strh r0, [r10, #0xb0]
    mov r1, #0x0
    strh r1, [r10, #0xb2]
    strh r1, [r10, #0xb4]
    strh r1, [r10, #0xb6]
    strh r1, [r10, #0xb8]
    strh r1, [r10, #0xba]
    mov r0, #0x1e
    strh r0, [r10, #0xcc]
    ldr r0, L_02010b44
    strh r1, [r10, #0xce]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_02010b48
    str r0, [r10, #0x0]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x4]
    mov r0, #0x100
    strh r0, [r10, #0xbc]
    mov r0, #0xc0
    strh r0, [r10, #0xbe]
    mov r3, #0x0
L_02010904:
    ldrsh r2, [r10, #0xbe]
    ldr r1, [r10, r3, lsl #0x2]
    ldrsh r0, [r10, #0xbc]
    add r3, r3, #0x1
    cmp r3, #0x2
    str r0, [r1, #0x18]
    str r2, [r1, #0x1c]
    blt L_02010904
    ldr r3, L_02010b4c
    ldr r0, L_02010b50
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0xc
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_02010b54
    ldr r0, L_02010b50
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, r10, #0x1c
    sub r3, r3, #0x5
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_02010b58
    ldr r0, L_02010b50
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, r10, #0x2c
    sub r3, r3, #0x3
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_02010b5c
    ldr r1, L_02010b50
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x3c
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    mov r9, #0x0
L_020109a8:
    mov r0, #0x1c
    mul r0, r9, r0
    mov r6, #0x0
    mov r7, r6
    add r8, r0, r10
    mov r5, #0xc0
    mov r11, r6
    mov r4, r6
L_020109c8:
    stmia sp, {r5, r11}
    str r11, [sp, #0x8]
    ldr r0, [r10, r9, lsl #0x2]
    mov r2, r11
    mov r3, r11
    add r1, r10, #0x8
    bl GraphicsSpriteState_Create
    add r2, r8, r7, lsl #0x2
    sub r1, r6, #0x10
    str r0, [r2, #0x48]
    strh r6, [r0, #0x2c]
    mov r1, r1, lsl #0x10
    mov r6, r1, asr #0x10
    strh r4, [r0, #0x2e]
    cmp r7, #0x2
    subeq r0, r6, #0x4
    moveq r0, r0, lsl #0x10
    moveq r6, r0, asr #0x10
    beq L_02010a24
    cmp r7, #0x5
    subeq r0, r6, #0x4
    moveq r0, r0, lsl #0x10
    moveq r6, r0, asr #0x10
L_02010a24:
    add r7, r7, #0x1
    cmp r7, #0x7
    blt L_020109c8
    mov r0, #0xc0
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    mov r2, #0x0
    ldr r0, [r10, r9, lsl #0x2]
    mov r3, r2
    add r1, r10, #0x18
    bl GraphicsSpriteState_Create
    add r3, r10, r9, lsl #0x2
    mvn r1, #0x7f
    str r0, [r3, #0x80]
    strh r1, [r0, #0x2c]
    add r1, r1, #0x74
    strh r1, [r0, #0x2e]
    mov r0, #0x100
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, r9, lsl #0x2]
    mov r3, r2
    add r1, r10, #0x28
    bl GraphicsSpriteState_Create
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x88]
    mov r8, #0x0
    strh r8, [r0, #0x2c]
    strh r8, [r0, #0x2e]
    mov r7, r9, lsl #0x2
    add r4, r10, r9, lsl #0x4
    mov r6, #0xdf
    mov r5, #0x4
    mov r11, #0x2
L_02010ac8:
    str r6, [sp, #0x0]
    stmib sp, {r5, r11}
    ldr r0, [r7, r10]
    mov r2, r11
    mov r3, #0x0
    add r1, r10, #0x38
    bl GraphicsSpriteState_Create
    add r1, r4, r8, lsl #0x2
    add r8, r8, #0x1
    str r0, [r1, #0x90]
    cmp r8, #0x4
    blt L_02010ac8
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_020109a8
    ldr r1, L_02010b60
    mov r0, r10
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x40]
    bl GamePhaseCurrencyHud_UpdateDigits
    ldr r1, L_02010b60
    mov r0, r10
    ldr r2, [r1, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x40]
    str r2, [r10, #0xc0]
    str r2, [r10, #0xc4]
    bl GamePhaseCurrencyHud_SetVisible
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02010b44: .word data_020f4e14
L_02010b48: .word gDebugFont
L_02010b4c: .word 0x32a9
L_02010b50: .word data_020f4e18
L_02010b54: .word 0x32ad
L_02010b58: .word 0x32ab
L_02010b5c: .word 0x32a0
L_02010b60: .word gGameWork
    .size GamePhaseCurrencyHud_Init, . - GamePhaseCurrencyHud_Init

