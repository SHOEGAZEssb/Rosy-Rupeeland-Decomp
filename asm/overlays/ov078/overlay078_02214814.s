.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_SpawnOptionalPresentation
.extern ActorExtendedType2_GetDescriptorValue2A
.extern Sound_PlayOwnedEffect
.extern func_020befec
.extern func_ov078_02213a74
.extern gSoundContext

.global func_ov078_02214814
func_ov078_02214814:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x18
    mov r8, r0
    ldr r2, [r8, #0x228]
    mov r7, r1
    ldr r1, [r2, #0xd0]
    tst r1, #0x100
    beq .L_02214844
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02214c9c
.L_02214844:
    ldr r1, [r8, #0x260]
    add r0, sp, #0x8
    orr r1, r1, #0x21
    str r1, [r8, #0x260]
    ldr r1, [r8, #0x228]
    ldr r4, [r8, #0x1c]
    ldr r5, [r1, #0x1c]
    ldr r3, [r1, #0x20]
    ldr r2, [r8, #0x20]
    sub r4, r5, r4
    add r1, r8, #0x18
    sub r5, r3, r2
    bl VecFx32Object_InitCopy
    mov r0, r8
    bl ActorExtendedType2_GetDescriptorValue2A
    mov r6, r0
    cmp r6, #0x2
    blt .L_02214964
    ldrsb r0, [r8, #0x48]
    mov lr, #0x0
    tst r0, #0x1
    beq .L_02214900
    mov r1, #0xc00
    umull r2, r10, r4, r1
    adds r3, r2, #0x800
    ldr ip, .L_02214ca4
    mla r10, r4, lr, r10
    umull r9, r0, r5, ip
    mov r2, r4, asr #0x1f
    mla r10, r2, r1, r10
    adc r2, r10, #0x0
    adds r1, r9, #0x800
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mla r0, r5, lr, r0
    mov r9, r5, asr #0x1f
    mla r0, r9, ip, r0
    ldr r9, [sp, #0xc]
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    sub r3, r9, r3
    ldr r2, [sp, #0x10]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r3, [sp, #0xc]
    str r0, [sp, #0x10]
    b .L_022149c4
.L_02214900:
    ldr r1, .L_02214ca4
    mov ip, #0xc00
    umull r2, r10, r4, r1
    adds r3, r2, #0x800
    umull r9, r0, r5, ip
    mla r10, r4, lr, r10
    mov r2, r4, asr #0x1f
    mla r10, r2, r1, r10
    adc r2, r10, #0x0
    adds r1, r9, #0x800
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    mla r0, r5, lr, r0
    mov r9, r5, asr #0x1f
    mla r0, r9, ip, r0
    ldr r9, [sp, #0xc]
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    sub r3, r9, r3
    ldr r2, [sp, #0x10]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r3, [sp, #0xc]
    str r0, [sp, #0x10]
    b .L_022149c4
.L_02214964:
    ldr r3, .L_02214ca8
    mov ip, #0x0
    umull r1, r9, r4, r3
    umull r0, lr, r5, r3
    adds r2, r1, #0x800
    mla r9, r4, ip, r9
    mov r1, r4, asr #0x1f
    mla r9, r1, r3, r9
    adc r1, r9, #0x0
    adds r0, r0, #0x800
    mov r2, r2, lsr #0xc
    mla lr, r5, ip, lr
    mov ip, r5, asr #0x1f
    mla lr, ip, r3, lr
    adc r3, lr, #0x0
    mov r0, r0, lsr #0xc
    ldr r9, [sp, #0xc]
    orr r2, r2, r1, lsl #0x14
    sub r2, r9, r2
    ldr r1, [sp, #0x10]
    str r2, [sp, #0xc]
    orr r0, r0, r3, lsl #0x14
    sub r0, r1, r0
    str r0, [sp, #0x10]
.L_022149c4:
    mov r0, r8
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r8, #0x2c0]
    cmp r0, #0x0
    bne .L_02214a64
    ldr r2, [r8, #0x8c]
    ldr r0, .L_02214cac
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    adds ip, ip, #0x800
    mla r3, r2, r0, r3
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r8, #0x8c]
    ldr r2, [r8, #0x90]
    umull ip, r3, r2, r0
    adds ip, ip, #0x800
    mla r3, r2, r1, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r0, r3
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r8, #0x90]
    ldr r3, [r8, #0x94]
    mov r2, r3, asr #0x1f
    umull lr, ip, r3, r0
    mla ip, r3, r1, ip
    mla ip, r2, r0, ip
    adds r1, lr, #0x800
    adc r0, ip, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r8, #0x94]
.L_02214a64:
    cmp r6, #0x2
    blt .L_02214ad4
    ldrsb r0, [r8, #0x48]
    mov r1, #0x0
    tst r0, #0x1
    mov r0, #0x1800
    beq .L_02214aac
    ldr r2, [r8, #0x3c]
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, ip, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r8, #0x3c]
    b .L_02214ad4
.L_02214aac:
    ldr r2, [r8, #0x40]
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, ip, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r8, #0x40]
.L_02214ad4:
    add r0, r8, #0x200
    ldrsh r0, [r0, #0x98]
    mov r1, #0x14
    bl func_020befec
    cmp r1, #0x0
    bne .L_02214b60
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl ActorExtendedType2_SpawnOptionalPresentation
    add r0, r8, #0x200
    ldrh r0, [r0, #0xc6]
    mov r1, #0x100
    mov r2, #0x3
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x0]
    beq .L_02214b3c
    ldr r0, .L_02214cb0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    mov r1, #0x1
    bl Sound_PlayOwnedEffect
    b .L_02214b54
.L_02214b3c:
    ldr r0, .L_02214cb0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    mov r1, #0x61
    bl Sound_PlayOwnedEffect
.L_02214b54:
    mov r0, r8
    mov r1, r7
    bl func_ov078_02213a74
.L_02214b60:
    ldr r0, [r8, #0x260]
    tst r0, #0x80
    beq .L_02214b90
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r1, #0x0
    str r1, [r8, #0x44]
    add r0, r8, #0x200
    strh r1, [r0, #0x9e]
    b .L_02214c80
.L_02214b90:
    add r0, r8, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x6e
    ble .L_02214c78
    ldr r1, .L_02214cb4
    mov r2, #0x0
    ldr r3, [r1, #0xb0]
    ldr r1, [r1, #0xb4]
    str r3, [r8, #0x2a4]
    str r1, [r8, #0x2a8]
    strh r2, [r0, #0x98]
    strh r2, [r0, #0x9c]
    ldr r0, [r8, #0x2c0]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, [r8, #0x260]
    mov r1, #0x100
    bicne r0, r0, #0xa
    orreq r0, r0, #0xa
    str r0, [r8, #0x260]
    mov r0, #0x1b
    strh r0, [r8, #0xd6]
    mov r0, r4, lsl #0x1
    str r0, [r8, #0x2b4]
    mov r0, r5, lsl #0x1
    str r0, [r8, #0x2b8]
    cmp r6, #0x2
    blt .L_02214c2c
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02214cb0
    mov r3, r8
    ldr r0, [r0, #0x0]
    mov r1, #0x55
    bl Sound_PlayOwnedEffect
    b .L_02214c80
.L_02214c2c:
    add r0, r8, #0x200
    ldrh r0, [r0, #0xc6]
    cmp r0, #0x0
    str r2, [sp, #0x0]
    beq .L_02214c5c
    ldr r0, .L_02214cb0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    mov r1, #0x1
    bl Sound_PlayOwnedEffect
    b .L_02214c80
.L_02214c5c:
    ldr r0, .L_02214cb0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    mov r1, #0x61
    bl Sound_PlayOwnedEffect
    b .L_02214c80
.L_02214c78:
    mov r0, #0x1a
    strh r0, [r8, #0xd6]
.L_02214c80:
    ldr r0, [r8, #0x2c0]
    cmp r0, #0x0
    movne r0, #0x3
    moveq r0, #0x2
    strb r0, [r8, #0x24c]
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
.L_02214c9c:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02214ca4: .word 0x333
.L_02214ca8: .word 0x4cd
.L_02214cac: .word 0xf0a
.L_02214cb0: .word gSoundContext
.L_02214cb4: .word data_ov078_02215c88
.size func_ov078_02214814, . - func_ov078_02214814
