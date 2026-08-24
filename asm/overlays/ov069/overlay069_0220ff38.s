.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern gFx32CosSinTable
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern func_0209b58c
.extern SignedAbsoluteValueVariant
.extern func_020bf1f8
.extern func_ov069_0220fd20
.extern genrand_int32

.global func_ov069_0220ff38
func_ov069_0220ff38:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r9, r0
    ldr r4, [r9, #0x338]
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r8, r3
    cmp r4, #0x1
    bne .L_0220ff78
    ldr r0, [r9, #0x330]
    add r0, r0, #0x148
    str r0, [r9, #0x330]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r9, #0x330]
    b .L_0220ff98
.L_0220ff78:
    mvn r0, #0x0
    cmp r4, r0
    bne .L_0220ff98
    ldr r0, [r9, #0x330]
    subs r0, r0, #0x7b
    str r0, [r9, #0x330]
    movmi r0, #0x0
    strmi r0, [r9, #0x330]
.L_0220ff98:
    mov r0, #0xd
    sub r6, r0, #0x1
.L_0220ffa0:
    mov r0, #0x24
    mla r7, r6, r0, r9
    mov r1, #0x3
    sub r0, r6, #0x6
    sub r4, r1, #0x1
    mov r2, #0xc
.L_0220ffb8:
    mla r3, r4, r2, r7
    ldr r1, [sp, #0x4]
    subs r4, r4, #0x1
    ldr r1, [r1, #0x4]
    str r1, [r3, #0x8]
    ldr r1, [sp, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r3, #0xc]
    bpl .L_0220ffb8
    ldr r2, [r7, #0xc]
    mvn r1, #0x0
    add r2, r2, #0x2a000
    str r2, [r7, #0xc]
    ldr r2, [r7, #0x18]
    add r2, r2, #0x2a000
    str r2, [r7, #0x18]
    ldr r2, [r7, #0x24]
    add r2, r2, #0x2a000
    str r2, [r7, #0x24]
    ldr r3, [r9, #0x338]
    cmp r3, r1
    bne .L_02210138
    mov r1, #0x24
    mla r4, r6, r1, r9
    ldr r2, [r4, #0xc]
    mov r1, #0x1800
    sub r2, r2, #0x2a000
    str r2, [r4, #0xc]
    ldr r3, [r4, #0x18]
    mov r2, #0x2800
    sub r3, r3, #0x2a000
    str r3, [r4, #0x18]
    ldr r5, [r4, #0x24]
    ldr r3, .L_022106f8
    sub r5, r5, #0x2a000
    str r5, [r4, #0x24]
    ldr r5, [r4, #0x8]
    mla r1, r0, r1, r5
    str r1, [r4, #0x8]
    ldr r1, [r4, #0x14]
    mla r1, r0, r2, r1
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x20]
    mla r1, r0, r3, r1
    str r1, [r4, #0x20]
    bl SignedAbsoluteValueVariant
    ldr r1, .L_022106fc
    mov r2, #0x18
    mul r1, r0, r1
    ldr r3, [r4, #0xc]
    mla r0, r6, r2, r9
    add r2, r3, r1
    str r2, [r4, #0xc]
    ldr r3, [r4, #0x18]
    add r2, r1, #0xe000
    add r2, r3, r2
    str r2, [r4, #0x18]
    ldr r2, [r4, #0x24]
    add r1, r1, #0x1e000
    add r1, r2, r1
    str r1, [r4, #0x24]
    add r10, r0, #0x100
    ldrh r0, [r10, #0xe4]
    ldr r1, .L_02210700
    mov r11, #0x0
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh ip, [r1, r0]
    mov r5, #0x6000
    ldr r3, [r4, #0x14]
    umull r2, r0, ip, r5
    mla r0, ip, r11, r0
    mov r11, ip, asr #0x1f
    mla r0, r11, r5, r0
    adds r2, r2, #0x800
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, r3, r2
    str r0, [r4, #0x14]
    ldrh r3, [r10, #0xec]
    mov r2, #0x800
    ldr r0, [r4, #0x20]
    mov r3, r3, asr #0x4
    mov r3, r3, lsl #0x2
    ldrsh r3, [r1, r3]
    mov r1, r3, asr #0x1f
    mov r1, r1, lsl #0xe
    adds r2, r2, r3, lsl #0xe
    orr r1, r1, r3, lsr #0x12
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r4, #0x20]
    b .L_02210504
.L_02210138:
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    bne .L_022102c8
    mov r1, #0x24
    mla r4, r6, r1, r9
    ldr r2, [r4, #0x8]
    mov r1, #0x6000
    add r2, r2, r0, lsl #0xe
    str r2, [r4, #0x8]
    ldr r3, [r4, #0x14]
    add r2, r0, r0, lsl #0x2
    mla r1, r0, r1, r3
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x20]
    add r1, r1, r2, lsl #0xc
    str r1, [r4, #0x20]
    bl SignedAbsoluteValueVariant
    ldr r1, .L_022106fc
    ldr r3, [r4, #0xc]
    mul r1, r0, r1
    mov r2, #0x18
    mla r0, r6, r2, r9
    add r2, r3, r1
    str r2, [r4, #0xc]
    add r2, r1, #0xe000
    ldr r3, [r4, #0x18]
    add r1, r1, #0x1e000
    add r2, r3, r2
    str r2, [r4, #0x18]
    ldr r2, [r4, #0x24]
    add r10, r0, #0x100
    add r1, r2, r1
    str r1, [r4, #0x24]
    ldrh r0, [r10, #0xe4]
    ldr r3, .L_02210700
    mov lr, #0x6000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r1, [r3, r0]
    mov r11, #0x0
    ldr ip, [r4, #0x14]
    umull r0, r2, r1, lr
    adds r0, r0, #0x800
    mov r5, r0, lsr #0xc
    mla r2, r1, r11, r2
    mov r0, r1, asr #0x1f
    mla r2, r0, lr, r2
    adc r0, r2, #0x0
    orr r5, r5, r0, lsl #0x14
    add r0, ip, r5
    str r0, [r4, #0x14]
    ldrh r0, [r10, #0xe6]
    ldr r2, [r4, #0x18]
    mov lr, #0x5000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r5, [r3, r0]
    mov r0, #0x3000
    umull r1, r0, r5, r0
    adds r1, r1, #0x800
    mla r0, r5, r11, r0
    mov ip, r5, asr #0x1f
    mov r5, #0x3000
    mla r0, ip, r5, r0
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r4, #0x18]
    ldrh r0, [r10, #0xec]
    mov r1, #0x800
    ldr r2, [r4, #0x20]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r3, r0]
    mov r5, r0, asr #0x1f
    mov r5, r5, lsl #0xe
    adds r1, r1, r0, lsl #0xe
    orr r5, r5, r0, lsr #0x12
    mov r1, r1, lsr #0xc
    adc r0, r5, #0x0
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r4, #0x20]
    ldrh r1, [r10, #0xee]
    ldr r0, [r4, #0x24]
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r2, [r3, r1]
    umull r5, r3, r2, lr
    mla r3, r2, r11, r3
    mov r1, r2, asr #0x1f
    adds r2, r5, #0x800
    mla r3, r1, lr, r3
    adc r1, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r4, #0x24]
    b .L_02210504
.L_022102c8:
    ldr r2, [r9, #0x330]
    mov r1, #0x78
    mul r3, r2, r3
    mul r10, r3, r1
    mov r1, #0x1000
    subs r4, r1, r3
    mov r2, r0, lsl #0xe
    movmi r4, #0x0
    mov r1, #0xa000
    mul r3, r0, r1
    mov r1, #0x24
    mla r5, r6, r1, r9
    smull r11, r1, r2, r4
    adds r11, r11, #0x800
    adc r1, r1, #0x0
    mov r11, r11, lsr #0xc
    orr r11, r11, r1, lsl #0x14
    add r1, r2, r11
    smull ip, r11, r3, r4
    adds ip, ip, #0x800
    adc r3, r11, #0x0
    mov r11, ip, lsr #0xc
    orr r11, r11, r3, lsl #0x14
    add r3, r2, r11
    ldr r11, [r5, #0x8]
    add r2, r11, r2
    str r2, [r5, #0x8]
    ldr r2, [r5, #0x14]
    add r1, r2, r1
    str r1, [r5, #0x14]
    ldr r1, [r5, #0x20]
    add r1, r1, r3
    str r1, [r5, #0x20]
    bl SignedAbsoluteValueVariant
    ldr r1, .L_022106fc
    mov r2, #0x18
    mul r3, r0, r1
    add r0, r3, #0xf000
    add r1, r10, r0
    add r0, r3, #0x20000
    add r3, r10, r0
    ldr r10, [r5, #0x18]
    mla r0, r6, r2, r9
    add r1, r10, r1
    str r1, [r5, #0x18]
    ldr r2, [r5, #0x24]
    add r1, r0, #0x100
    add r0, r2, r3
    str r0, [r5, #0x24]
    ldrh r0, [r1, #0xe4]
    ldr r10, .L_02210700
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r3, [r10, r0]
    ldr r0, [r5, #0x14]
    mov r2, r3, asr #0x1f
    mov r11, r2, lsl #0xd
    mov r2, #0x800
    orr r11, r11, r3, lsr #0x13
    adds r3, r2, r3, lsl #0xd
    adc r2, r11, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    smull r11, r2, r3, r4
    adds r3, r11, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r0, r0, r3
    str r0, [r5, #0x14]
    ldrh r2, [r1, #0xe6]
    ldr r0, [r5, #0x18]
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r3, [r10, r2]
    mov r2, r3, asr #0x1f
    mov r11, r2, lsl #0xd
    mov r2, #0x800
    orr r11, r11, r3, lsr #0x13
    adds r3, r2, r3, lsl #0xd
    adc r2, r11, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r0, r0, r3
    str r0, [r5, #0x18]
    ldrh r0, [r1, #0xec]
    ldr lr, [r5, #0x20]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r10, r0]
    mov r0, #0x3000
    umull ip, r3, r2, r0
    mov r0, #0x0
    mla r3, r2, r0, r3
    mov r11, r2, asr #0x1f
    mov r0, #0x3000
    adds r2, ip, #0x800
    mla r3, r11, r0, r3
    adc r0, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    smull r3, r0, r2, r4
    adds r2, r3, #0x800
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, lr, r2
    str r0, [r5, #0x20]
    ldrh r0, [r1, #0xee]
    mov r2, #0x3000
    ldr r4, [r5, #0x24]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r10, r0]
    umull r10, r2, r0, r2
    adds r3, r10, #0x800
    mov r10, #0x0
    mla r2, r0, r10, r2
    mov r11, r0, asr #0x1f
    mov r0, #0x3000
    mla r2, r11, r0, r2
    mov r0, r10
    mov r3, r3, lsr #0xc
    adc r0, r2, r0
    orr r3, r3, r0, lsl #0x14
    add r0, r4, r3
    str r0, [r5, #0x24]
    ldrh r0, [r1, #0xe4]
    add r0, r0, #0x328
    add r0, r0, #0x2000
    strh r0, [r1, #0xe4]
    ldrh r0, [r1, #0xec]
    add r0, r0, #0x328
    add r0, r0, #0x2000
    strh r0, [r1, #0xec]
    ldrh r0, [r1, #0xe6]
    add r0, r0, #0x328
    add r0, r0, #0x2000
    strh r0, [r1, #0xe6]
    ldrh r0, [r1, #0xee]
    add r0, r0, #0x328
    add r0, r0, #0x2000
    strh r0, [r1, #0xee]
.L_02210504:
    mov r0, #0x18
    mla r4, r6, r0, r9
    bl genrand_int32
    ldr r2, .L_02210704
    mov r1, #0xa
    and r0, r0, r2
    add r0, r0, #0x98
    add r0, r0, #0x800
    mul r0, r8, r0
    bl func_020bf1f8
    add r1, r4, #0x100
    ldrh r2, [r1, #0xe4]
    add r0, r2, r0
    strh r0, [r1, #0xe4]
    bl genrand_int32
    ldr r2, .L_02210704
    mov r1, #0xa
    and r0, r0, r2
    add r0, r0, #0x960
    mul r0, r8, r0
    bl func_020bf1f8
    add r1, r4, #0x100
    ldrh r2, [r1, #0xec]
    add r0, r2, r0
    strh r0, [r1, #0xec]
    bl genrand_int32
    ldr r2, .L_02210704
    mov r1, #0xa
    and r0, r0, r2
    add r0, r0, #0x68
    add r0, r0, #0x1000
    mul r0, r8, r0
    bl func_020bf1f8
    add r1, r4, #0x100
    ldrh r2, [r1, #0xe6]
    add r0, r2, r0
    strh r0, [r1, #0xe6]
    bl genrand_int32
    ldr r2, .L_02210704
    mov r1, #0xa
    and r0, r0, r2
    add r0, r0, #0x130
    add r0, r0, #0x1000
    mul r0, r8, r0
    bl func_020bf1f8
    add r1, r4, #0x100
    ldrh r2, [r1, #0xee]
    add r0, r2, r0
    strh r0, [r1, #0xee]
    add r0, sp, #0x24
    bl func_ov069_0220fd20
    add r0, sp, #0x18
    bl func_ov069_0220fd20
    add r0, sp, #0xc
    bl func_ov069_0220fd20
    mov r0, #0x24
    mla r1, r6, r0, r9
    ldr r0, [r1, #0x14]
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x18]
    str r0, [sp, #0x20]
    ldr r0, [r9, #0x338]
    cmp r0, #0x0
    ldrne r0, [r7, #0x8]
    strne r0, [sp, #0x10]
    ldrne r0, [r7, #0xc]
    strne r0, [sp, #0x14]
    ldrne r4, [r9, #0x330]
    bne .L_02210634
    ldr r0, [r9, #0x314]
    str r0, [sp, #0x10]
    ldr r0, [r9, #0x318]
    str r0, [sp, #0x14]
    ldr r0, [r9, #0x330]
    add r0, r0, r0, lsr #0x1f
    mov r4, r0, asr #0x1
.L_02210634:
    ldr r0, .L_02210708
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r3, sp, #0x24
    str r3, [sp, #0x0]
    mov r3, r4
    add r1, sp, #0x18
    add r2, sp, #0xc
    mov r4, r0
    bl func_0209b58c
    ldr r0, [sp, #0x28]
    add r1, sp, #0x18
    str r0, [r7, #0x14]
    ldr r0, [sp, #0x2c]
    add r2, sp, #0xc
    str r0, [r7, #0x18]
    ldr r0, [r7, #0x20]
    str r0, [sp, #0x1c]
    ldr r0, [r7, #0x24]
    str r0, [sp, #0x20]
    ldr r0, [r9, #0x314]
    str r0, [sp, #0x10]
    ldr r0, [r9, #0x318]
    str r0, [sp, #0x14]
    ldr r0, [r9, #0x338]
    cmp r0, #0x0
    ldreq r0, [r9, #0x314]
    streq r0, [sp, #0x10]
    ldreq r0, [r9, #0x318]
    streq r0, [sp, #0x14]
    ldrne r0, [r7, #0x8]
    strne r0, [sp, #0x10]
    ldrne r0, [r7, #0xc]
    strne r0, [sp, #0x14]
    add r0, sp, #0x24
    str r0, [sp, #0x0]
    ldr r3, [r9, #0x330]
    mov r0, r4
    bl func_0209b58c
    ldr r0, [sp, #0x28]
    subs r6, r6, #0x1
    str r0, [r7, #0x20]
    ldr r0, [sp, #0x2c]
    str r0, [r7, #0x24]
    bpl .L_0220ffa0
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022106f8: .word 0x14cd
.L_022106fc: .word 0xbb8
.L_02210700: .word gFx32CosSinTable
.L_02210704: .word 0xfff
.L_02210708: .word gGamePhaseRuntime
.size func_ov069_0220ff38, . - func_ov069_0220ff38
