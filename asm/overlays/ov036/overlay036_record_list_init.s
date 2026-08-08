.text

/* Exact fallback; see src/overlays/ov036/overlay036_record_list.c for documented portable C. */

    .global func_ov036_021fdbf4
func_ov036_021fdbf4:
    mov r2, #0x0
    str r2, [r0, #0x4]
    str r2, [r0, #0x0]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    ldr r2, L_021fdc18
    str r1, [r0, #0x10]
    strh r2, [r0, #0x14]
    bx lr
L_021fdc18: .word 0x7fff
    .size func_ov036_021fdbf4, .-func_ov036_021fdbf4
