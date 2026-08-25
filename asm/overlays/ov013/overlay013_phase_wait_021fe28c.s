    .text
    .extern GameWork_ClearFlag
    .extern data_ov013_021febb4
    .extern data_ov013_021fec18
    .extern data_ov013_021fed30
    .extern SceneInputBase_Update
    .extern SceneSound_PlayPackedEffect
    .extern func_ov013_021fce04
    .extern Overlay013_UpdateSceneRuntime
    .extern func_ov013_021fdf38
    .extern Overlay013_RandomizeActiveRecordPositions
    .extern gGameWork

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_phase_handlers.c. */
    .global Overlay013_UpdateRevealPhase

Overlay013_UpdateRevealPhase:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021fe2a8
    mov r1, #0x0
    bl SceneInputBase_Update
L_021fe2a8:
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fe430
L_021fe2b8: ; jump table
    b L_021fe2c8 ; case 0
    b L_021fe2dc ; case 1
    b L_021fe360 ; case 2
    b L_021fe3a4 ; case 3
L_021fe2c8:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe430
L_021fe2dc:
    mov r0, r4
    bl func_ov013_021fdf38
    cmp r0, #0x0
    bne L_021fe348
    mov r3, #0x0
    mov r0, #0xac
L_021fe2f4:
    mla r1, r3, r0, r4
    add r1, r1, #0x100
    ldrh r1, [r1, #0x24]
    tst r1, #0x1
    addne r1, r4, r3, lsl #0x2
    ldrne r2, [r1, #0x950]
    add r3, r3, #0x1
    ldrneh r1, [r2, #0x24]
    orrne r1, r1, #0x4
    strneh r1, [r2, #0x24]
    cmp r3, #0x7
    blt L_021fe2f4
    mov r0, r4
    mov r1, #0x6
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe430
L_021fe348:
    mov r0, r4
    mov r1, #0x18
    mov r2, #0xc
    mov r3, #0x12
    bl Overlay013_RandomizeActiveRecordPositions
    b L_021fe430
L_021fe360:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x78
    ble L_021fe38c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe430
L_021fe38c:
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x14
    mov r3, #0x1a
    bl Overlay013_RandomizeActiveRecordPositions
    b L_021fe430
L_021fe3a4:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x78
    ble L_021fe430
    ldr r7, L_021fe440
    ldr r6, L_021fe444
    mov r8, #0x0
    mov r5, #0x18
L_021fe3c8:
    mla r0, r8, r5, r7
    ldrh r1, [r0, #0x14]
    ldr r0, [r6, #0x0]
    bl GameWork_ClearFlag
    add r8, r8, #0x1
    cmp r8, #0x7
    blt L_021fe3c8
    ldr r7, L_021fe448
    ldr r6, L_021fe444
    mov r8, #0x0
    mov r5, #0x14
L_021fe3f4:
    mla r0, r8, r5, r7
    ldrh r1, [r0, #0x10]
    ldr r0, [r6, #0x0]
    bl GameWork_ClearFlag
    add r8, r8, #0x1
    cmp r8, #0x5
    blt L_021fe3f4
    ldr r0, L_021fe444
    ldr r1, L_021fe44c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021fe450
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
L_021fe430:
    mov r0, r4
    bl Overlay013_UpdateSceneRuntime
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe440: .word data_ov013_021fec18
L_021fe444: .word gGameWork
L_021fe448: .word data_ov013_021febb4
L_021fe44c: .word 0x3de
L_021fe450: .word data_ov013_021fed30
    .size Overlay013_UpdateRevealPhase, . - Overlay013_UpdateRevealPhase
