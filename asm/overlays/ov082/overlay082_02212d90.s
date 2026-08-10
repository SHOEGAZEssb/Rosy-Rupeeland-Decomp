.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_022145e8
.extern data_ov082_022145f0
.extern Actor_GetCachedTerrainHeight
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue2A
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_02050078
.extern func_020be334

.global func_ov082_02212d90
func_ov082_02212d90:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r0, [r5, #0xd6]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    ldr r0, [r5, #0x14]
    orrls r0, r0, #0x40
    bichi r0, r0, #0x40
    str r0, [r5, #0x14]
    mov r0, r5
    bl ActorExtendedType2_UpdateFrame
    ldr r0, [r5, #0x14]
    tst r0, #0x40
    beq .L_02212ee4
    mov r0, #0x0
    str r0, [r5, #0x44]
    ldr r2, [r5, #0x238]
    ldr lr, [r5, #0x24]
    ldr r1, .L_0221300c
    add r4, r2, #0x28000
    umull r7, r6, lr, r1
    mov r2, #0x52
    umull ip, r3, r4, r2
    adds r7, r7, #0x800
    mla r6, lr, r0, r6
    mov lr, lr, asr #0x1f
    mla r6, lr, r1, r6
    adc r6, r6, #0x0
    adds r1, ip, #0x800
    mov r7, r7, lsr #0xc
    mla r3, r4, r0, r3
    mov r0, r4, asr #0x1f
    mla r3, r0, r2, r3
    adc r0, r3, #0x0
    mov r1, r1, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r1, r7, r1
    mov r0, r5
    str r1, [r5, #0x24]
    bl ActorExtendedType2_GetDescriptorValue25
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02212ee4
    add r0, r5, #0x200
    ldrh r1, [r0, #0x98]
    cmp r1, #0x10000
    addlt r1, r1, #0x1
    strlth r1, [r0, #0x98]
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    bne .L_02212ee4
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue2A
    add r1, r5, #0x200
    ldrh r1, [r1, #0x98]
    cmp r1, r0
    ble .L_02212ee4
    ldr r0, [r5, #0x24]
    sub r0, r0, r4
    bl func_020be334
    cmp r0, #0x4000
    bge .L_02212ee4
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue25
    add r1, r5, #0x18
    mov r2, r1
    bl func_02050078
    mov r1, #0x1000
    str r1, [r0, #0x44]
    mov r0, #0x1
    strh r0, [r5, #0xda]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r5, #0xd0]
.L_02212ee4:
    ldr r0, .L_02213010
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02213014
    bne .L_02212f14
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02212f14:
    cmp r3, #0x0
    bne .L_02212f48
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r5, #0x24]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    str r0, [r5, #0x24]
    mov r0, #0x0
    str r0, [r5, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02212f48:
    ldr r0, [r5, #0x238]
    ldr r1, [r5, #0x24]
    cmp r1, r0
    strlt r0, [r5, #0x24]
    movlt r0, #0x0
    strlt r0, [r5, #0x44]
    blt .L_02212f70
    add r0, r0, #0x2e000
    cmp r1, r0
    strge r0, [r5, #0x24]
.L_02212f70:
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x238]
    ldr r1, [r5, #0x24]
    add r0, r0, #0x16000
    cmp r1, r0
    ldr r1, [r5, #0x14]
    mov r0, #0x10000
    bge .L_02212fb8
    bic r1, r1, #0x80
    str r1, [r5, #0x14]
    ldr r1, [r5, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r5, #0x5c]
    b .L_02212fe4
.L_02212fb8:
    orr r1, r1, #0x80
    str r1, [r5, #0x14]
    ldr r1, [r5, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x3f80
    orr r0, r0, #0xc000
    str r0, [r5, #0x5c]
    ldr r0, [r5, #0x54]
    mov r1, #0x1
    strb r1, [r0, #0x3a]
.L_02212fe4:
    ldr r0, [r5, #0x238]
    ldr r1, [r5, #0x24]
    add r0, r0, #0x22000
    cmp r1, r0
    ldr r0, [r5, #0x14]
    biclt r0, r0, #0x100
    strlt r0, [r5, #0x14]
    orrge r0, r0, #0x100
    strge r0, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221300c: .word 0xfae
.L_02213010: .word data_ov082_022145e8
.L_02213014: .word data_ov082_022145f0
.size func_ov082_02212d90, . - func_ov082_02212d90
