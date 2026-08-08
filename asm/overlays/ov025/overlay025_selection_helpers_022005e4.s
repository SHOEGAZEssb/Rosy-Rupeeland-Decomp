.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern func_02074110
.extern func_020954f4


    .global func_ov025_022005e4
func_ov025_022005e4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x508]
    ldr r0, [r4, #0xe0]
    bl func_02074110
    ldr r0, [r4, #0xe4]
    bl func_02074110
    ldr r0, [r5, #0xdc]
    bl func_020954f4
    ldr r0, [r5, #0xe0]
    bl func_020954f4
    mov r2, #0x0
L_02200614:
    add r0, r5, r2, lsl #0x2
    ldr r1, [r0, #0xc4]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    cmp r2, #0x6
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_02200614
    ldr r1, [r5, #0xc0]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov025_022005e4, .-func_ov025_022005e4

