; Matching retail form; see src/game/actor_extended_type2_descriptor_copy.c.
.text
.extern data_020e8380
.extern gGamePhaseRuntime
    .global ActorExtendedType2_CopyAdjustedDescriptor
    .type ActorExtendedType2_CopyAdjustedDescriptor, @function
ActorExtendedType2_CopyAdjustedDescriptor: ; 0x0203f2ec
    stmdb sp!, {r4, lr}
    ldrh r3, [r0, #0x4e]
    mov r2, #0x30
    ldr lr, .L_0203f498
    mul ip, r3, r2
    ldrsh r2, [lr, ip]
    mov r4, r1
    add r1, lr, ip
    strh r2, [r4, #0x0]
    ldrsh r2, [r1, #0x2]
    strh r2, [r4, #0x2]
    ldrsh r2, [r1, #0x4]
    strh r2, [r4, #0x4]
    ldrh r2, [r1, #0x6]
    strh r2, [r4, #0x6]
    ldrsh r2, [r1, #0x8]
    strh r2, [r4, #0x8]
    ldrsh r2, [r1, #0xa]
    strh r2, [r4, #0xa]
    ldrsh r2, [r1, #0xc]
    strh r2, [r4, #0xc]
    ldrsh r2, [r1, #0xe]
    strh r2, [r4, #0xe]
    ldrsh r2, [r1, #0x10]
    strh r2, [r4, #0x10]
    ldrsh r2, [r1, #0x12]
    strh r2, [r4, #0x12]
    ldrh r2, [r1, #0x14]
    strh r2, [r4, #0x14]
    ldrsh r2, [r1, #0x16]
    strh r2, [r4, #0x16]
    ldrh r2, [r1, #0x18]
    strh r2, [r4, #0x18]
    ldrh r2, [r1, #0x1a]
    strh r2, [r4, #0x1a]
    ldrh r2, [r1, #0x1c]
    strh r2, [r4, #0x1c]
    ldrh r2, [r1, #0x1e]
    strh r2, [r4, #0x1e]
    ldrsh r2, [r1, #0x20]
    strh r2, [r4, #0x20]
    ldrsh r2, [r1, #0x22]
    strh r2, [r4, #0x22]
    ldrsb r2, [r1, #0x24]
    strb r2, [r4, #0x24]
    ldrsb r2, [r1, #0x25]
    strb r2, [r4, #0x25]
    ldrh r2, [r1, #0x26]
    strh r2, [r4, #0x26]
    ldrsh r2, [r1, #0x28]
    strh r2, [r4, #0x28]
    ldrsh r2, [r1, #0x2a]
    strh r2, [r4, #0x2a]
    ldrsh r2, [r1, #0x2c]
    strh r2, [r4, #0x2c]
    ldrsh r1, [r1, #0x2e]
    strh r1, [r4, #0x2e]
    ldr r1, [r0, #0x260]
    tst r1, #0x200
    ldrneh r0, [r4, #0x1a]
    bicne r0, r0, #0x1
    strneh r0, [r4, #0x1a]
    bne .L_0203f42c
    ldr r0, [r0, #0x14]
    tst r0, #0x10000
    bne .L_0203f420
    tst r0, #0x20000
    beq .L_0203f42c
    ldr r0, .L_0203f49c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_0203f42c
.L_0203f420:
    ldrh r0, [r4, #0x1a]
    orr r0, r0, #0x1
    strh r0, [r4, #0x1a]
.L_0203f42c:
    ldrh r0, [r4, #0x1a]
    tst r0, #0x80
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_0203f49c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0203f488
    ldr r0, .L_0203f49c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_0203f488:
    ldrh r0, [r4, #0x1a]
    orr r0, r0, #0x4
    strh r0, [r4, #0x1a]
    ldmia sp!, {r4, pc}
.L_0203f498: .word data_020e8380
.L_0203f49c: .word gGamePhaseRuntime
    .size ActorExtendedType2_CopyAdjustedDescriptor, . - ActorExtendedType2_CopyAdjustedDescriptor

