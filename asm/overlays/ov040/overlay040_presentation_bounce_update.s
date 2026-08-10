    .text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern Sound_Play
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern gSoundContext
.global func_ov040_021ff630
func_ov040_021ff630: ; 0x021ff630
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xb94]
    mov r4, r1
    cmp r0, #0x16
    bge .L_021ff69c
    add r0, r0, #0x1
    str r0, [r5, #0xb94]
    cmp r0, #0xb
    bne .L_021ff670
    ldr r0, [r5, #0xb44]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_021ff69c
.L_021ff670:
    cmp r0, #0x16
    bne .L_021ff69c
    ldr r0, [r5, #0xb44]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, .L_021ff8a4
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
.L_021ff69c:
    ldr r0, [r5, #0xb44]
    ldr r1, [r0, #0xc]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x6
    bne .L_021ff7e0
    ldrh r0, [r1, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_021ff89c
    mov r1, #0x0
    str r1, [r5, #0xb94]
    ldr r0, [r5, #0xb28]
    cmp r0, #0x0
    bgt .L_021ff780
    sub r0, r1, #0x1
    str r0, [r5, #0xb7c]
    ldr r0, [r5, #0xb44]
    bl func_0209a07c
    ldr r2, [r5, #0x48]
    mov r0, #0x1
    ldr r1, .L_021ff8a8
    ldr r3, [r2, #0x0]
    sub r2, r1, #0x6
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r5, #0xb44]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0xb44]
    mov ip, #0x8
    ldr r3, [r0, #0xc]
    mov r4, #0x7
    ldrh r2, [r3, #0x24]
    ldr r0, .L_021ff8a4
    mov r1, #0x12c
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r3, [r5, #0x48]
    mov r2, #0x1
    ldr r3, [r3, #0xc]
    str ip, [r3, #0x78]
    ldr r3, [r5, #0x48]
    ldr r3, [r3, #0xc]
    str r4, [r3, #0x7c]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    ldr r0, .L_021ff8a4
    mov r1, #0x12c
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    b .L_021ff89c
.L_021ff780:
    ldr r0, [r5, #0xb44]
    bl func_0209a07c
    ldr r2, [r5, #0x48]
    mov r0, #0x2
    ldr r1, .L_021ff8ac
    ldr r3, [r2, #0x0]
    sub r2, r1, #0xe
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0xb44]
    add r3, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r5, #0xb44]
    mov r1, #0x1d
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0xb44]
    mov r0, #0x50
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r5, #0xb9c]
    b .L_021ff89c
.L_021ff7e0:
    ldr r2, [r5, #0xb78]
    add r0, r2, #0x1
    str r0, [r5, #0xb78]
    ldr r1, [r4, #0x8]
    mov r0, r2, asr #0x1
    add r0, r1, r0, lsl #0xc
    str r0, [r4, #0x8]
    ldr r1, [r4, #0x4]
    ldr r0, [r5, #0xb74]
    add r0, r1, r0, lsl #0xc
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0xc0000
    blt .L_021ff87c
    ldr r1, [r5, #0xb94]
    mov r0, #0xc0000
    add r1, r1, #0x1
    str r1, [r5, #0xb94]
    str r0, [r4, #0x8]
    ldr r0, [r5, #0xb74]
    mvn r1, #0x5
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0xb74]
    str r1, [r5, #0xb78]
    ldr r0, [r5, #0xb94]
    cmp r0, #0x19
    bne .L_021ff87c
    ldr r0, [r5, #0xb44]
    mov r1, #0x6
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0xb44]
    mov r0, #0x0
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r5, #0xb78]
.L_021ff87c:
    ldr r0, [r4, #0x4]
    cmp r0, #0xf0000
    movgt r0, #0xf0000
    strgt r0, [r4, #0x4]
    bgt .L_021ff89c
    cmp r0, #0x10000
    movlt r0, #0x10000
    strlt r0, [r4, #0x4]
.L_021ff89c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_021ff8a4: .word gSoundContext
.L_021ff8a8: .word 0x1007
.L_021ff8ac: .word 0x100f
    .size func_ov040_021ff630, . - func_ov040_021ff630
