.text
.extern func_020befec
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a1794
.extern func_020a1ec0
.extern func_ov042_021fcf80
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_ov042_021fda24
.extern func_ov042_022051a8
.extern func_ov071_02211a10
.extern genrand_int32
.extern data_ov042_0220b500
    .global func_ov042_02208aac
func_ov042_02208aac:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x80]
    add r0, r0, #0x1
    str r0, [r5, #0x80]
    ldr r0, [r5, #0x74]
    cmp r0, #0x4
    bgt .L_02208af0
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_02208e18
.L_02208adc: ; jump table
    b .L_02208e18 ; case 0
    b .L_02208afc ; case 1
    b .L_02208b58 ; case 2
    b .L_02208bd0 ; case 3
    b .L_02208d1c ; case 4
.L_02208af0:
    cmp r0, #0x64
    beq .L_02208d64
    b .L_02208e18
.L_02208afc:
    ldr r0, [r5, #0x80]
    add r0, r0, #0x1
    str r0, [r5, #0x80]
    cmp r0, #0x10
    ble .L_02208e18
    ldrb r0, [r5, #0x8a]
    mov r1, #0x3
    bl func_020befec
    ldr r0, [r5, #0x4c]
    mov r1, r1, lsl #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x4c]
    mov r1, #0x2
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    str r1, [r5, #0x74]
    str r0, [r5, #0x80]
    b .L_02208e18
.L_02208b58:
    ldr r0, [r5, #0x70]
    mov r1, #0x0
    add r0, r0, #0xcd
    add r0, r0, #0x400
    str r0, [r5, #0x70]
    ldr r4, [r5, #0x6c]
    mov r0, #0x52
    umull r3, r2, r4, r0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r4, r1
    str r0, [r5, #0x6c]
    add r0, r5, #0x50
    add r1, r5, #0x68
    bl func_ov042_021ff2f8
    ldr r1, [r5, #0x58]
    ldr r0, [r5, #0x64]
    cmp r1, r0
    ble .L_02208e18
    ldr r1, [r5, #0x74]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x74]
    str r0, [r5, #0x80]
    b .L_02208e18
.L_02208bd0:
    ldr r0, [r5, #0x80]
    and r0, r0, #0xf
    cmp r0, #0x1
    bne .L_02208d00
    ldr r0, [r5, #0x84]
    mov r1, #0x3
    cmp r0, #0x0
    bne .L_02208c44
    ldr r0, [r5, #0x48]
    ldr r3, .L_02208fbc
    ldr r0, [r0, #0xc]
    add r2, r5, #0x50
    ldr r0, [r0, #0xa0]
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    add r2, r5, #0x50
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    mov r3, #0x0
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    add r2, r5, #0x50
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    mov r3, #0x3e8
    bl func_ov042_022051a8
    b .L_02208d00
.L_02208c44:
    cmp r0, #0x1
    ldr r0, [r5, #0x48]
    ldr r3, .L_02208fc0
    ldr r0, [r0, #0xc]
    bne .L_02208ca0
    ldr r0, [r0, #0xa0]
    add r2, r5, #0x50
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    add r2, r5, #0x50
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    mov r3, #0x0
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    ldr r3, .L_02208fc4
    ldr r0, [r0, #0xc]
    add r2, r5, #0x50
    ldr r0, [r0, #0xa0]
    mov r1, #0x3
    bl func_ov042_022051a8
    b .L_02208d00
.L_02208ca0:
    ldr r0, [r0, #0xa0]
    add r2, r5, #0x50
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    ldr r3, .L_02208fbc
    ldr r0, [r0, #0xc]
    add r2, r5, #0x50
    ldr r0, [r0, #0xa0]
    mov r1, #0x3
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    add r2, r5, #0x50
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    mov r3, #0x3e8
    bl func_ov042_022051a8
    ldr r0, [r5, #0x48]
    ldr r3, .L_02208fc4
    ldr r0, [r0, #0xc]
    mov r1, #0x3
    ldr r0, [r0, #0xa0]
    add r2, r5, #0x50
    bl func_ov042_022051a8
.L_02208d00:
    ldr r0, [r5, #0x80]
    cmp r0, #0x50
    movgt r0, #0x0
    strgt r0, [r5, #0x80]
    movgt r0, #0x4
    strgt r0, [r5, #0x74]
    b .L_02208e18
.L_02208d1c:
    ldr r0, [r5, #0x80]
    ldr r1, [r5, #0x4c]
    mov r0, r0, lsl #0x2
    rsb r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r5, #0x80]
    cmp r0, #0x3c
    ble .L_02208e18
    ldr r2, [r5, #0x4c]
    mov r0, #0x65
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    str r0, [r5, #0x74]
    b .L_02208e18
.L_02208d64:
    ldrsb r0, [r5, #0x8b]
    cmp r0, #0x0
    ble .L_02208d88
    sub r0, r0, #0x1
    strb r0, [r5, #0x8b]
    ldrsb r0, [r5, #0x8b]
    cmp r0, #0x0
    moveq r0, #0x65
    streq r0, [r5, #0x74]
.L_02208d88:
    ldrsb r0, [r5, #0x8b]
    ldr r1, [r5, #0x4c]
    tst r0, #0x2
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldrsb r0, [r5, #0x8b]
    tst r0, #0x3
    bne .L_02208e18
    add r0, sp, #0x1c
    bl func_ov042_021fcf80
    add r0, sp, #0x1c
    add r1, r5, #0x50
    bl func_ov042_021fda0c
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r1, [sp, #0x20]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x20]
    bl genrand_int32
    and r0, r0, #0x3f
    ldr r1, [sp, #0x24]
    sub r0, r0, #0x20
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x24]
    ldrsb r3, [r5, #0x8b]
    ldr r0, [r5, #0x48]
    mov r1, #0x1
    mov r3, r3, asr #0x3
    ldr r0, [r0, #0x14]
    add r2, sp, #0x1c
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_02208e18:
    add r0, sp, #0x10
    bl func_ov042_021fcf80
    ldr r0, [r5, #0x74]
    cmp r0, #0x0
    add r0, sp, #0x10
    bne .L_02208e50
    ldr r1, [r5, #0x48]
    ldr r1, [r1, #0xc]
    add r1, r1, #0x160
    bl func_ov042_021fda0c
    add r0, sp, #0x10
    add r1, r5, #0x50
    bl func_ov042_021ff2f8
    b .L_02208e58
.L_02208e50:
    add r1, r5, #0x50
    bl func_ov042_021fda0c
.L_02208e58:
    ldr r2, [r5, #0x4c]
    ldr r0, [r5, #0x48]
    add r1, sp, #0x10
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r0, [r5, #0x74]
    cmp r0, #0x2
    blt .L_02208fb4
    cmp r0, #0x4
    bge .L_02208fb4
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    ldr r2, .L_02208fc8
    str r1, [sp, #0x8]
    str r2, [sp, #0x4]
    str r0, [sp, #0xc]
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldr r0, [r5, #0x48]
    add r1, sp, #0x4
    ldr r0, [r0, #0x8]
    mov r2, #0x18000
    ldr r0, [r0, #0xe8]
    bl func_ov071_02211a10
    mov r4, r0
    cmp r4, #0x0
    ble .L_02208f74
    ldrsb r0, [r5, #0x8b]
    cmp r0, #0x0
    bne .L_02208f00
    ldrb r0, [r5, #0x8a]
    mov r1, #0x3
    bl func_020befec
    ldr r2, [r5, #0x4c]
    mov r0, r1, lsl #0x1
    add r1, r0, #0x1
    ldr r0, [r2, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x1e
    strb r0, [r5, #0x8b]
.L_02208f00:
    ldr r0, [r5, #0x7c]
    sub r0, r0, r4
    str r0, [r5, #0x7c]
    cmp r0, #0x0
    bgt .L_02208f74
    ldr r0, [r5, #0x74]
    cmp r0, #0x2
    bge .L_02208f34
    ldr r1, [r5, #0x48]
    add r0, r5, #0x50
    ldr r1, [r1, #0xc]
    add r1, r1, #0x160
    bl func_ov042_021ff2f8
.L_02208f34:
    mov r0, #0x64
    str r0, [r5, #0x74]
    mov r0, #0x28
    strb r0, [r5, #0x8b]
    ldr r0, [r5, #0x4c]
    mov r1, #0x6
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x4c]
    ldr r1, .L_02208fcc
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x48]
    bl func_020a1ec0
.L_02208f74:
    ldrsb r0, [r5, #0x8b]
    cmp r0, #0x0
    ble .L_02208fb4
    sub r0, r0, #0x1
    strb r0, [r5, #0x8b]
    ldrsb r0, [r5, #0x8b]
    cmp r0, #0x0
    bne .L_02208fb4
    ldrb r0, [r5, #0x8a]
    mov r1, #0x3
    bl func_020befec
    ldr r0, [r5, #0x4c]
    mov r1, r1, lsl #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02208fb4:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
.L_02208fbc: .word 0xfc18
.L_02208fc0: .word 0xf448
.L_02208fc4: .word 0xbb8
.L_02208fc8: .word data_ov042_0220b500
.L_02208fcc: .word 0xb484
.size func_ov042_02208aac, . - func_ov042_02208aac

