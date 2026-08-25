    .text
    .extern data_ov013_021fed00
    .extern data_ov013_021fed08
    .extern TitleInterpolatedValue_Configure
    .extern func_02091c7c
    .extern func_02091cf0
    .extern SceneInputBase_Update
    .extern SceneSound_PlayPackedEffect
    .extern GraphicsSpriteState_TestTouchPoint
    .extern func_ov013_021fce04
    .extern Overlay013_UpdateSceneRuntime
    .extern func_ov013_021fdd8c

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_phase_handlers.c. */
    .global Overlay013_UpdateExitPhase

Overlay013_UpdateExitPhase:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021fe8a0
    mov r1, #0x1
    bl SceneInputBase_Update
L_021fe8a0:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fe8b8
    cmp r0, #0x1
    beq L_021fe968
    b L_021fe9ac
L_021fe8b8:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe9ac
    mov r0, r4
    bl func_ov013_021fdd8c
    cmp r0, #0x0
    beq L_021fe900
    mov r0, r4
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    mov r0, #0x4
    ldr r1, L_021fe9c0
    str r0, [r4, #0x984]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe9ac
L_021fe900:
    ldr r0, [r4, #0x984]
    cmp r0, #0x1
    bne L_021fe9ac
    ldr r0, [r4, #0x948]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_021fe9ac
    mov r0, r4
    mov r1, #0xb
    bl SceneSound_PlayPackedEffect
    mov r1, #0x14
    add r0, r4, #0x188
    str r1, [sp, #0x0]
    add r0, r0, #0x800
    sub r2, r1, #0x114
    mov r1, #0x2
    mov r3, #0x0
    bl TitleInterpolatedValue_Configure
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe9ac
L_021fe968:
    add r0, r4, #0x188
    add r0, r0, #0x800
    mov r1, #0x1
    bl func_02091c7c
    ldr r3, [r4, #0x84]
    add r1, r4, #0x188
    str r0, [r3, #0x18]
    mov r2, #0x0
    add r0, r1, #0x800
    str r2, [r3, #0x1c]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fe9ac
    ldr r1, L_021fe9c4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
L_021fe9ac:
    mov r0, r4
    bl Overlay013_UpdateSceneRuntime
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fe9c0: .word data_ov013_021fed08
L_021fe9c4: .word data_ov013_021fed00
    .size Overlay013_UpdateExitPhase, . - Overlay013_UpdateExitPhase
