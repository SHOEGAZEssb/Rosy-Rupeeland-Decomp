.text
.extern genrand_int32
.extern func_020adc40
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a1794
.extern func_020a1ec0
.extern func_ov042_021fcf80
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_ov042_02203658
.extern func_ov042_021fda24
.extern func_ov042_022051a8
.extern func_ov042_021fe41c
.extern func_ov042_02209944
.extern func_ov042_02200afc
.extern func_ov071_02211a10
.extern gFx32CosSinTable
.extern data_ov042_0220b6e4
.extern data_ov042_0220b6e8
    .global func_ov042_02209360
func_ov042_02209360:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x40
    mov r8, r0
    ldr r0, [r8, #0x84]
    add r0, r0, #0x1
    str r0, [r8, #0x84]
    ldr r0, [r8, #0x78]
    cmp r0, #0x5
    bgt .L_022093a8
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_022097b4
.L_02209390: ; jump table
    b .L_022097b4 ; case 0
    b .L_022097b4 ; case 1
    b .L_022093b4 ; case 2
    b .L_022094b0 ; case 3
    b .L_02209524 ; case 4
    b .L_02209628 ; case 5
.L_022093a8:
    cmp r0, #0x64
    beq .L_02209700
    b .L_022097b4
.L_022093b4:
    ldr r3, [r8, #0x64]
    ldr r2, [r8, #0x58]
    ldr r1, [r8, #0x60]
    ldr r0, [r8, #0x54]
    sub r4, r3, r2
    sub r1, r1, r0
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    ldr r5, [r8, #0x6c]
    mov r1, #0x52
    umull r0, r3, r5, r1
    mov r2, #0x0
    adds r4, r0, #0x800
    mla r3, r5, r2, r3
    mov r0, r5, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r3, r4, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    sub r0, r5, r3
    str r0, [r8, #0x6c]
    ldr r5, [r8, #0x70]
    add r0, r8, #0x50
    umull r4, r3, r5, r1
    mla r3, r5, r2, r3
    adds r2, r4, #0x800
    mov r4, r2, lsr #0xc
    mov r2, r5, asr #0x1f
    mla r3, r2, r1, r3
    adc r1, r3, #0x0
    orr r4, r4, r1, lsl #0x14
    sub r1, r5, r4
    str r1, [r8, #0x70]
    add r1, r8, #0x68
    bl func_ov042_021ff2f8
    ldr r1, [r8, #0x58]
    ldr r0, [r8, #0x64]
    cmp r1, r0
    ble .L_022097b4
    add r0, r8, #0x50
    add r1, r8, #0x5c
    bl func_ov042_021fda0c
    ldr r0, [r8, #0x78]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r8, #0x78]
    str r2, [r8, #0x84]
    ldr r1, [r8, #0x60]
    ldr r0, [r8, #0x74]
    sub r0, r1, r0
    str r0, [r8, #0x6c]
    str r2, [r8, #0x70]
    b .L_022097b4
.L_022094b0:
    ldr r1, [r8, #0x70]
    ldr r0, .L_02209930
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r8, #0x6c]
    ldr r3, [r8, #0x74]
    add r0, r0, #0x1000
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    smull r2, r1, r0, r1
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r8, #0x60]
    ldr r1, [r8, #0x70]
    mov r0, #0x0
    add r1, r1, #0x190
    str r1, [r8, #0x70]
    str r0, [r8, #0x84]
    ldr r0, [r8, #0x70]
    cmp r0, #0x8000
    ldrgt r0, [r8, #0x78]
    addgt r0, r0, #0x1
    strgt r0, [r8, #0x78]
.L_02209524:
    ldrh r0, [r8, #0x8c]
    add r0, r0, #0xfa
    strh r0, [r8, #0x8c]
    ldr r0, [r8, #0x84]
    ldrh r1, [r8, #0x8c]
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r1, r1, asr #0x4
    ldr r0, .L_02209930
    mov r1, r1, lsl #0x2
    cmp r3, #0x31
    ldrsh r0, [r0, r1]
    ldr r2, [r8, #0x60]
    movgt r3, #0x31
    mla r0, r3, r0, r2
    str r0, [r8, #0x54]
    ldr r0, [r8, #0x88]
    add r1, r0, #0x1
    and r0, r1, #0x7
    str r1, [r8, #0x88]
    cmp r0, #0x1
    bne .L_022095c0
    add r0, sp, #0x34
    add r1, r8, #0x50
    bl func_ov042_02203658
    ldr r0, [sp, #0x3c]
    add r2, sp, #0x34
    add r0, r0, #0x20000
    str r0, [sp, #0x3c]
    ldr r0, [r8, #0x48]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    mov r3, #0x0
    ldr r0, [r0, #0xa0]
    bl func_ov042_022051a8
    ldr r0, [r8, #0x48]
    add r1, sp, #0x34
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe41c
.L_022095c0:
    ldr r0, [r8, #0x84]
    cmp r0, #0x190
    ble .L_02209610
    mov r0, #0x5
    str r0, [r8, #0x78]
    ldr r1, [r8, #0x48]
    add r0, r8, #0x50
    ldr r1, [r1, #0xc]
    add r1, r1, #0xa4
    bl func_ov042_02209944
    ldrb r2, [r8, #0x8e]
    ldr r1, .L_02209934
    ldr r0, .L_02209938
    ldr r1, [r1, r2, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r8, #0x60]
    ldrb r1, [r8, #0x8e]
    ldr r0, [r0, r1, lsl #0x3]
    mov r0, r0, lsl #0xc
    str r0, [r8, #0x64]
.L_02209610:
    ldr r0, [r8, #0x48]
    ldr r1, [r0, #0xc]
    ldr r0, [r1, #0x1ec]
    add r0, r0, #0x1
    str r0, [r1, #0x1ec]
    b .L_022097b4
.L_02209628:
    ldr r1, [r8, #0x64]
    ldr r0, [r8, #0x58]
    ldr r3, [r8, #0x60]
    sub r7, r1, r0
    ldr r2, [r8, #0x54]
    smull r1, r0, r7, r7
    sub r5, r3, r2
    smull r3, r2, r5, r5
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    mov r6, r7, asr #0x1f
    mov r4, r5, asr #0x1f
    bl func_020adc40
    ldr r0, .L_0220993c
    mov r1, #0x0
    umull lr, ip, r5, r0
    mla ip, r5, r1, ip
    umull r3, r2, r7, r0
    mla ip, r4, r0, ip
    adds r5, lr, #0x800
    adc r4, ip, #0x0
    mov r5, r5, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    str r5, [r8, #0x6c]
    mla r2, r7, r1, r2
    mla r2, r6, r0, r2
    adds r1, r3, #0x800
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r1, r1, #0x1000
    add r0, r8, #0x50
    str r1, [r8, #0x70]
    add r1, r8, #0x68
    bl func_ov042_021ff2f8
    cmp r7, #0x0
    blt .L_022097b4
    add r0, r8, #0x50
    add r1, r8, #0x5c
    bl func_ov042_021fda0c
    ldr r0, [r8, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r8, #0x78]
    b .L_022097b4
.L_02209700:
    ldrsb r0, [r8, #0x8f]
    cmp r0, #0x0
    ble .L_02209724
    sub r0, r0, #0x1
    strb r0, [r8, #0x8f]
    ldrsb r0, [r8, #0x8f]
    cmp r0, #0x0
    moveq r0, #0x65
    streq r0, [r8, #0x78]
.L_02209724:
    ldrsb r0, [r8, #0x8f]
    ldr r1, [r8, #0x4c]
    tst r0, #0x2
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldrsb r0, [r8, #0x8f]
    tst r0, #0x3
    bne .L_022097b4
    add r0, sp, #0x28
    bl func_ov042_021fcf80
    add r0, sp, #0x28
    add r1, r8, #0x50
    bl func_ov042_021fda0c
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r1, [sp, #0x2c]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x2c]
    bl genrand_int32
    and r0, r0, #0x3f
    ldr r1, [sp, #0x30]
    sub r0, r0, #0x20
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x30]
    ldrsb r3, [r8, #0x8f]
    ldr r0, [r8, #0x48]
    mov r1, #0x1
    mov r3, r3, asr #0x3
    ldr r0, [r0, #0x14]
    add r2, sp, #0x28
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_022097b4:
    add r0, sp, #0x1c
    bl func_ov042_021fcf80
    add r0, sp, #0x1c
    add r1, r8, #0x50
    bl func_ov042_021fda0c
    ldr r0, [r8, #0x78]
    cmp r0, #0x0
    cmpne r0, #0x5
    bne .L_022097f4
    ldr r1, [r8, #0x48]
    add r0, sp, #0x10
    ldr r1, [r1, #0xc]
    bl func_ov042_02200afc
    add r0, sp, #0x1c
    add r1, sp, #0x10
    bl func_ov042_021ff2f8
.L_022097f4:
    ldr r2, [r8, #0x4c]
    ldr r0, [r8, #0x48]
    add r1, sp, #0x1c
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r0, [r8, #0x78]
    cmp r0, #0x64
    bge .L_02209928
    cmp r0, #0x2
    blt .L_02209928
    cmp r0, #0x5
    beq .L_02209928
    add r0, sp, #0x4
    add r1, sp, #0x1c
    bl func_ov042_02203658
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldr r0, [r8, #0x48]
    add r1, sp, #0x4
    ldr r0, [r0, #0x8]
    mov r2, #0x18000
    ldr r0, [r0, #0xe8]
    bl func_ov071_02211a10
    mov r4, r0
    cmp r4, #0x0
    ble .L_022098f8
    ldrsb r0, [r8, #0x8f]
    cmp r0, #0x0
    bne .L_02209884
    ldr r0, [r8, #0x4c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x1e
    strb r0, [r8, #0x8f]
.L_02209884:
    ldr r0, [r8, #0x80]
    sub r0, r0, r4
    str r0, [r8, #0x80]
    cmp r0, #0x0
    bgt .L_022098f8
    mov r0, #0x5
    str r0, [r8, #0x78]
    ldr r1, [r8, #0x48]
    add r0, r8, #0x50
    ldr r1, [r1, #0xc]
    add r1, r1, #0xa4
    bl func_ov042_02209944
    ldrb r2, [r8, #0x8e]
    ldr r1, .L_02209934
    ldr r0, .L_02209938
    ldr r2, [r1, r2, lsl #0x3]
    mov r1, #0x3
    mov r2, r2, lsl #0xc
    str r2, [r8, #0x60]
    ldrb r2, [r8, #0x8e]
    ldr r0, [r0, r2, lsl #0x3]
    mov r0, r0, lsl #0xc
    str r0, [r8, #0x64]
    ldr r0, [r8, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r8, #0x48]
    ldr r1, .L_02209940
    bl func_020a1ec0
.L_022098f8:
    ldrsb r0, [r8, #0x8f]
    cmp r0, #0x0
    ble .L_02209928
    sub r0, r0, #0x1
    strb r0, [r8, #0x8f]
    ldrsb r0, [r8, #0x8f]
    cmp r0, #0x0
    bne .L_02209928
    ldr r0, [r8, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
.L_02209928:
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02209930: .word gFx32CosSinTable
.L_02209934: .word data_ov042_0220b6e4
.L_02209938: .word data_ov042_0220b6e8
.L_0220993c: .word 0x11f
.L_02209940: .word 0xeb86
.size func_ov042_02209360, . - func_ov042_02209360

