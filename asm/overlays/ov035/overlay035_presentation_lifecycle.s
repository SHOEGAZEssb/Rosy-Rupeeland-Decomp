.text

/* Exact fallback; see src/overlays/ov035/overlay035_presentation_lifecycle.c for documented portable C. */

    .extern Graphics3DResourceOwner_Destroy
    .extern Heap_Free
    .extern func_02075020
    .extern func_02092418
    .extern GX_SetGraphicsMode
    .extern func_02059230
    .extern func_ov048_0220b7b4
    .extern func_020923a0
    .extern GraphicsResourceSetVariant_Destroy
    .extern func_ov048_0220ba90
    .extern data_ov035_02203bb4
    .extern data_020f4e14
    .extern gDebugFont
    .extern gSoundContext

    .global func_ov035_022026ac
func_ov035_022026ac:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02202768
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq L_022026e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_022026e0:
    ldr r5, [r4, #0x5c]
    cmp r5, #0x0
    beq L_022026fc
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_022026fc:
    ldr r0, L_0220276c
    ldr r0, [r0, #0x0]
    bl func_02075020
    ldr r0, L_02202770
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x64
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_02202774
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    ldr r0, L_02202778
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl func_02059230
    add r0, r4, #0x98
    bl func_ov048_0220b7b4
    add r0, r4, #0x64
    bl func_020923a0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02202768: .word data_ov035_02203bb4
L_0220276c: .word data_020f4e14
L_02202770: .word gDebugFont
L_02202774: .word 0x4000050
L_02202778: .word gSoundContext
    .size func_ov035_022026ac, .-func_ov035_022026ac

    .global func_ov035_0220277c
func_ov035_0220277c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov035_0220277c, .-func_ov035_0220277c

    .global func_ov035_0220279c
func_ov035_0220279c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02202860
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq L_022027d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_022027d0:
    ldr r5, [r4, #0x5c]
    cmp r5, #0x0
    beq L_022027ec
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_022027ec:
    ldr r0, L_02202864
    ldr r0, [r0, #0x0]
    bl func_02075020
    ldr r0, L_02202868
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x64
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_0220286c
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    ldr r0, L_02202870
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl func_02059230
    add r0, r4, #0x98
    bl func_ov048_0220b7b4
    add r0, r4, #0x64
    bl func_020923a0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02202860: .word data_ov035_02203bb4
L_02202864: .word data_020f4e14
L_02202868: .word gDebugFont
L_0220286c: .word 0x4000050
L_02202870: .word gSoundContext
    .size func_ov035_0220279c, .-func_ov035_0220279c

    .global func_ov035_02202874
func_ov035_02202874:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_022028ac
    add r0, r4, #0x98
    bl func_ov048_0220ba90
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_022028ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov035_02202874, .-func_ov035_02202874

