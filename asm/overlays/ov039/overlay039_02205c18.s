.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_020adc40
    .extern func_020adc90
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_ov007_021fc16c
    .extern func_020befec
    .extern ActorRuntimeFlags_Test
    .extern func_02005030
    .extern func_ov049_0220bbdc
    .extern func_02005058
    .extern func_020050c8
    .extern func_0209a2a4
    .extern func_ov007_021fc19c
    .extern Sound_Play
    .extern genrand_int32
    .extern func_02058d40
    .extern func_0205940c
    .extern gActorRuntimeFlags
    .extern gSoundContext
    .global func_ov039_02205c18
func_ov039_02205c18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    ldmib r1, {r5, r7}
    smull r1, r3, r5, r5
    adds r4, r1, #0x800
    smull r2, r1, r7, r7
    adc r3, r3, #0x0
    adds r2, r2, #0x800
    mov r6, r4, lsr #0xc
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    mov r4, r0
    add r0, r6, r2
    bl func_020adc40
    mov r8, r0
    mov r0, r5
    mov r1, r8
    bl func_020adc90
    mov r6, r0
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    ldr r1, [r4, #0x48]
    mov r5, r0
    ldr r0, [r1, #0xc]
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x7000
    mov r1, #0x0
    umull r8, r7, r6, r0
    mla r7, r6, r1, r7
    mov r3, r6, asr #0x1f
    adds r6, r8, #0x800
    mla r7, r3, r0, r7
    adc r3, r7, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    str r6, [r4, #0x88]
    umull r6, r3, r5, r0
    mla r3, r5, r1, r3
    mov r2, r5, asr #0x1f
    mla r3, r2, r0, r3
    adds r2, r6, #0x800
    adc r0, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r4, #0x8c]
    ldr r0, [r4, #0x48]
    strh r1, [r0, #0x40]
    ldr r0, [r4, #0x80]
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc16c
    ldrsh r0, [r4, #0xba]
    mov r1, #0xa
    bl func_020befec
    mov r6, r0
    ldr r0, [r4, #0xac]
    mov r7, #0x0
    cmp r0, #0x0
    mov r1, #0x80
    bne L_02205d4c
    mov r2, #0x8
    ldr r0, L_02205f58
    strh r2, [r4, #0xb6]
    bl ActorRuntimeFlags_Test
    cmp r0, #0x0
    ldreqsh r0, [r4, #0xba]
    subeq r0, r0, #0xa
    streqh r0, [r4, #0xba]
    ldr r1, [r4, #0x80]
    mov r0, #0x8
    str r0, [r1, #0x44]
    mov r0, #0x4
    str r0, [r1, #0x48]
    b L_02205dc8
L_02205d4c:
    mov r2, #0x23
    ldr r0, L_02205f58
    strh r2, [r4, #0xb6]
    bl ActorRuntimeFlags_Test
    cmp r0, #0x0
    ldreqsh r0, [r4, #0xba]
    subeq r0, r0, #0x1e
    streqh r0, [r4, #0xba]
    ldr r1, [r4, #0x50]
    add r0, sp, #0x0
    add r1, r1, #0x1c
    bl func_02005030
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x80]
    ldrh r2, [r0, #0x40]
    ldr r0, [r1, #0xc]
    add r1, sp, #0x0
    mov r2, r2, asr #0x1
    and r2, r2, #0xff
    mov r3, #0x1
    bl func_ov049_0220bbdc
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
    str r0, [r4, #0xac]
    ldr r1, [r4, #0x80]
    mov r0, #0x10
    str r0, [r1, #0x44]
    mov r0, #0x4
    str r0, [r1, #0x48]
    mov r7, #0x1
L_02205dc8:
    ldrsh r0, [r4, #0xb6]
    mov r1, #0xa
    add r0, r0, #0x46
    strh r0, [r4, #0xb4]
    ldrsh r0, [r4, #0xba]
    cmp r0, #0x0
    movlt r0, #0x0
    strlth r0, [r4, #0xba]
    ldrsh r0, [r4, #0xba]
    bl func_020befec
    mov r8, r0
    mov r5, #0x1
    mov r9, #0x0
    b L_02205e44
L_02205e00:
    add r0, r4, r8, lsl #0x2
    ldr r0, [r0, #0x58]
    ldr r1, [r4, #0x48]
    add r0, r0, #0x2c
    add r1, r1, #0x2c
    bl func_020050c8
    add r2, r4, r8, lsl #0x2
    ldr r0, [r2, #0x58]
    mov r1, r9
    strh r5, [r0, #0x40]
    ldr r0, [r2, #0x58]
    bl func_0209a2a4
    ldr r0, [r4, #0x80]
    mov r1, r8
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc19c
    add r8, r8, #0x1
L_02205e44:
    cmp r8, r6
    blt L_02205e00
    ldrsh r0, [r4, #0xba]
    cmp r0, #0x0
    ble L_02205ed4
    cmp r7, #0x0
    beq L_02205e9c
    ldr r0, [r4, #0x80]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne L_02205e9c
    ldr r0, L_02205f5c
    ldr r1, L_02205f60
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    ldr r0, L_02205f5c
    ldr r1, L_02205f60
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    bl Sound_Play
    b L_02205f28
L_02205e9c:
    bl genrand_int32
    tst r0, #0x1
    mov r1, #0x63
    beq L_02205ec0
    ldr r0, L_02205f5c
    mov r2, #0xf
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_02205f28
L_02205ec0:
    ldr r0, L_02205f5c
    mov r2, #0x10
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_02205f28
L_02205ed4:
    ldr r0, [r4, #0x48]
    mov r1, #0x18
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, #0x0
    str r1, [r4, #0x88]
    sub r0, r1, #0x4000
    str r0, [r4, #0x8c]
    mov r0, #0x28
    strh r0, [r4, #0xb8]
    ldr r2, [r4, #0x80]
    mov r3, #0x21
    ldr r0, L_02205f5c
    str r3, [r2, #0x74]
    ldr r0, [r0, #0x0]
    bl func_02058d40
    ldr r0, L_02205f5c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2d
    bl Sound_Play
L_02205f28:
    ldr r0, L_02205f5c
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
    ldr r0, L_02205f5c
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl func_0205940c
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02205f58: .word gActorRuntimeFlags
L_02205f5c: .word gSoundContext
L_02205f60: .word 0x1c5
    .size func_ov039_02205c18, .-func_ov039_02205c18

