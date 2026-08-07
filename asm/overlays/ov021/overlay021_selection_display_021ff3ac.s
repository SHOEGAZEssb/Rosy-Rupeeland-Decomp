    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern func_02070874

.global func_ov021_021ff3ac
func_ov021_021ff3ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3f4]
    str r0, [r4, #0x3f0]
    ldr r0, [r4, #0x400]
    bl func_02070874
    add r0, r0, #0x60
    str r0, [r4, #0x3f4]
    mov r0, #0x0
    str r0, [r4, #0x3f8]
    ldmia sp!, {r4, pc}
    .size func_ov021_021ff3ac, . - func_ov021_021ff3ac

