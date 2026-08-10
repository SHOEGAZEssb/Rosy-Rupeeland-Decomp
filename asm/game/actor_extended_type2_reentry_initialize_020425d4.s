; Matching retail form; see src/game/actor_extended_type2_reentry_initialize.c.
.text
.extern data_020c9670
.extern data_020df9e8
.extern data_021052fc
.extern gActorExtendedType2ReentryAngleAccumulator
.extern ActorMotionAreaFollower_GetPosition
.extern ActorRuntimeTriple_Assign
.extern Actor_SetPosition
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern func_020ada8c
.extern genrand_int32
.global ActorExtendedType2_InitializeReentryState
.type ActorExtendedType2_InitializeReentryState, @function
ActorExtendedType2_InitializeReentryState: ; 0x020425d4
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x1c
    mov r4, r0
    mov r5, r2
    bl Actor_SetPosition
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    str r1, [r4, #0x264]
    bl ActorRuntimeTriple_Assign
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl ActorRuntimeTriple_Assign
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl ActorRuntimeTriple_Assign
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    bgt .L_02042648
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    b .L_020427e8
.L_02042648:
    ldr r2, [r4, #0x54]
    ldr r0, .L_020427fc
    ldrh r1, [r2, #0x24]
    cmp r5, #0x0
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x1d0]
    ldr r0, [r0, #0x1d4]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
    bne .L_020426b0
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x10
    bl func_020ada8c
    rsb r0, r0, #0x8
    mov r0, r0, lsl #0xb
    str r0, [r4, #0x3c]
    mov r0, #0x0
    str r0, [r4, #0x40]
    bl genrand_int32
    ldr r1, .L_02042800
    and r0, r0, r1
    add r0, r0, #0x2000
    str r0, [r4, #0x44]
    b .L_0204277c
.L_020426b0:
    bl genrand_int32
    ldr r2, .L_02042804
    ldr r1, .L_02042800
    ldrh r3, [r2, #0x0]
    and r0, r0, r1
    add r0, r0, #0x99
    add r0, r0, #0x1900
    add r0, r3, r0
    strh r0, [r2, #0x0]
    ldrh r0, [r2, #0x0]
    mov r3, #0x0
    cmp r0, #0x8000
    subhi r0, r0, #0x8000
    strhih r0, [r2, #0x0]
    ldr r0, .L_02042804
    ldr r2, .L_02042808
    ldrh r1, [r0, #0x0]
    mov r0, #0x2800
    mov r1, r1, asr #0x4
    mov r5, r1, lsl #0x1
    add r1, r5, #0x1
    mov r1, r1, lsl #0x1
    ldrsh lr, [r2, r1]
    mov r1, r5, lsl #0x1
    ldrsh r2, [r2, r1]
    umull r6, r5, lr, r0
    mla r5, lr, r3, r5
    umull r1, ip, r2, r0
    mla ip, r2, r3, ip
    mov lr, lr, asr #0x1f
    mov r2, r2, asr #0x1f
    mla r5, lr, r0, r5
    mla ip, r2, r0, ip
    adds r6, r6, #0x800
    adc r5, r5, #0x0
    adds lr, r1, #0x800
    mov r1, r6, lsr #0xc
    adc ip, ip, #0x0
    mov r2, lr, lsr #0xc
    add r0, sp, #0xc
    orr r1, r1, r5, lsl #0x14
    orr r2, r2, ip, lsl #0x14
    bl VecFx32Object_InitComponents
    mov r0, r4
    ldr r3, [r0, #0x0]
    add r1, sp, #0xc
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
.L_0204277c:
    add r0, r4, #0x200
    mov r1, #0x78
    strh r1, [r0, #0x5a]
    mov r1, #0x14
    mov r0, r4
    strh r1, [r4, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, .L_0204280c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r4
    ldr r3, [r1, #0x0]
    mov r2, r0
    ldr r3, [r3, #0x58]
    add r0, sp, #0x0
    blx r3
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x90000
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
.L_020427e8:
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x20000
    str r0, [r4, #0xd0]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_020427fc: .word data_020df9e8
.L_02042800: .word 0xfff
.L_02042804: .word gActorExtendedType2ReentryAngleAccumulator
.L_02042808: .word data_020c9670
.L_0204280c: .word data_021052fc
.size ActorExtendedType2_InitializeReentryState, . - ActorExtendedType2_InitializeReentryState
