.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_021052fc
.extern data_ov082_0221483c
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Actor_PlayRadialSpatialSound
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue2A
.extern ActorExtendedType2_GetDescriptorValue25
.extern Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
.extern func_020befec
.extern func_020bf1f8
.extern genrand_int32

.global func_ov082_02213f64
func_ov082_02213f64:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214230
    add r2, r4, #0x200
    ldrh r3, [r2, #0x98]
    mov r0, r3, lsl #0x10
    movs r0, r0, lsr #0x11
    beq .L_02213fc0
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r1, r0, lsl #0x10
    ldr r0, .L_02214238
    mov r1, r1, lsr #0x10
    and r3, r3, r0
    mov r0, r1, lsl #0x11
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0x98]
.L_02213fc0:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x98]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldr r1, [r4, #0x260]
    beq .L_0221418c
    orr r1, r1, #0x8
    bic r1, r1, #0x400
    str r1, [r4, #0x260]
    ldr r1, [r4, #0x10]
    bic r1, r1, #0x10000
    str r1, [r4, #0x10]
    ldrh r1, [r0, #0x9a]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x9a]
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2A
    add r1, r4, #0x200
    ldrh r1, [r1, #0x9a]
    sub r0, r0, #0x1e
    cmp r1, r0
    ble .L_022140b4
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x1
    bne .L_022140b4
    add r0, r4, #0x200
    ldrh r0, [r0, #0x9a]
    mov r1, #0x3
    bl func_020befec
    cmp r1, #0x0
    bne .L_022140b4
    bl genrand_int32
    ldr r1, .L_0221423c
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r5, r0
    mov r0, r6
    mov r1, #0x18
    bl func_020bf1f8
    mov r0, r5
    mov r2, r6, lsr #0x4
    and r3, r2, #0xf
    mov r5, r1
    mov r1, #0x3c
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r2, [r4, #0x1c]
    ldr lr, [r4, #0x20]
    mov r2, r2, asr #0xc
    sub r2, r2, #0xc
    add r2, r5, r2
    ldr ip, [r4, #0x24]
    mov ip, ip, asr #0xc
    rsb ip, ip, lr, asr #0xc
    sub r3, ip, r3
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
.L_022140b4:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x9a]
    cmp r0, #0x0
    bne .L_02214164
    ldr r0, [r4, #0x260]
    tst r0, #0x2
    beq .L_022140ec
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_022140f0
.L_022140ec:
    mov r0, #0x0
.L_022140f0:
    cmp r0, #0x0
    beq .L_02214164
    add r0, r4, #0x200
    ldrh r3, [r0, #0x98]
    mov r2, #0x0
    ldr r1, .L_02214240
    bic r3, r3, #0x1
    strh r3, [r0, #0x98]
    ldr r3, [r4, #0xd0]
    mov r0, r4
    orr r3, r3, #0x1000
    str r3, [r4, #0xd0]
    strh r2, [r4, #0xda]
    ldr r3, [r1, #0x30]
    ldr r2, [r1, #0x34]
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x24]
    str r2, [r4, #0x220]
    str r1, [r4, #0x224]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    bne .L_02214228
    ldr r1, .L_02214244
    mov r0, r4
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    b .L_02214228
.L_02214164:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_02214228
    mov r1, #0x0
    strh r1, [r0, #0x9c]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    b .L_02214228
.L_0221418c:
    bic r1, r1, #0x8
    str r1, [r4, #0x260]
    ldrh r1, [r0, #0x9c]
    cmp r1, #0x0
    bne .L_022141cc
    ldr r1, [r4, #0x260]
    tst r1, #0x10
    beq .L_022141cc
    mov r1, #0x1e
    strh r1, [r0, #0x9c]
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x10000
    str r0, [r4, #0x10]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
.L_022141cc:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_0221421c
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x400
    str r1, [r4, #0x260]
    ldrh r1, [r0, #0x9c]
    sub r1, r1, #0x1
    strh r1, [r0, #0x9c]
    ldrh r0, [r0, #0x9c]
    cmp r0, #0x0
    bne .L_02214228
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x10000
    str r0, [r4, #0x10]
    b .L_02214228
.L_0221421c:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x400
    str r0, [r4, #0x260]
.L_02214228:
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
.L_02214230:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02214238: .word 0xffff0001
.L_0221423c: .word data_021052fc
.L_02214240: .word data_ov082_0221483c
.L_02214244: .word 0xc883
.size func_ov082_02213f64, . - func_ov082_02213f64
