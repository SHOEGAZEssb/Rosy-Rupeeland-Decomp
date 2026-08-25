    .text
    .extern data_ov015_021febf8
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_StopPackedEffect
    .extern InventoryScroll_BeginMarkerDrag
    .extern InventoryScroll_EndMarkerDrag
    .extern func_ov001_021fc240
    .extern Overlay001_Grid_UpdateTransition
    .extern func_ov001_021fc348
    .extern func_ov015_021fce30
    .extern Overlay015_UpdateRecords
    .extern func_ov015_021fd6c8
    .extern func_ov015_021fdad4

/* Exact fallbacks for auxiliary controller phase; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global func_ov015_021fe2b0

func_ov015_021fe2b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0xdc]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x1bc]
    cmp r0, #0x0
    beq L_021fe2e0
    cmp r0, #0x1
    beq L_021fe300
    cmp r0, #0x2
    beq L_021fe36c
    b L_021fe3d0
L_021fe2e0:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fe300:
    ldr r0, [r5, #0xdc]
    bl func_ov001_021fc240
    cmp r0, #0x0
    beq L_021fe360
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021fe348
    mov r0, r5
    bl func_ov015_021fd6c8
    mov r0, r5
    bl func_ov015_021fdad4
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_021fe348:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe36c
L_021fe360:
    ldr r0, [r5, #0xdc]
    bl Overlay001_Grid_UpdateTransition
    b L_021fe3d0
L_021fe36c:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fe3b4
    ldr r0, [r5, #0xdc]
    add r1, r5, #0x30
    bl func_ov001_021fc348
    cmp r0, #0x0
    beq L_021fe3d0
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe3d0
L_021fe3b4:
    mov r0, r4
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r1, L_021fe3e0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fe3d0:
    mov r0, r5
    bl Overlay015_UpdateRecords
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe3e0: .word data_ov015_021febf8

    .size func_ov015_021fe2b0, . - func_ov015_021fe2b0
