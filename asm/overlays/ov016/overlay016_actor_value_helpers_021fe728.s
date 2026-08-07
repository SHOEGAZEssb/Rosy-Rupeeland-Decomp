    .text

/* Exact fallbacks for actor and value helpers; see src/overlays/ov016/overlay016_actor_runtime.c. */
    .global func_ov016_021fe728
    .global func_ov016_021fe740
    .global func_ov016_021fe754

func_ov016_021fe728:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr

    .global func_ov016_021fe740
func_ov016_021fe740:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr

    .global func_ov016_021fe754
func_ov016_021fe754:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr

    .size func_ov016_021fe728, func_ov016_021fe740 - func_ov016_021fe728
    .size func_ov016_021fe740, func_ov016_021fe754 - func_ov016_021fe740
    .size func_ov016_021fe754, . - func_ov016_021fe754
