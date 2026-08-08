.text
/* Exact fallback; see overlay039_resource_tier.c for portable C. */
    .extern func_020befec

    .global func_ov039_021feff0
func_ov039_021feff0:
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1c00
    ldrsh r0, [r0, #0xa8]
    mov r1, #0xa
    sub r0, r0, #0x1
    bl func_020befec
    rsbs r0, r0, #0x2
    movmi r0, #0x0
    cmp r0, #0x2
    movgt r0, #0x2
    ldmia sp!, {r3, pc}
    .size func_ov039_021feff0, .-func_ov039_021feff0

