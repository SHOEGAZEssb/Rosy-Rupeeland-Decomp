.text

/* Exact fallback; see src/overlays/ov036/overlay036_record_list.c for documented portable C. */

    .extern TitleInterpolatedValue_Init
    .extern func_02091b98

    .global func_ov036_021fdba0
func_ov036_021fdba0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    add r0, r5, #0x18
    mov r4, r1
    mov r7, r2
    mov r6, r3
    bl TitleInterpolatedValue_Init
    mov r0, #0x0
    stmia r5, {r0, r7}
    ldr r1, [sp, #0x18]
    str r6, [r5, #0x8]
    str r1, [r5, #0xc]
    ldr r0, [sp, #0x1c]
    ldr r2, [sp, #0x20]
    str r0, [r5, #0x10]
    mov r1, r4
    add r0, r5, #0x18
    str r2, [r5, #0x14]
    bl func_02091b98
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_ov036_021fdba0, .-func_ov036_021fdba0
