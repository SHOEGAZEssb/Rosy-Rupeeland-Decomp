    .text
    .extern data_020f4e18
    .extern func_020708c4
    .extern func_02071ee0
    .extern GraphicsSpriteGroup_CreateStateFromSource

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_active_object_create.c. */
    .global func_ov009_021fd360
func_ov009_021fd360: ; 0x021fd360
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0xd8]
    str r0, [r4, #0xdc]
    ldr r0, [r4, #0xa4]
    ldr r1, L_021fd410
    add r0, r4, r0, lsl #0x2
    ldr ip, [r0, #0x8c]
    ldr r3, [r0, #0xc0]
    add r0, r4, #0x78
    add lr, ip, r3, lsl #0x5
    ldr r2, [lr, #0x8]
    str r2, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldmia lr, {r2, r3}
    bl func_02071ee0
    ldr r0, [r4, #0x7c]
    bl func_020708c4
    ldr r2, [r4, #0xf8]
    ldr r0, [r4, #0x84]
    add r1, r4, #0x78
    and r2, r2, #0xff
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0x88]
    mov r1, #0x3
    strb r1, [r0, #0x3a]
    mov r0, #0x100
    str r0, [r4, #0x120]
    str r0, [r4, #0x124]
    str r0, [r4, #0x128]
    mov r2, #0x0
    str r2, [r4, #0x12c]
    ldr r0, [r4, #0x7c]
    ldr r0, [r0, #0x20]
    ldrh r1, [r0, #0x4]
    ldrh r0, [r0, #0x6]
    mul r0, r1, r0
    sub r0, r0, #0x1
    str r0, [r4, #0x130]
    str r2, [r4, #0x138]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd410: .word data_020f4e18

    .size func_ov009_021fd360, . - func_ov009_021fd360
