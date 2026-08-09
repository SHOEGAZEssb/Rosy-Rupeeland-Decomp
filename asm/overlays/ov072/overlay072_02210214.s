.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern DebugText_BeginFrame
.extern Sound_Play
.extern data_020c9670
.extern data_021052fc
.extern func_02005a00
.extern func_02005afc
.extern func_0205974c
.extern func_020597fc
.extern func_02072b68
.extern func_020befec
.extern func_ov072_02210818
.extern func_ov072_022108e8
.extern gSoundContext

.global func_ov072_02210214
func_ov072_02210214:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    bl DebugText_BeginFrame
    ldr r0, .L_022107c8
    ldr r1, [r10, #0x8]
    ldr r0, [r0, #0x0]
    cmp r1, #0x14
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    bgt .L_02210294
    cmp r1, #0x14
    bge .L_02210588
    cmp r1, #0xa
    bgt .L_02210278
    bge .L_022104e8
    cmp r1, #0x2
    bgt .L_02210708
    cmp r1, #0x0
    blt .L_02210708
    beq .L_022102d8
    cmp r1, #0x1
    beq .L_02210320
    cmp r1, #0x2
    beq .L_02210398
    b .L_02210708
.L_02210278:
    cmp r1, #0xb
    bgt .L_02210288
    beq .L_022104f0
    b .L_02210708
.L_02210288:
    cmp r1, #0xf
    beq .L_02210568
    b .L_02210708
.L_02210294:
    cmp r1, #0x1f
    bgt .L_022102bc
    bge .L_02210628
    cmp r1, #0x15
    bgt .L_022102b0
    beq .L_022105ec
    b .L_02210708
.L_022102b0:
    cmp r1, #0x1e
    beq .L_02210588
    b .L_02210708
.L_022102bc:
    cmp r1, #0x32
    bgt .L_022102cc
    beq .L_02210660
    b .L_02210708
.L_022102cc:
    cmp r1, #0x63
    beq .L_022106b0
    b .L_02210708
.L_022102d8:
    add r0, r1, #0x1
    str r0, [r10, #0x8]
    ldr r2, [r4, #0x54]
    mov r1, #0x1
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r10, #0x2c]
    bl func_02072b68
    ldr r5, [r10, #0x2c]
    ldr r0, .L_022107cc
    ldrh r3, [r5, #0x24]
    mov r1, #0x0
    mov r2, #0x3f
    bic r3, r3, #0x6
    strh r3, [r5, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
.L_02210320:
    ldr r0, [r10, #0x2c]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210708
    ldr r0, [r10, #0x8]
    mov r1, #0x0
    add r0, r0, #0x1
    str r0, [r10, #0x8]
    ldr r0, [r10, #0x2c]
    bl func_02072b68
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r0, [r10, #0x74]
    cmp r0, #0x0
    ldr r0, .L_022107cc
    moveq r2, #0x68
    movne r2, #0x13
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    b .L_02210708
.L_02210398:
    ldr r5, [r10, #0x70]
    mov r1, #0x28
    mov r0, r5
    bl func_020befec
    cmp r1, #0x0
    bne .L_02210400
    ldr r6, [r10, #0x2c]
    mov r0, r5
    mov r1, #0x28
    ldrsh r5, [r6, #0x2e]
    bl func_020befec
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    add r3, r10, r0, lsl #0x2
    ldrsh r1, [r6, #0x2c]
    ldr r2, [r3, #0x30]
    sub r0, r5, #0x24
    strh r1, [r2, #0x2c]
    strh r0, [r2, #0x2e]
    ldr r2, [r3, #0x30]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    str r0, [r3, #0x50]
.L_02210400:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0xf0
    ble .L_02210708
    ldr r1, [r10, #0x8]
    mov r0, r10
    add r1, r1, #0x1
    str r1, [r10, #0x8]
    mov r1, #0x0
    str r1, [r10, #0x70]
    bl func_ov072_02210818
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02210478
    cmp r0, #0x0
    movlt r1, #0x2
    strlt r1, [r10, #0x7c]
    movlt r1, #0xf
    strlt r1, [r10, #0x8]
    blt .L_022104c4
    str r0, [r10, #0x78]
    ldr r2, [r4, #0x230]
    mov r1, #0x1
    orr r2, r2, #0x100000
    str r2, [r4, #0x230]
    str r1, [r10, #0x7c]
    mov r1, #0xa
    str r1, [r10, #0x8]
    b .L_022104c4
.L_02210478:
    mov r1, #0x0
    mov r0, r10
    str r1, [r10, #0x7c]
    bl func_ov072_022108e8
    cmp r0, #0x1
    moveq r1, #0x14
    streq r1, [r10, #0x8]
    moveq r1, #0x3
    streq r1, [r10, #0x7c]
    beq .L_022104c4
    cmp r0, #0x0
    moveq r1, #0x1e
    streq r1, [r10, #0x8]
    moveq r1, #0x4
    streq r1, [r10, #0x7c]
    movne r1, #0x63
    strne r1, [r10, #0x8]
    movne r1, #0x0
    strne r1, [r10, #0x7c]
.L_022104c4:
    str r0, [r10, #0x78]
    ldr r0, [r10, #0x2c]
    mov r1, #0x2
    bl func_02072b68
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02210708
.L_022104e8:
    add r0, r1, #0x1
    str r0, [r10, #0x8]
.L_022104f0:
    ldr r0, [r10, #0x2c]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02210530
    mov r1, #0x3
    bl func_02072b68
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02210530:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0x78
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r0, #0x3c
    bne .L_02210708
    ldr r0, .L_022107cc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x31
    bl Sound_Play
    b .L_02210708
.L_02210568:
    ldr r0, [r10, #0x2c]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210708
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210588:
    ldr r0, [r10, #0x2c]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210708
    ldr r0, [r10, #0x8]
    mov r1, #0x3
    add r0, r0, #0x1
    str r0, [r10, #0x8]
    ldr r0, [r10, #0x2c]
    bl func_02072b68
    ldr r3, [r10, #0x2c]
    ldr r0, .L_022107cc
    ldrh r2, [r3, #0x24]
    mov r1, #0x5e
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r3, [r10, #0x2c]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x1
    strh r2, [r3, #0x24]
    ldr r0, [r0, #0x0]
    bl func_0205974c
    b .L_02210708
.L_022105ec:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0x5a
    ble .L_02210708
    mov r0, #0x32
    str r0, [r10, #0x8]
    mov r1, #0x0
    ldr r0, .L_022107cc
    str r1, [r10, #0x70]
    ldr r0, [r0, #0x0]
    mov r1, #0x5e
    mov r2, #0x1
    bl Sound_Play
    b .L_02210708
.L_02210628:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0x5a
    ble .L_02210708
    mov r0, #0x32
    str r0, [r10, #0x8]
    mov r2, #0x0
    ldr r0, .L_022107cc
    str r2, [r10, #0x70]
    ldr r0, [r0, #0x0]
    mov r1, #0x5e
    bl Sound_Play
    b .L_02210708
.L_02210660:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0x5a
    ble .L_0221068c
    ldr r0, .L_022107cc
    mov r1, #0x5e
    ldr r0, [r0, #0x0]
    bl func_020597fc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221068c:
    cmp r0, #0xa
    bne .L_02210708
    ldr r0, [r10, #0x7c]
    cmp r0, #0x4
    moveq r1, #0x4
    ldr r0, [r10, #0x2c]
    movne r1, #0x5
    bl func_02072b68
    b .L_02210708
.L_022106b0:
    ldr r0, [r10, #0x2c]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_022106f0
    mov r1, #0x3
    bl func_02072b68
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r10, #0x2c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_022106f0:
    ldr r0, [r10, #0x70]
    add r0, r0, #0x1
    str r0, [r10, #0x70]
    cmp r0, #0x5a
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210708:
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x2c]
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x24]
    bl func_02005afc
    mov r8, #0x0
    mov r5, #0x1
    ldr r6, .L_022107d0
    add r7, r10, #0x50
    mov r11, r8
    mov r4, r5
.L_0221073c:
    add r0, r10, r8, lsl #0x2
    ldr r9, [r0, #0x30]
    ldrh r0, [r9, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_022107b4
    ldr r1, [r7, r8, lsl #0x2]
    ldr r0, [r10, #0x2c]
    mov r2, r1, lsl #0x1a
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r2, [r6, r2]
    ldrsh r3, [r0, #0x2c]
    tst r1, #0x1
    mov r0, r2, asr #0x9
    add r0, r2, r0, lsr #0x16
    movne ip, r5
    ldrsh r2, [r9, #0x2e]
    add r1, r3, r0, asr #0xa
    moveq ip, r11
    mov r0, r9
    mov r3, #0x4
    sub r2, r2, ip
    bl func_02005a00
    strb r4, [r9, #0x3a]
    ldr r0, [r7, r8, lsl #0x2]
    add r0, r0, #0x1
    str r0, [r7, r8, lsl #0x2]
.L_022107b4:
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_0221073c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022107c8: .word data_021052fc
.L_022107cc: .word gSoundContext
.L_022107d0: .word data_020c9670
.size func_ov072_02210214, . - func_ov072_02210214
