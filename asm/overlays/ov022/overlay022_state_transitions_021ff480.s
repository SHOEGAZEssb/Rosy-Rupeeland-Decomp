.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_transitions.c. */
.extern data_020f4e14
.extern data_ov022_02200508
.extern GamePhaseCurrencyHud_SetVisible
.extern Sound_LoadGroup
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern SpriteMotionController_Hide
.extern func_ov022_021fdd1c
.extern func_ov022_021ff0d0
.extern func_ov022_021ff220
.extern gDebugFont
.extern gGamePhaseCurrencyHud
.extern gSoundContext
.extern Sound_Play


    .global func_ov022_021ff480
func_ov022_021ff480:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne L_021ff514
    ldr r0, L_021ff524
    ldr r1, L_021ff528
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    ldr r0, L_021ff524
    ldr r1, L_021ff528
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, L_021ff52c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021ff530
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r4, #0xa8
    bl SpriteMotionController_Hide
    ldr r0, L_021ff534
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    mov r0, r4
    mov r1, #0x0
    bl func_ov022_021ff220
    mov r0, r4
    ldr r1, L_021ff538
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
L_021ff514:
    mov r0, r4
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff524: .word gSoundContext
L_021ff528: .word 0x122
L_021ff52c: .word data_020f4e14
L_021ff530: .word gDebugFont
L_021ff534: .word gGamePhaseCurrencyHud
L_021ff538: .word data_ov022_02200508
.size func_ov022_021ff480, .-func_ov022_021ff480

