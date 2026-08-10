; Matching retail form; see src/game/actor_extended_type2_descriptor_helpers.c.
.text
.extern data_020e8380
.extern data_020e83a8
.extern data_020e83aa
.extern data_020e83ac
.extern func_020536b8
.extern func_02053728
.extern func_02053780
.global ActorExtendedType2_UpdateDescriptorQueryFlags
.type ActorExtendedType2_UpdateDescriptorQueryFlags, @function
ActorExtendedType2_UpdateDescriptorQueryFlags: ; 0x02043534
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020536b8
    cmp r0, #0x0
    beq .L_02043578
    ldrh r3, [r4, #0x4e]
    ldr r2, .L_020435d4
    mov r1, #0x30
    mla r1, r3, r1, r2
    ldr r0, [r0, #0x1f8]
    ldrsh r1, [r1, #0x2e]
    ldrsb r0, [r0, #0x9]
    mov r1, r1, lsl #0x18
    cmp r0, r1, asr #0x1c
    ldrge r0, [r4, #0x260]
    orrge r0, r0, #0x100
    strge r0, [r4, #0x260]
.L_02043578:
    mov r0, r4
    bl func_02053728
    cmp r0, #0x0
    ldrne r0, [r4, #0x260]
    orrne r0, r0, #0x200
    strne r0, [r4, #0x260]
    mov r0, r4
    bl func_02053780
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r3, [r4, #0x4e]
    ldr r2, .L_020435d4
    mov r1, #0x30
    mla r1, r3, r1, r2
    ldr r0, [r0, #0x1f8]
    ldrsh r1, [r1, #0x2e]
    ldrsb r0, [r0, #0x9]
    mov r1, r1, lsl #0x14
    cmp r0, r1, asr #0x1c
    addge r0, r4, #0x200
    movge r1, #0xf
    strgeh r1, [r0, #0x5c]
    ldmia sp!, {r4, pc}
.L_020435d4: .word data_020e8380

.size ActorExtendedType2_UpdateDescriptorQueryFlags, . - ActorExtendedType2_UpdateDescriptorQueryFlags

.global ActorExtendedType2_GetDescriptorValue28
.type ActorExtendedType2_GetDescriptorValue28, @function
ActorExtendedType2_GetDescriptorValue28: ; 0x020435d8
    ldrh r2, [r0, #0x4e]
    mov r0, #0x30
    ldr r1, .L_020435f0
    mul r0, r2, r0
    ldrsh r0, [r1, r0]
    bx lr
.L_020435f0: .word data_020e83a8

.size ActorExtendedType2_GetDescriptorValue28, . - ActorExtendedType2_GetDescriptorValue28

.global ActorExtendedType2_GetDescriptorValue2A
.type ActorExtendedType2_GetDescriptorValue2A, @function
ActorExtendedType2_GetDescriptorValue2A: ; 0x020435f4
    ldrh r2, [r0, #0x4e]
    mov r0, #0x30
    ldr r1, .L_0204360c
    mul r0, r2, r0
    ldrsh r0, [r1, r0]
    bx lr
.L_0204360c: .word data_020e83aa

.size ActorExtendedType2_GetDescriptorValue2A, . - ActorExtendedType2_GetDescriptorValue2A

.global ActorExtendedType2_GetDescriptorValue2C
.type ActorExtendedType2_GetDescriptorValue2C, @function
ActorExtendedType2_GetDescriptorValue2C: ; 0x02043610
    ldrh r2, [r0, #0x4e]
    mov r0, #0x30
    ldr r1, .L_02043628
    mul r0, r2, r0
    ldrsh r0, [r1, r0]
    bx lr
.L_02043628: .word data_020e83ac
.size ActorExtendedType2_GetDescriptorValue2C, . - ActorExtendedType2_GetDescriptorValue2C
