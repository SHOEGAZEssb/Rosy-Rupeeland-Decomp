.text

/* Exact fallback; see src/overlays/ov037/overlay037_geometry_setup.c for documented portable C. */

    .extern Graphics3DResourceBinding_GetTextureFormat
    .extern Graphics3DResourceBinding_GetTextureWidthClass
    .extern Graphics3DResourceBinding_GetTextureHeightClass
    .extern func_02070454
    .extern func_02070464
    .extern func_ov037_021fd4e0
    .extern func_ov037_021fd0a8
    .extern func_ov037_021fd520

    .global func_ov037_021fd324
func_ov037_021fd324:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r5, L_021fd4c0
    mov r1, #0x0
    mov r4, r0
    str r1, [r5, #0x0]
    ldr r3, [r4, #0x30]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x10]
    mov r0, #0x10000
    str r1, [r5, #0x2c]
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r0, [r5, #0x28]
    str r0, [r5, #0x28]
    mov r0, #0x1000
    str r0, [r5, #0x28]
    ldr r7, [r4, #0x9c]
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r6, r0
    ldr r0, [r4, #0x9c]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r5, r0
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr ip, [r7, #0x10]
    mov r3, r0
    ldr ip, [ip, #0xc]
    mov r2, r5
    mov r0, r6
    mov r1, #0x1
    str ip, [sp, #0xc]
    bl func_ov037_021fd4e0
    ldr r0, [r4, #0x9c]
    bl Graphics3DResourceBinding_GetTextureFormat
    cmp r0, #0x2
    ldr r0, [r4, #0x9c]
    moveq r1, #0x1
    ldr r2, [r0, #0x14]
    movne r1, #0x0
    ldr r2, [r2, #0xc]
    rsb r1, r1, #0x4
    ldr r0, L_021fd4c4
    mov r1, r2, lsr r1
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r4, #0x9c]
    add r0, r0, r0, lsl #0x1
    mov r4, r0, lsl #0xc
    ldr r0, [r1, #0x4]
    bl func_02070464
    add ip, r0, r0, lsl #0x1
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x2
    mov r5, ip, lsl #0xc
    str r0, [sp, #0x4]
    bl func_ov037_021fd0a8
    mov r2, #0x1
    ldr r1, L_021fd4c8
    rsb r0, r2, #0x8000
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    mov r1, r5
    mov r0, #0x0
    bl func_ov037_021fd520
    ldr r3, L_021fd4cc
    ldr r2, L_021fd4d0
    mov r0, #0x0
    str r3, [r2, #0x0]
    str r0, [r2, #0x0]
    mov r1, r5
    mov r0, r4
    bl func_ov037_021fd520
    ldr r3, L_021fd4d4
    ldr r2, L_021fd4d8
    mov r0, r4
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov037_021fd520
    ldr r0, L_021fd4dc
    ldr r2, L_021fd4d8
    mov r1, #0x0
    str r0, [r2, #0x0]
    add r0, r0, #0xfd00
    str r1, [r2, #-0xc]
    str r0, [r2, #0x0]
    str r1, [r2, #0x70]
    mov r0, #0x1
    str r0, [r2, #-0x4c]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd4c0: .word 0x4000444
L_021fd4c4: .word 0x40004ac
L_021fd4c8: .word 0x4000500
L_021fd4cc: .word 0xfe80fe80
L_021fd4d0: .word 0x400048c
L_021fd4d4: .word 0xfe800180
L_021fd4d8: .word 0x4000494
L_021fd4dc: .word 0x1800180
    .size func_ov037_021fd324, .-func_ov037_021fd324
