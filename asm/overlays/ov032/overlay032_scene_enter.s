.text

/* Exact fallback; see src/overlays/ov032/overlay032_scene_transitions.c for documented portable C. */
.extern GameWork_TestFlag
.extern data_ov032_02202220
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern Sound_SetCaptureRoute0Enabled
.extern func_020594ec
.extern Sound_SaveStreamPosition
.extern Overlay032Scene_SetupGraphics
.extern gGameWork
.extern gSoundContext

    .global func_ov032_021febec
func_ov032_021febec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xb64]
    cmp r0, #0x0
    beq L_021fec14
    cmp r0, #0x1
    beq L_021fec3c
    cmp r0, #0x2
    beq L_021fec94
    b L_021fed74
L_021fec14:
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021fed74
L_021fec3c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fed74
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_021fed74
    mov r0, r4
    bl Overlay032Scene_SetupGraphics
    ldr r0, L_021fed7c
    ldr r0, [r0, #0x0]
    bl Sound_SaveStreamPosition
    ldr r1, [r4, #0x4]
    mov r0, #0x1
    str r0, [r1, #0x20]
    ldr r2, [r4, #0x0]
    mov r1, #0x10
    str r0, [r2, #0x20]
    bl DisplayBrightness_StartSubTransition
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021fed74
L_021fec94:
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_021fed74
    ldr r0, L_021fed7c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    mov r3, #0x1e
    bl Sound_SetCaptureRoute0Enabled
    ldr r0, L_021fed7c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, #0x1e
    bl Sound_SetCaptureRoute0Enabled
    ldr r0, L_021fed7c
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl func_020594ec
    ldr r0, L_021fed80
    ldr r1, L_021fed84
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fed20
    mov r1, #0x1
    ldr r0, L_021fed88
    str r1, [r4, #0xf28]
    ldr r2, [r0, #0x30]
    ldr r1, [r0, #0x34]
    mov r0, #0x0
    str r2, [r4, #0xb6c]
    str r1, [r4, #0xb70]
    str r0, [r4, #0xb64]
    b L_021fed74
L_021fed20:
    ldr r0, L_021fed80
    mov r1, #0x3fc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fed58
    ldr r0, L_021fed88
    mov r1, #0x14
    ldr r2, [r0, #0x28]
    ldr r0, [r0, #0x2c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_021fed74
L_021fed58:
    ldr r0, L_021fed88
    mov r1, #0x0
    ldr r2, [r0, #0x20]
    ldr r0, [r0, #0x24]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
L_021fed74:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fed7c: .word gSoundContext
L_021fed80: .word gGameWork
L_021fed84: .word 0x15a
L_021fed88: .word data_ov032_02202220
.size func_ov032_021febec, .-func_ov032_021febec

