.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern func_020954e0
.extern func_ov025_021ff140


    .global func_ov025_0220058c
func_ov025_0220058c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x508]
    bl func_ov025_021ff140
    ldr r0, [r4, #0xdc]
    bl func_020954e0
    ldr r0, [r4, #0xe0]
    bl func_020954e0
    mov r2, #0x0
L_022005b0:
    add r0, r4, r2, lsl #0x2
    ldr r1, [r0, #0xc4]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    cmp r2, #0x6
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_022005b0
    ldr r1, [r4, #0xc0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.size func_ov025_0220058c, .-func_ov025_0220058c

