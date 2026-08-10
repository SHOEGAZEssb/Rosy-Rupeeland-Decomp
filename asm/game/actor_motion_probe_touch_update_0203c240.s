; Matching retail form; see src/game/actor_motion_probe_touch_update.c.
.text
.extern data_020c9670
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern func_02031758
.extern func_02031cac
.extern func_020befec
.extern func_020bf1f8
.extern gSceneTouchInitialData
.extern genrand_int32
    .global ActorMotionProbe_UpdateTouchMotion
    .type ActorMotionProbe_UpdateTouchMotion, @function
ActorMotionProbe_UpdateTouchMotion: ; 0x0203c240
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r8, r1
    mov r9, r0
    bl func_02031758
    ldr r1, [r8, #0x54]
    ldr r0, [r8, #0x240]
    ldrsh r5, [r1, #0x2c]
    ldrsh r6, [r1, #0x2e]
    subs r0, r0, #0x1
    str r0, [r8, #0x240]
    bpl .L_0203c34c
    ldr r0, [r8, #0x24c]
    str r0, [r8, #0x240]
    ldr r4, [r8, #0x244]
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    add r0, r4, r4, lsr #0x1f
    sub r1, r1, r0, asr #0x1
    ldr r0, [r8, #0x20c]
    mov r2, r1, lsl #0xc
    smull r1, r0, r2, r0
    adds r1, r1, #0x800
    ldr r7, [r8, #0x248]
    adc r0, r0, #0x0
    mov r4, r1, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    bl genrand_int32
    mov r1, r7
    bl func_020bf1f8
    add r0, r7, r7, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    mov r7, r0, lsl #0xc
    ldr r2, [r8, #0x20c]
    mov r1, r4
    smull r4, r2, r7, r2
    adds r7, r4, #0x800
    adc r4, r2, #0x0
    mov r2, r7, lsr #0xc
    add r0, sp, #0x1c
    mov r3, #0x0
    orr r2, r2, r4, lsl #0x14
    bl VecFx32Object_InitComponents
    add r0, sp, #0xc
    add r1, sp, #0x1c
    add r2, r8, #0x210
    bl VecFx32_Subtract
    add r0, r8, #0x230
    add r1, sp, #0xc
    bl VecFx32Object_Assign
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
    ldr r0, [r8, #0x234]
    ldr r1, [r8, #0x24c]
    bl func_020befec
    str r0, [r8, #0x234]
    ldr r0, [r8, #0x238]
    ldr r1, [r8, #0x24c]
    bl func_020befec
    str r0, [r8, #0x238]
    add r0, r8, #0x220
    add r1, sp, #0x1c
    bl VecFx32Object_Assign
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    b .L_0203c358
.L_0203c34c:
    add r0, r8, #0x210
    add r1, r8, #0x230
    bl VecFx32Object_Add
.L_0203c358:
    add r0, r8, #0x200
    ldrh r3, [r0, #0x8]
    ldr r1, [r8, #0x254]
    ldr r2, .L_0203c408
    add r1, r3, r1
    strh r1, [r0, #0x8]
    ldrh r3, [r0, #0x8]
    ldr r1, [r8, #0x250]
    ldr r0, [r8, #0x20c]
    mov r3, r3, asr #0x4
    mul r0, r1, r0
    mov r3, r3, lsl #0x2
    ldrsh r3, [r2, r3]
    ldr r1, [r8, #0x214]
    ldr r2, [r8, #0x218]
    smull r4, r0, r3, r0
    adds r4, r4, #0x800
    adc r3, r0, #0x0
    mov r0, r4, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    add r3, r2, r0
    ldr r2, [r8, #0x54]
    add r1, r5, r1, asr #0xc
    strh r1, [r2, #0x2c]
    add r1, r6, r3, asr #0xc
    strh r1, [r2, #0x2e]
    ldr r1, [r8, #0x214]
    ldr r2, .L_0203c40c
    add r1, r5, r1, asr #0xc
    str r1, [r9, #0x4]
    ldr r3, [r8, #0x218]
    add r1, sp, #0x0
    add r0, r3, r0
    add r0, r6, r0, asr #0xc
    str r0, [r9, #0x8]
    str r2, [sp, #0x0]
    ldr r2, [r9, #0x4]
    mov r0, r8
    str r2, [sp, #0x4]
    ldr r2, [r9, #0x8]
    str r2, [sp, #0x8]
    bl func_02031cac
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0203c408: .word data_020c9670
.L_0203c40c: .word gSceneTouchInitialData

    .size ActorMotionProbe_UpdateTouchMotion, . - ActorMotionProbe_UpdateTouchMotion

