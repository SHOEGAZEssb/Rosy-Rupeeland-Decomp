; Matching retail form; see src/game/actor_derived_type1_special_mode.c.
.text
.extern GraphicsSpriteState_SetAnimationIndex
    .global ActorDerivedType1_SetSpecialModeEnabled
    .type ActorDerivedType1_SetSpecialModeEnabled, @function
ActorDerivedType1_SetSpecialModeEnabled: ; 0x02039d54
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r1, [r0, #0x230]
    beq .L_02039d9c
    orr r1, r1, #0x800000
    str r1, [r0, #0x230]
    ldr r2, [r0, #0x54]
    ldrb r1, [r2, #0x38]
    cmp r1, #0x7
    ldmgtia sp!, {r3, pc}
    ldrb r0, [r0, #0xd4]
    cmp r0, #0x7
    ldmhiia sp!, {r3, pc}
    add r1, r0, #0x8
    mov r0, r2
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, pc}
.L_02039d9c:
    tst r1, #0x800000
    bicne r1, r1, #0x800000
    strne r1, [r0, #0x230]
    ldrne r1, [r0, #0xd0]
    orrne r1, r1, #0x1000
    strne r1, [r0, #0xd0]
    ldmia sp!, {r3, pc}
    .size ActorDerivedType1_SetSpecialModeEnabled, . - ActorDerivedType1_SetSpecialModeEnabled
