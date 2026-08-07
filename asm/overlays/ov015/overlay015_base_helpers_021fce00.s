    .text

/* Exact fallbacks; see src/overlays/ov015/overlay015_base_helpers.c. */
    .global func_ov015_021fce00
    .global func_ov015_021fce14
    .global func_ov015_021fce18
    .global func_ov015_021fce30

func_ov015_021fce00:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr

    .size func_ov015_021fce00, . - func_ov015_021fce00
func_ov015_021fce14:
    bx lr

    .size func_ov015_021fce14, . - func_ov015_021fce14
func_ov015_021fce18:
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    ldrne r0, [r2, #0x20]
    orrne r0, r0, r1
    strne r0, [r2, #0x20]
    bx lr

    .size func_ov015_021fce18, . - func_ov015_021fce18
func_ov015_021fce30:
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

    .size func_ov015_021fce30, . - func_ov015_021fce30
