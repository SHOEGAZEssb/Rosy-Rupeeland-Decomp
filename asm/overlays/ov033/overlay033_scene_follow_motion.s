.text

/* Exact fallback; see src/overlays/ov033/overlay033_scene_motion.c for documented portable C. */

    .extern func_ov033_021fd4cc

    .global func_ov033_021fd598
func_ov033_021fd598:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x600
    bl func_ov033_021fd4cc
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x10]
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x20]
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x20]
    ldr r2, [r4, #0x4]
    ldr r0, [r4, #0x20]
    ldr r1, [r2, #0x24]
    add r0, r1, r0
    str r0, [r2, #0x24]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x1c]
    sub r0, r0, #0x18000
    str r0, [r1, #0x1c]
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x8]
    ldr r1, [r1, #0x20]
    str r1, [r0, #0x20]
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x8]
    ldr r1, [r1, #0x24]
    str r1, [r0, #0x24]
    ldmia sp!, {r4, pc}
.size func_ov033_021fd598, .-func_ov033_021fd598
