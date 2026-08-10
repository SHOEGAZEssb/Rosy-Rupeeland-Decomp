.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern DebugText_BeginFrame
.extern data_ov068_022107c0
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740a4
.extern func_020befec
.extern func_020bf1f8
.extern gSystemState
.extern genrand_int32

.global func_ov068_022101d8
func_ov068_022101d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, r0
    mov r1, #0x0
    ldr r0, .L_02210710
    strh r1, [r4, #0x58]
    ldrh r0, [r0, #0x4]
    tst r0, #0x40
    subne r0, r1, #0x1
    strneh r0, [r4, #0x5c]
    bne .L_02210210
    tst r0, #0x80
    movne r0, #0x1
    strneh r0, [r4, #0x5c]
    streqh r1, [r4, #0x5c]
.L_02210210:
    ldr r0, .L_02210710
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    mvnne r0, #0x0
    strneh r0, [r4, #0x5a]
    bne .L_0221023c
    tst r0, #0x10
    movne r0, #0x1
    strneh r0, [r4, #0x5a]
    moveq r0, #0x0
    streqh r0, [r4, #0x5a]
.L_0221023c:
    ldr r0, .L_02210710
    ldrh r0, [r0, #0x6]
    tst r0, #0x2
    beq .L_0221026c
    cmp r4, #0x0
    beq .L_02210264
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210264:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221026c:
    ldr r0, [r4, #0x54]
    mov r1, #0x28
    bl func_020befec
    cmp r1, #0x9
    bgt .L_02210294
    bge .L_022102b8
    cmp r1, #0x0
    moveq r0, #0x1
    streqh r0, [r4, #0x58]
    b .L_022102c0
.L_02210294:
    cmp r1, #0x13
    bgt .L_022102a8
    moveq r0, #0x3
    streqh r0, [r4, #0x58]
    b .L_022102c0
.L_022102a8:
    cmp r1, #0x1d
    moveq r0, #0x4
    streqh r0, [r4, #0x58]
    b .L_022102c0
.L_022102b8:
    mov r0, #0x2
    strh r0, [r4, #0x58]
.L_022102c0:
    ldrsh r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_0221038c
    bl genrand_int32
    mov r1, #0x30
    bl func_020bf1f8
    ldrsh r0, [r4, #0x58]
    rsb r1, r1, #0x18
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x100
    strh r1, [r0, #0x5e]
    bl genrand_int32
    mov r1, #0x30
    bl func_020bf1f8
    ldrsh r0, [r4, #0x58]
    rsb r1, r1, #0x18
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x100
    strh r1, [r0, #0x60]
    ldrsh r5, [r4, #0x58]
    ldr r6, [r4, #0x28]
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    add r1, r1, #0x8
    ldr r0, [r6, r5, lsl #0x2]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    bl genrand_int32
    tst r0, #0x1
    ldrsh r0, [r4, #0x58]
    ldrne r1, [r4, #0x28]
    ldrne r1, [r1, r0, lsl #0x2]
    ldrneh r0, [r1, #0x24]
    ldreq r1, [r4, #0x28]
    orrne r0, r0, #0x40
    ldreq r1, [r1, r0, lsl #0x2]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x40
    strh r0, [r1, #0x24]
    bl genrand_int32
    tst r0, #0x1
    ldrsh r0, [r4, #0x58]
    ldrne r1, [r4, #0x28]
    movne r2, #0xc7
    ldrne r0, [r1, r0, lsl #0x2]
    strneh r2, [r0, #0x28]
    ldreq r1, [r4, #0x28]
    moveq r2, #0xc9
    ldreq r0, [r1, r0, lsl #0x2]
    streqh r2, [r0, #0x28]
.L_0221038c:
    ldr r1, [r4, #0x28]
    ldr r0, [r4, #0x54]
    ldr r2, [r1, #0x0]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1a
    add r0, r1, r0, ror #0x1a
    ldrsh r1, [r2, #0x2c]
    add r0, r4, r0, lsl #0x2
    add r2, r4, #0x100
    strh r1, [r0, #0x5e]
    ldr r1, [r4, #0x28]
    ldr r0, [r4, #0x54]
    ldr r3, [r1, #0x0]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1a
    add r0, r1, r0, ror #0x1a
    ldrsh r1, [r3, #0x2e]
    add r0, r4, r0, lsl #0x2
    strh r1, [r0, #0x60]
    ldr r0, [r4, #0x28]
    ldrsh r1, [r4, #0x5a]
    ldr r6, [r0, #0x0]
    ldrsh r5, [r4, #0x5c]
    ldrsh r0, [r6, #0x2c]
    ldrsh r3, [r6, #0x2e]
    add r0, r1, r0
    strh r0, [r6, #0x2c]
    add r0, r5, r3
    strh r0, [r6, #0x2e]
    ldr r0, [r4, #0x54]
    ldr r5, [r4, #0x28]
    sub r0, r0, #0x5
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1a
    add r0, r1, r0, ror #0x1a
    add r0, r4, r0, lsl #0x2
    ldrsh r3, [r2, #0x62]
    ldrsh r1, [r0, #0x5e]
    ldrsh r7, [r2, #0x64]
    ldrsh r6, [r0, #0x60]
    ldr r5, [r5, #0x4]
    add r1, r3, r1
    strh r1, [r5, #0x2c]
    add r1, r7, r6
    strh r1, [r5, #0x2e]
    ldr r5, [r4, #0x28]
    ldrsh r3, [r2, #0x66]
    ldrsh r1, [r0, #0x5e]
    ldrsh r7, [r2, #0x68]
    ldrsh r6, [r0, #0x60]
    ldr r5, [r5, #0x8]
    add r1, r3, r1
    strh r1, [r5, #0x2c]
    add r1, r7, r6
    strh r1, [r5, #0x2e]
    ldr r5, [r4, #0x28]
    ldrsh r3, [r2, #0x6a]
    ldrsh r1, [r0, #0x5e]
    ldrsh r7, [r2, #0x6c]
    ldrsh r6, [r0, #0x60]
    ldr r5, [r5, #0xc]
    add r1, r3, r1
    strh r1, [r5, #0x2c]
    add r1, r7, r6
    strh r1, [r5, #0x2e]
    ldr r3, [r4, #0x28]
    ldrsh r6, [r2, #0x70]
    ldrsh r5, [r0, #0x60]
    ldrsh r2, [r2, #0x6e]
    ldrsh r1, [r0, #0x5e]
    add r0, r6, r5
    mov r0, r0, lsl #0x10
    ldr r3, [r3, #0x10]
    add r1, r2, r1
    strh r1, [r3, #0x2c]
    mov r0, r0, asr #0x10
    strh r0, [r3, #0x2e]
    ldr r0, [r4, #0x54]
    ldr r2, [r4, #0x28]
    sub r0, r0, #0x14
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1a
    add r0, r1, r0, ror #0x1a
    add r0, r4, r0, lsl #0x2
    ldrsh r3, [r0, #0x60]
    ldrsh r1, [r0, #0x5e]
    ldr r2, [r2, #0x14]
    ldr r0, .L_02210714
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r1, [r4, #0x54]
    ldr r3, [r4, #0x28]
    sub r1, r1, #0x1c
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1a
    add r1, r2, r1, ror #0x1a
    add r1, r4, r1, lsl #0x2
    ldrsh r5, [r1, #0x60]
    ldrsh r1, [r1, #0x5e]
    ldr r2, [r3, #0x18]
    mov r9, #0x8
    strh r1, [r2, #0x2c]
    strh r5, [r2, #0x2e]
    ldr r1, [r4, #0x54]
    ldr r3, [r4, #0x28]
    sub r1, r1, #0x22
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1a
    add r1, r2, r1, ror #0x1a
    add r1, r4, r1, lsl #0x2
    ldrsh r5, [r1, #0x60]
    ldr r2, [r3, #0x1c]
    ldrsh r1, [r1, #0x5e]
    mov r8, #0xdb
    mov r7, #0xff
    strh r1, [r2, #0x2c]
    strh r5, [r2, #0x2e]
    strh r9, [r0, #0x0]
    strh r8, [r0, #0x14]
    strh r7, [r0, #0x28]
    mov r6, #0xcf
    strh r6, [r0, #0x3c]
    mov r5, #0x1b
    strh r5, [r0, #0x2]
    mov lr, #0xe7
    strh lr, [r0, #0x16]
    strh r7, [r0, #0x2a]
    mov ip, #0xbf
    strh ip, [r0, #0x3e]
    mov r3, #0x3b
    strh r3, [r0, #0x4]
    mov r2, #0xef
    strh r2, [r0, #0x18]
    strh r7, [r0, #0x2c]
    mov r1, #0xaf
    strh r1, [r0, #0x40]
    mov r11, #0x57
    strh r11, [r0, #0x6]
    mov r10, #0xf7
    strh r10, [r0, #0x1a]
    strh r7, [r0, #0x2e]
    mov r10, #0x9b
    strh r10, [r0, #0x42]
    mov r10, #0x6f
    strh r10, [r0, #0x8]
    mov r10, #0xfb
    strh r10, [r0, #0x1c]
    strh r7, [r0, #0x30]
    mov r10, #0x87
    strh r10, [r0, #0x44]
    strh r10, [r0, #0xa]
    strh r7, [r0, #0x1e]
    mov r10, #0xfb
    strh r10, [r0, #0x32]
    mov r10, #0x6f
    strh r10, [r0, #0x46]
    mov r10, #0x9b
    strh r10, [r0, #0xc]
    strh r7, [r0, #0x20]
    mov r10, #0xf7
    strh r10, [r0, #0x34]
    strh r11, [r0, #0x48]
    strh r1, [r0, #0xe]
    strh r7, [r0, #0x22]
    strh r2, [r0, #0x36]
    strh r3, [r0, #0x4a]
    strh ip, [r0, #0x10]
    strh r7, [r0, #0x24]
    strh lr, [r0, #0x38]
    strh r5, [r0, #0x4c]
    strh r6, [r0, #0x12]
    strh r7, [r0, #0x26]
    strh r8, [r0, #0x3a]
    strh r9, [r0, #0x4e]
    ldr r0, [r4, #0x54]
    mov r1, #0x28
    bl func_020befec
    mov r2, r1, lsl #0x1
    ldr r1, .L_02210718
    ldr r0, [r4, #0x28]
    ldrsh r2, [r1, r2]
    ldr r0, [r0, #0x4]
    mov r1, #0x28
    strh r2, [r0, #0x32]
    strh r2, [r0, #0x34]
    ldr r0, [r4, #0x54]
    add r0, r0, #0x9
    bl func_020befec
    mov r2, r1, lsl #0x1
    ldr r1, .L_02210718
    ldr r0, [r4, #0x28]
    ldrsh r2, [r1, r2]
    ldr r0, [r0, #0x8]
    mov r1, #0x28
    strh r2, [r0, #0x32]
    strh r2, [r0, #0x34]
    ldr r0, [r4, #0x54]
    add r0, r0, #0x13
    bl func_020befec
    mov r2, r1, lsl #0x1
    ldr r1, .L_02210718
    ldr r0, [r4, #0x28]
    ldrsh r2, [r1, r2]
    ldr r0, [r0, #0xc]
    mov r1, #0x28
    strh r2, [r0, #0x32]
    strh r2, [r0, #0x34]
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1d
    bl func_020befec
    ldr r0, [r4, #0x28]
    ldr r2, .L_02210718
    mov r1, r1, lsl #0x1
    ldrsh r1, [r2, r1]
    ldr r0, [r0, #0x10]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    ldr r0, [r4, #0x24]
    bl func_020740a4
    bl DebugText_BeginFrame
    ldr r1, [r4, #0x54]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210710: .word gSystemState
.L_02210714: .word data_ov068_022107c0
.L_02210718: .word data_ov068_022107c0
.size func_ov068_022101d8, . - func_ov068_022101d8
