.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb78
.extern func_02092260
.extern func_02092288
.extern InventoryScroll_SaveOrigins
.extern InventoryScroll_UpdateInterpolation
.extern InventoryScroll_BeginMarkerDrag
.extern InventoryScroll_UpdateMarkerDrag
.extern InventoryScroll_EndMarkerDrag
.extern func_ov023_021fd3b0
.extern func_ov023_021fd9d0
.extern func_ov023_021fe6e4
.extern func_ov023_021fe77c


    .global func_ov023_021fef6c
func_ov023_021fef6c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x390]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x38]
    cmp r0, #0x0
    beq L_021fef9c
    cmp r0, #0x1
    beq L_021fefbc
    cmp r0, #0x2
    beq L_021ff028
    b L_021ff090
L_021fef9c:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fefbc:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021ff00c
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021feff4
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_021feff4:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff028
L_021ff00c:
    ldr r0, [r5, #0x390]
    bl func_ov023_021fd3b0
    cmp r0, #0x0
    beq L_021ff090
    mov r0, r5
    bl func_ov023_021fe6e4
    b L_021ff090
L_021ff028:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021ff078
    add r1, r5, #0x30
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_021ff090
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff090
L_021ff078:
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r1, L_021ff0a0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
L_021ff090:
    mov r0, r5
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff0a0: .word data_ov023_021ffb78
.size func_ov023_021fef6c, .-func_ov023_021fef6c

