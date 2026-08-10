.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern func_02059278
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a29ac
.extern func_020befec
.extern func_ov041_021fff80
.extern func_ov041_02200348
.extern func_ov070_02210218
.extern func_ov070_0221187c
.extern gSoundContext
.extern gSystemState

.global func_ov070_022118b4
func_ov070_022118b4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    mov r4, r0
    add r0, r4, #0x100
    ldrh r1, [r0, #0x40]
    cmp r1, #0x0
    bne .L_02211990
    ldr r0, [r4, #0x144]
    cmp r0, #0x0
    bne .L_0221190c
    ldr r0, [r4, #0x6c]
    mov r1, #0x8
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x6c]
    mov r0, #0x0
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    str r0, [r4, #0x100]
    str r0, [r4, #0x11c]
.L_0221190c:
    ldr r0, [r4, #0x64]
    mov r1, #0x28
    sub r0, r0, #0xc0000
    bl func_020befec
    cmp r0, #0x4000
    ldr r2, [r4, #0x64]
    movgt r0, #0x4000
    sub r2, r2, r0
    mov r1, #0xc0
    mul r0, r2, r1
    ldr r1, .L_02211db8
    str r2, [r4, #0x64]
    bl func_020befec
    sub r0, r0, #0x46000
    str r0, [r4, #0xd8]
    ldr r0, [r4, #0x144]
    add r0, r0, #0x1
    str r0, [r4, #0x144]
    cmp r0, #0x21c
    ble .L_02211cf4
    mov r0, #0x0
    str r0, [r4, #0x144]
    add r0, r4, #0x100
    ldrh r2, [r0, #0x40]
    mov r1, #0x9
    add r2, r2, #0x1
    strh r2, [r0, #0x40]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r4, #0xf0]
    b .L_02211cf4
.L_02211990:
    cmp r1, #0x1
    bne .L_022119e8
    ldr r1, [r4, #0x144]
    add r1, r1, #0x1
    str r1, [r4, #0x144]
    cmp r1, #0x96
    ble .L_02211cf4
    mov r1, #0x0
    str r1, [r4, #0x144]
    ldrh r2, [r0, #0x40]
    mov r1, #0xa
    add r2, r2, #0x1
    strh r2, [r0, #0x40]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, .L_02211dbc
    mov r1, #0x17
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    b .L_02211cf4
.L_022119e8:
    cmp r1, #0x2
    bne .L_02211a3c
    ldr r1, [r4, #0x144]
    add r1, r1, #0x1
    str r1, [r4, #0x144]
    cmp r1, #0xa
    ble .L_02211a28
    mov r1, #0x0
    str r1, [r4, #0x144]
    ldrh r2, [r0, #0x40]
    mov r1, #0xb
    add r2, r2, #0x1
    strh r2, [r0, #0x40]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
.L_02211a28:
    ldr r0, [r4, #0x100]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r4, #0x100]
    b .L_02211cf4
.L_02211a3c:
    cmp r1, #0x3
    bne .L_02211c64
    ldr r0, .L_02211dc0
    mov r1, #0xb
    ldrh r0, [r0, #0x1a]
    tst r0, #0x20
    ldrne r2, [r4, #0xec]
    ldrne r0, [r4, #0xfc]
    movne r1, #0xc
    subne r0, r2, r0
    strne r0, [r4, #0xec]
    ldr r0, .L_02211dc0
    ldrh r0, [r0, #0x1a]
    tst r0, #0x10
    ldrne r2, [r4, #0xec]
    ldrne r0, [r4, #0xfc]
    movne r1, #0xd
    addne r0, r2, r0
    strne r0, [r4, #0xec]
    ldr r0, .L_02211dc0
    ldrh r0, [r0, #0x1a]
    tst r0, #0x40
    ldrne r0, [r4, #0xf0]
    movne r1, #0xe
    subne r0, r0, #0xcd
    subne r0, r0, #0x400
    strne r0, [r4, #0xf0]
    ldr r0, .L_02211dc0
    ldrh r0, [r0, #0x1a]
    tst r0, #0x80
    ldrne r0, [r4, #0xf0]
    addne r0, r0, #0x66
    addne r0, r0, #0x200
    strne r0, [r4, #0xf0]
    ldr r0, [r4, #0xf0]
    sub r0, r0, #0x7b
    str r0, [r4, #0xf0]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    ldrb r2, [r0, #0x38]
    cmp r2, r1
    beq .L_02211aec
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02211aec:
    ldr r2, [r4, #0xec]
    ldr r0, .L_02211dc4
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0xec]
    ldr r2, [r4, #0xf0]
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adds ip, ip, #0x800
    adc r0, r3, #0x0
    mov r2, ip, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r4, #0xf0]
    ldr r2, [r4, #0xd4]
    ldr r0, [r4, #0xec]
    adds r0, r2, r0
    strmi r1, [r4, #0xd4]
    strmi r1, [r4, #0xec]
    cmp r0, #0x100000
    movgt r0, #0x100000
    strgt r0, [r4, #0xd4]
    movgt r0, #0x0
    strgt r0, [r4, #0xec]
    mov r0, #0xb6000
    ldr r2, [r4, #0xd8]
    ldr r1, [r4, #0xf0]
    rsb r0, r0, #0x0
    add r1, r2, r1
    cmp r1, r0
    strlt r0, [r4, #0xd8]
    movlt r0, #0x0
    strlt r0, [r4, #0xf0]
    mov r0, #0x14000
    rsb r0, r0, #0x0
    cmp r1, r0
    strgt r0, [r4, #0xd8]
    movgt r0, #0x0
    strgt r0, [r4, #0xf0]
    ldr r0, [r4, #0x100]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r4, #0x100]
    cmp r0, #0x5800
    movgt r0, #0x5800
    strgt r0, [r4, #0x100]
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x100]
    add r0, r1, r0
    str r0, [r4, #0x64]
    ldr r0, [r4, #0x100]
    cmp r0, #0x3000
    ble .L_02211c2c
    ldr r0, [r4, #0x12c]
    tst r0, #0x3
    bne .L_02211c2c
    add r0, sp, #0x1c
    bl func_ov070_02210218
    ldr r2, [r4, #0xd4]
    mov r1, #0x0
    str r2, [sp, #0x20]
    ldr r0, [r4, #0x48]
    ldr r3, [r4, #0xd8]
    ldr r0, [r0, #0x194]
    mov r2, r2, asr #0xc
    add r0, r3, r0
    add r3, r0, #0xc000
    str r3, [sp, #0x24]
    ldr r0, [r4, #0x48]
    mov r3, r3, asr #0xc
    ldr r0, [r0, #0x18]
    bl func_020a29ac
.L_02211c2c:
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x10]
    bl func_ov041_021fff80
    cmp r0, #0x1
    bne .L_02211cf4
    add r0, r4, #0x100
    ldrh r2, [r0, #0x40]
    mov r1, #0xb
    add r2, r2, #0x1
    strh r2, [r0, #0x40]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02211cf4
.L_02211c64:
    cmp r1, #0x4
    bne .L_02211cf4
    ldr r2, [r4, #0xec]
    ldr r0, .L_02211dc4
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, ip, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0xec]
    ldr r0, [r4, #0xf0]
    add r0, r0, #0x1f
    add r0, r0, #0x100
    str r0, [r4, #0xf0]
    cmp r0, #0x8000
    movgt r0, #0x8000
    strgt r0, [r4, #0xf0]
    ldr r0, [r4, #0x100]
    sub r0, r0, #0x9a
    subs r0, r0, #0x100
    str r0, [r4, #0x100]
    movmi r0, #0x0
    strmi r0, [r4, #0x100]
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x100]
    add r0, r1, r0
    str r0, [r4, #0x64]
    ldr r1, [r4, #0x48]
    ldr r0, [r1, #0x1cc]
    cmp r0, #0x3
    movlt r0, #0x3
    strlt r0, [r1, #0x1cc]
.L_02211cf4:
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0xec]
    add r0, sp, #0x10
    add r1, r2, r1
    str r1, [r4, #0xd4]
    ldr r3, [r4, #0xd8]
    ldr r2, [r4, #0xf0]
    add r1, r4, #0xd0
    add r2, r3, r2
    str r2, [r4, #0xd8]
    bl func_ov070_0221187c
    ldr r0, [r4, #0x48]
    ldr r2, [sp, #0x18]
    ldr r0, [r0, #0x194]
    add r1, sp, #0x10
    add r0, r2, r0
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x10]
    bl func_ov041_02200348
    ldr r1, [r4, #0x48]
    ldr r2, .L_02211dc8
    add r0, sp, #0x0
    str r2, [r1, #0x1ac]
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0x6c]
    str r2, [r1, #0x30]
    ldr r2, [r4, #0xd8]
    ldr r1, [r4, #0x6c]
    add r2, r2, #0x12000
    str r2, [r1, #0x34]
    ldr r2, [r4, #0x6c]
    ldrh r1, [r2, #0x42]
    bic r1, r1, #0x4
    strh r1, [r2, #0x42]
    bl func_02004fe0
    ldr r0, [r4, #0x60]
    add r1, sp, #0x0
    sub r0, r0, #0x80000
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x64]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x48]
    add r0, r0, #0x19c
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
.L_02211db8: .word 0x5dc
.L_02211dbc: .word gSoundContext
.L_02211dc0: .word gSystemState
.L_02211dc4: .word 0xe8f
.L_02211dc8: .word 0x4cd
.size func_ov070_022118b4, . - func_ov070_022118b4
