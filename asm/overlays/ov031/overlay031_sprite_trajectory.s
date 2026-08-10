.text

/* Exact fallback; see src/overlays/ov031/overlay031_sprite_trajectory.c for documented portable C. */
.extern GraphicsSpriteState_ReleaseFromGroup


    .global func_ov031_021fd19c
func_ov031_021fd19c:
    str r1, [r0, #0x0]
    ldr r1, [sp, #0x0]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    mov r1, #0x10
    str r1, [r0, #0x14]
    bx lr
.size func_ov031_021fd19c, .-func_ov031_021fd19c
    .global func_ov031_021fd1c0
func_ov031_021fd1c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq L_021fd1d8
    bl GraphicsSpriteState_ReleaseFromGroup
L_021fd1d8:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov031_021fd1c0, .-func_ov031_021fd1c0
    .global func_ov031_021fd1e0
func_ov031_021fd1e0:
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    moveq r0, #0x1
    bxeq lr
    sub r1, r1, #0x1
    str r1, [r0, #0x14]
    ldr r2, [r0, #0x4]
    ldr r1, [r0, #0xc]
    add r1, r2, r1
    str r1, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0x10]
    add r1, r2, r1
    str r1, [r0, #0x8]
    ldr r1, [r0, #0x10]
    add r1, r1, #0x20
    str r1, [r0, #0x10]
    ldmib r0, {r3, ip}
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    mov r1, ip, asr #0x7
    ldr r3, [r0, #0x0]
    add r0, ip, r1, lsr #0x18
    mov r1, r2, asr #0x8
    strh r1, [r3, #0x2c]
    mov r0, r0, asr #0x8
    strh r0, [r3, #0x2e]
    mov r0, #0x0
    bx lr
.size func_ov031_021fd1e0, .-func_ov031_021fd1e0
    .global func_ov031_021fd254
func_ov031_021fd254:
    bx lr
.size func_ov031_021fd254, .-func_ov031_021fd254
