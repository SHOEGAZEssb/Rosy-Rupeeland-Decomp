.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern data_ov078_02215c44
.extern data_ov078_02215c54
.extern data_ov078_02215c88
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_0201e0ec
.extern TrackedResourceActor_SpawnFromKey
.extern func_020a25c8
.extern func_020adae4
.extern func_020ae024
.extern func_ov078_02213ba8
.extern func_ov078_022147dc

.global func_ov078_02215508
func_ov078_02215508:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x7c
    mov r6, r0
    ldr r2, [r6, #0x260]
    add r0, r6, #0x200
    orr r2, r2, #0x2b
    str r2, [r6, #0x260]
    ldrsh r2, [r0, #0x98]
    mov r5, r1
    add r1, r2, #0x1
    strh r1, [r0, #0x98]
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x1e
    bge .L_022156dc
    ldr r4, [r6, #0x228]
    add r0, sp, #0x6c
    add r1, r4, #0x18
    add r2, r6, #0x18
    bl func_ov078_02213ba8
    ldrsh r2, [r5, #0x12]
    ldr r0, [sp, #0x74]
    ldr r1, [sp, #0x70]
    add r2, r2, #0x20
    mov r5, r2, lsl #0xc
    bl func_020ae024
    add r1, r6, #0x200
    ldrsh r1, [r1, #0xa2]
    cmp r1, #0x0
    addgt r0, r0, #0x2000
    suble r0, r0, #0x2000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_022157f4
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r0, [r1, r0]
    ldr r1, [r4, #0x1c]
    smull r3, ip, r2, r5
    adds lr, r3, #0x800
    smull r3, r2, r0, r5
    adc r0, ip, #0x0
    mov r5, lr, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    ldr r4, [r4, #0x20]
    ldr r3, [r6, #0x24]
    add r0, sp, #0x5c
    sub r1, r1, r5
    sub r2, r4, r2
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x5c
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r6, #0x3c]
    mov r1, #0x4
    bl func_020adae4
    ldr r2, [r6, #0x8c]
    mov r1, #0x4
    add r0, r2, r0
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x40]
    bl func_020adae4
    ldr r2, [r6, #0x90]
    mov r1, #0x2
    add r0, r2, r0
    str r0, [r6, #0x90]
    ldr r0, [r6, #0x3c]
    bl func_020adae4
    str r0, [r6, #0x3c]
    ldr r0, [r6, #0x40]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r6, #0x40]
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x98]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_022156b8
    ldr r0, .L_022157f8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x20
    str r1, [sp, #0x0]
    mov r1, #0x18
    str r1, [sp, #0x4]
    mov r1, #0x46
    str r1, [sp, #0x8]
    ldr r1, [r6, #0x24]
    ldr r3, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x1e
    mov r1, #0x0
    bl func_020a25c8
.L_022156b8:
    mov r1, #0x2
    strb r1, [r6, #0x24c]
    mov r1, #0xe
    add r0, sp, #0x5c
    strh r1, [r6, #0xd6]
    bl VecFx32Object_Destroy
    add r0, sp, #0x6c
    bl VecFx32Object_Destroy
    b .L_022157ec
.L_022156dc:
    mov r1, #0x0
    strh r1, [r0, #0xb0]
    strh r1, [r0, #0xb4]
    ldr r1, [r6, #0x228]
    add r0, sp, #0x4c
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [r6, #0x2b8]
    mov r1, #0x0
    ldrsb r3, [r0, #0x15]
    add r0, sp, #0xc
    mov r2, r1
    mov r3, r3, asr #0xc
    bl VecFx32Object_InitComponents
    add r0, sp, #0x3c
    add r2, sp, #0xc
    add r1, r6, #0x18
    bl func_ov078_022147dc
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
    ldr r3, .L_022157fc
    add r2, sp, #0x2c
    mov r1, #0x8
.L_02215738:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02215738
    ldr r3, .L_02215800
    add r2, sp, #0x1c
    mov r1, #0x8
.L_02215754:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02215754
    ldrb r1, [r6, #0xd4]
    add r0, sp, #0x2c
    ldr r2, [sp, #0x40]
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    add r0, sp, #0x1c
    ldr r4, [sp, #0x44]
    add r1, r2, r1, lsl #0xc
    str r1, [sp, #0x40]
    ldrb r3, [r6, #0xd4]
    add r1, sp, #0x3c
    add r2, sp, #0x4c
    mov r3, r3, lsl #0x1
    ldrsh r0, [r0, r3]
    add r0, r4, r0, lsl #0xc
    str r0, [sp, #0x44]
    ldrsb r0, [r5, #0x25]
    bl TrackedResourceActor_SpawnFromKey
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, r6, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    mov r1, #0xd
    ldr r0, .L_02215804
    strh r1, [r6, #0xd6]
    ldr r2, [r0, #0x88]
    ldr r1, [r0, #0x8c]
    add r0, sp, #0x3c
    str r2, [r6, #0x2a4]
    str r1, [r6, #0x2a8]
    bl VecFx32Object_Destroy
    add r0, sp, #0x4c
    bl VecFx32Object_Destroy
.L_022157ec:
    add sp, sp, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_022157f4: .word data_020c9670
.L_022157f8: .word data_021052fc
.L_022157fc: .word data_ov078_02215c44
.L_02215800: .word data_ov078_02215c54
.L_02215804: .word data_ov078_02215c88
.size func_ov078_02215508, . - func_ov078_02215508
