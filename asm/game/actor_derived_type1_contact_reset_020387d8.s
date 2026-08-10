; Matching retail form; see src/game/actor_derived_type1_contact_reset.c.
.text
.extern Type7AuxiliaryPresentation_BeginShutdown

    .global ActorDerivedType1_ResetContactState
    .type ActorDerivedType1_ResetContactState, @function
ActorDerivedType1_ResetContactState: ; 0x020387d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x80
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    beq .L_02038808
    ldrb r1, [r0, #0x10]
    tst r1, #0x1
    beq .L_02038808
    bl Type7AuxiliaryPresentation_BeginShutdown
.L_02038808:
    ldr r1, [r4, #0xd0]
    add r0, r4, #0x200
    bic r1, r1, #0x8
    str r1, [r4, #0xd0]
    ldr r2, [r4, #0x230]
    mov r1, #0x0
    bic r2, r2, #0x140
    str r2, [r4, #0x230]
    strh r1, [r0, #0x50]
    strh r1, [r0, #0x68]
    ldmia sp!, {r4, pc}
    .size ActorDerivedType1_ResetContactState, . - ActorDerivedType1_ResetContactState
