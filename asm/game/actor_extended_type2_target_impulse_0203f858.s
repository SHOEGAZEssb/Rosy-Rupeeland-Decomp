; Matching retail form; see src/game/actor_extended_type2_target_impulse.c.
.text
.extern data_020c9670
.extern data_020e8380
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32_Subtract
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020ae024
    .global ActorExtendedType2_ApplyTargetImpulse
    .type ActorExtendedType2_ApplyTargetImpulse, @function
ActorExtendedType2_ApplyTargetImpulse: ; 0x0203f858
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x78
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    add r1, r5, #0x78
    add r2, r5, #0x18
    bl VecFx32_Subtract
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    bl func_0204cfa4
    cmp r0, #0x4000
    ble .L_0203f964
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_0203f9a4
    mov r0, #0x30
    mla r0, r2, r0, r1
    ldrh r0, [r0, #0x1e]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x12
    beq .L_0203f8c0
    cmp r0, #0x1
    beq .L_0203f8c8
    cmp r0, #0x2
    b .L_0203f8d0
.L_0203f8c0:
    mov r4, #0x2000
    b .L_0203f8d4
.L_0203f8c8:
    mov r4, #0x1000
    b .L_0203f8d4
.L_0203f8d0:
    mov r4, #0x800
.L_0203f8d4:
    mov r0, #0x100
    strh r0, [r5, #0xde]
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r2, .L_0203f9a8
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r0]
    mov r0, r3, lsl #0x1
    ldrsh r0, [r2, r0]
    smull r2, r3, r1, r4
    adds ip, r2, #0x800
    smull r2, r1, r0, r4
    adc r0, r3, #0x0
    mov r3, ip, lsr #0xc
    ldr r4, [r5, #0x8c]
    orr r3, r3, r0, lsl #0x14
    add r0, r4, r3
    adds r2, r2, #0x800
    str r0, [r5, #0x8c]
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r5, #0x90]
    add r0, r5, #0x8c
    add r3, r2, r1
    add r1, r5, #0x90
    mov r2, #0x6000
    str r3, [r5, #0x90]
    bl func_0204cff4
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
.L_0203f964:
    ldr r0, [r5, #0xd0]
    tst r0, #0x4
    beq .L_0203f994
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x94]
    strne r0, [r5, #0x90]
    strne r0, [r5, #0x8c]
.L_0203f994:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0203f9a4: .word data_020e8380
.L_0203f9a8: .word data_020c9670
    .size ActorExtendedType2_ApplyTargetImpulse, . - ActorExtendedType2_ApplyTargetImpulse

