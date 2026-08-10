.text

/* Exact fallback; see src/overlays/ov036/overlay036_final_controller_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_ov048_0220baec
    .extern func_020773e4
    .extern func_ov036_02203c44
    .extern func_ov036_021fcfa0

    .global func_ov036_02204510
func_ov036_02204510:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    mov r1, #0x200
    rsb r1, r1, #0x0
    str r1, [sp, #0x0]
    mov r0, r1, lsr #0x16
    str r0, [sp, #0x4]
    mov ip, #0x1f
    add r0, r1, #0x100
    mov r1, #0x140
    mov r2, #0x100
    mov r3, #0x0
    str ip, [sp, #0x8]
    bl func_ov048_0220baec
    mov r0, #0x200
    rsb r0, r0, #0x0
    mov r1, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    sub r0, r1, #0x100
    str r1, [sp, #0x8]
    mov r2, #0x100
    mov r3, r0
    bl func_ov048_0220baec
    ldr r0, [r4, #0xe8]
    add r1, r4, #0x64
    bl func_020773e4
    ldr r0, [r4, #0xf0]
    add r1, r4, #0x64
    bl func_ov036_02203c44
    ldr r0, [r4, #0xf4]
    add r1, r4, #0x64
    bl func_ov036_021fcfa0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    .size func_ov036_02204510, .-func_ov036_02204510

