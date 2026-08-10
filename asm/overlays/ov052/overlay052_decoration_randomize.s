.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_ov052_0220e1e4
.extern data_ov052_0220e1e8
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020bf1f8
.extern genrand_int32

.global func_ov052_0220df9c
func_ov052_0220df9c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0220dfcc
    mov r0, #0xc8
    str r0, [r4, #0x24]
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220e05c
    ldr r0, [r4, #0x18]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0220e048
.L_0220dfcc:
    ldr r0, [r4, #0x24]
    subs r0, r0, #0x1
    str r0, [r4, #0x24]
    bpl .L_0220e048
    ldr r1, [r4, #0x18]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    cmp r1, #0x5
    bne .L_0220e020
    mov r0, #0xc8
    str r0, [r4, #0x24]
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220e05c
    ldr r0, [r4, #0x18]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0220e048
.L_0220e020:
    bl genrand_int32
    and r1, r0, #0x7
    mov r0, #0x1e
    smulbb r0, r1, r0
    str r0, [r4, #0x24]
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220e060
    ldr r0, [r4, #0x18]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
.L_0220e048:
    ldr r1, [r4, #0x18]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0220e05c: .word data_ov052_0220e1e4
.L_0220e060: .word data_ov052_0220e1e8
.size func_ov052_0220df9c, . - func_ov052_0220df9c
