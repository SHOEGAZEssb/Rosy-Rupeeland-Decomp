.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern func_020be4e4
    .extern func_020befec
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern func_02072b68
    .extern Sound_Play
    .extern func_ov040_021ff8b0
    .extern gSoundContext
    .global func_ov040_021ff514
func_ov040_021ff514:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0xb7c]
    str r0, [r4, #0xb84]
    mov r1, #0x1
    str r1, [r4, #0xb94]
    ldr r0, [r4, #0xb28]
    cmp r0, #0x0
    movle r1, #0x2
    str r1, [r4, #0xb90]
    bl func_020be4e4
    mov r1, #0x6
    bl func_020befec
    sub r0, r1, #0x3
    str r0, [r4, #0xb74]
    mvn r0, #0x10
    str r0, [r4, #0xb78]
    ldr r0, [r4, #0xb44]
    bl func_0209a07c
    ldr r2, [r4, #0x48]
    ldr r1, .Lresource
    ldr r3, [r2]
    mov r0, #0x1
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xb44]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a0d8
    ldr r0, [r4, #0xb44]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, [r4, #0xb44]
    ldr r0, .Lsound
    ldr r12, [r1, #0xc]
    mov r1, #0x12c
    ldrh r3, [r12, #0x24]
    mov r2, #0x13
    orr r3, r3, #0x2
    strh r3, [r12, #0x24]
    ldr r0, [r0]
    bl Sound_Play
    ldr r0, .Lsound
    mov r1, #0x12c
    ldr r0, [r0]
    mov r2, #0x5
    bl Sound_Play
    ldr r0, [r4, #0x48]
    mov r1, #0xb
    ldr r0, [r0, #0xc]
    str r1, [r0, #0x7c]
    ldr r0, [r4, #0xb28]
    cmp r0, #0x0
    mov r0, r4
    bgt .Lpositive
    mov r1, #0x7d0
    bl func_ov040_021ff8b0
    ldr r0, [r4, #0x48]
    mov r1, #0x7
    ldr r0, [r0, #0xc]
    str r1, [r0, #0x7c]
    b .Ldone
.Lpositive:
    mov r1, #0xb4
    bl func_ov040_021ff8b0
.Ldone:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.Lresource: .word 0x0000103b
.Lsound: .word gSoundContext
    .size func_ov040_021ff514, .-func_ov040_021ff514
