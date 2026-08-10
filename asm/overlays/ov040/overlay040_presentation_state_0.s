.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern Sound_Play
    .extern func_ov040_021ff8b0
    .extern gSoundContext
    .global func_ov040_021ff42c
func_ov040_021ff42c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x34]
    mov r0, #0x6
    str r0, [r1, #0x38]
    mov r1, #0x0
    str r1, [r4, #0xb7c]
    mov r0, #0x1
    str r1, [r4, #0xb84]
    str r0, [r4, #0xb94]
    str r1, [r4, #0xb90]
    sub r0, r0, #0x10
    str r0, [r4, #0xb78]
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r1, .Lresource
    ldr r2, [r4, #0x48]
    mov r0, #0x1
    ldr r3, [r2]
    add r2, r1, #0x1
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0xb44]
    ldr r0, .Lsound
    ldr r12, [r1, #0xc]
    mov r1, #0x12c
    ldrh r3, [r12, #0x24]
    mov r2, #0x11
    bic r3, r3, #0x2
    strh r3, [r12, #0x24]
    ldr r0, [r0]
    bl Sound_Play
    ldr r0, .Lsound
    mov r1, #0x12c
    ldr r0, [r0]
    mov r2, #0x5
    bl Sound_Play
    mov r3, #0xb
    ldr r1, [r4, #0x48]
    mov r0, r4
    ldr r2, [r1, #0xc]
    mov r1, #0x6e
    str r3, [r2, #0x7c]
    bl func_ov040_021ff8b0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.Lresource: .word 0x0000103b
.Lsound: .word gSoundContext
    .size func_ov040_021ff42c, .-func_ov040_021ff42c
