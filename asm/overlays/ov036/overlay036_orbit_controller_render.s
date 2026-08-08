.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_controller_render.c for documented portable C. */

    .extern func_02077b44
    .extern func_020773e4
    .extern func_ov036_0220009c
    .extern func_ov036_021fd128
    .extern func_ov036_021fdef0

    .global func_ov036_02200fb8
func_ov036_02200fb8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0xc
    bl func_02077b44
    ldr r0, [r4, #0x100]
    add r1, r4, #0x64
    bl func_020773e4
    ldr r0, [r4, #0x144]
    bl func_ov036_0220009c
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x13
    bl func_ov036_021fd128
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov036_021fdef0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_ov036_02200fb8, .-func_ov036_02200fb8
