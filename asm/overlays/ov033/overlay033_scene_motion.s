.text

/* Exact fallback; see src/overlays/ov033/overlay033_scene_motion.c for documented portable C. */

    .extern GamePhaseState_GetBoundaryDirection
    .extern Heap_Alloc
    .extern func_ov074_0220fda8
    .extern TitleDialog_UpdateTextPage
    .extern Presentation_InterpolateQuadraticPulse
    .extern GamePhaseState_QueryTerrainHeight
    .extern gGamePhaseRuntime
    .extern data_ov033_021fdec0
    .extern gHeapContext
    .extern gPadState1
    .extern gTouchPanelManager
    .extern data_020c9670

    .global func_ov033_021fd37c
func_ov033_021fd37c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd40c
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetBoundaryDirection
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    beq L_021fd404
    ble L_021fd404
    cmp r0, #0x4
    bgt L_021fd404
    ldr r1, L_021fd40c
    sub r4, r0, #0x1
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    add r0, r0, r4, lsl #0x1
    ldrsh r0, [r0, #0x14]
    cmp r0, #0x0
    blt L_021fd404
    ldr r1, L_021fd410
    ldr r3, L_021fd414
    mov r0, #0x174
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd3f8
    mov r1, r4
    bl func_ov074_0220fda8
L_021fd3f8:
    str r5, [r0, #0x128]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_021fd404:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd40c: .word gGamePhaseRuntime
L_021fd410: .word data_ov033_021fdec0
L_021fd414: .word gHeapContext
.size func_ov033_021fd37c, .-func_ov033_021fd37c

    .global func_ov033_021fd418
func_ov033_021fd418:
    stmdb sp!, {lr}
    sub sp, sp, #0x2c
    ldr ip, L_021fd4c4
    add r3, sp, #0x14
    mov r2, #0xb
L_021fd42c:
    ldrh r1, [ip], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne L_021fd42c
    ldr r1, [r0, #0xc4]
    ldr r3, [r1, #0x38]
    mov r1, r3, lsl #0x1f
    movs r1, r1, asr #0x1f
    str r3, [sp, #0x4]
    str r3, [sp, #0xc]
    movne r0, #0x1
    bne L_021fd4bc
    ldr r1, L_021fd4c8
    ldr r2, [r1, #0x0]
    ldrh r1, [r2, #0x44]
    cmp r1, #0x1
    bne L_021fd4a0
    ldrh r1, [r2, #0x3c]
    cmp r1, #0x1
    beq L_021fd4a0
    mov r1, r3, lsl #0x1e
    movs r1, r1, asr #0x1f
    ldrneh r1, [sp, #0x16]
    str r3, [sp, #0x8]
    orrne r1, r1, #0x1
    strneh r1, [sp, #0x16]
    ldreqh r1, [sp, #0x16]
    orreq r1, r1, #0x2
    streqh r1, [sp, #0x16]
L_021fd4a0:
    ldr r0, [r0, #0xc4]
    add r1, sp, #0x14
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0x10]
    mov r0, r1, asr #0x1f
L_021fd4bc:
    add sp, sp, #0x2c
    ldmia sp!, {pc}
L_021fd4c4: .word gPadState1
L_021fd4c8: .word gTouchPanelManager
.size func_ov033_021fd418, .-func_ov033_021fd418

    .global func_ov033_021fd4cc
func_ov033_021fd4cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x38]
    mov r0, #0x0
    add r1, r2, r1
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    str r2, [r4, #0x38]
    mov r3, r1, asr #0x8
    mov r1, #0x800
    mov r2, #0x100
    bl Presentation_InterpolateQuadraticPulse
    ldr r2, [r4, #0x48]
    ldr r1, L_021fd590
    str r0, [r2, #0x12c]
    ldr r0, [r4, #0x4]
    ldr ip, [r1, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    mov r1, r1, asr #0xc
    mov r3, r0, asr #0xc
    mov r0, r1, asr #0x3
    add r1, r1, r0, lsr #0x1c
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    add r0, ip, #0x24
    mov r1, r1, asr #0x4
    mov r2, r2, asr #0x4
    bl GamePhaseState_QueryTerrainHeight
    mov r3, r0, lsl #0x4
    ldr r2, [r4, #0x38]
    ldr r0, L_021fd594
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r2, [r0, r2]
    mov r0, #0x18
    ldr r1, [r4, #0x4]
    smulbb r2, r2, r0
    add r3, r3, #0x40
    ldr r0, [r1, #0x24]
    add r1, r2, r3, lsl #0xc
    sub r1, r1, r0
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    str r0, [r4, #0x20]
    ldmia sp!, {r4, pc}
L_021fd590: .word gGamePhaseRuntime
L_021fd594: .word data_020c9670
.size func_ov033_021fd4cc, .-func_ov033_021fd4cc
