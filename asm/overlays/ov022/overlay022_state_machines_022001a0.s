.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_ov022_02200520
.extern SceneSound_PlayPackedEffect
.extern SceneSound_StopPackedEffect
.extern InventoryScroll_SaveOrigins
.extern InventoryScroll_UpdateInterpolation
.extern InventoryScroll_BeginMarkerDrag
.extern InventoryScroll_UpdateMarkerDrag
.extern InventoryScroll_EndMarkerDrag
.extern func_ov022_021fdcb4
.extern func_ov022_021fdd1c
.extern func_ov022_021fefe0
.extern func_ov022_021ff048
.extern func_ov022_021ff0d0
.extern func_ov022_021ff368


    .global func_ov022_022001a0
func_ov022_022001a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x2b8]
    ldr r4, [r1, #0x30]
    bl func_ov022_021ff368
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_022001d4
    cmp r0, #0x1
    beq L_022001f4
    cmp r0, #0x2
    beq L_02200260
    b L_022002d0
L_022001d4:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_022001f4:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_02200244
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_0220022c
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_0220022c:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200260
L_02200244:
    ldr r0, [r5, #0x2b8]
    bl func_ov022_021fdcb4
    cmp r0, #0x0
    beq L_022002d0
    mov r0, r5
    bl func_ov022_021fefe0
    b L_022002d0
L_02200260:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_022002b0
    bl InventoryScroll_SaveOrigins
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_022002d0
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_022002d0
L_022002b0:
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    mov r0, r5
    bl func_ov022_021ff048
    ldr r1, L_022002e0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
L_022002d0:
    mov r0, r5
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_022002e0: .word data_ov022_02200520
.size func_ov022_022001a0, .-func_ov022_022001a0

