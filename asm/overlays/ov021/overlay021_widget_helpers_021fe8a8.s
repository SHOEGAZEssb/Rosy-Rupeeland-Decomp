    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */
    .extern func_02074058

.global func_ov021_021fe8a8
func_ov021_021fe8a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x94]
    bl func_02074058
    mov r3, #0x0
    mov r2, r3
    mov r0, #0xac
L_021fe8c4:
    mla r1, r3, r0, r4
    add r3, r3, #0x1
    str r2, [r1, #0x1e8]
    cmp r3, #0x2
    blt L_021fe8c4
    str r2, [r4, #0x13c]
    str r2, [r4, #0x9c]
    str r2, [r4, #0x98]
    ldmia sp!, {r4, pc}
    .size func_ov021_021fe8a8, . - func_ov021_021fe8a8

