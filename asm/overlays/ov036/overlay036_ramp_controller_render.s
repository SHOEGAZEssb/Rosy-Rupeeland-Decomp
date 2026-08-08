.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_controller_render.c for documented portable C. */

    .extern func_02077b44
    .extern func_ov045_0220bc3c
    .extern func_020773e4
    .extern func_ov036_021fd128
    .extern func_ov036_021fdef0
    .extern func_ov036_021fd6e0

    .global func_ov036_02201c7c
func_ov036_02201c7c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0xc
    bl func_02077b44
    mov ip, #0x0
    mvn r0, #0x3f
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    sub r0, ip, #0x90
    sub r1, ip, #0xa0
    sub r2, ip, #0x20
    mov r3, #0x140
    str ip, [sp, #0x8]
    bl func_ov045_0220bc3c ; func_ov048_0220bc3c
    mvn r0, #0x3f
    str r0, [sp, #0x0]
    mov r0, #0x1f
    mov r2, #0x20
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    sub r3, r2, #0xc0
    mov r0, #0x90
    mov r1, #0x140
    bl func_ov045_0220bc3c ; func_ov048_0220bc3c
    ldr r0, [r4, #0x118]
    add r1, r4, #0x64
    bl func_020773e4
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x8000
    str r0, [sp, #0x4]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x12
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
    ldr r4, [r4, #0x15c]
    b L_02201d50
L_02201d44:
    mov r0, r4
    bl func_ov036_021fd6e0
    ldr r4, [r4, #0x8]
L_02201d50:
    cmp r4, #0x0
    bne L_02201d44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_ov036_02201c7c, .-func_ov036_02201c7c

