; Matching retail form; see src/game/actor_derived_type1_special_mode.c.
.text
    .global ActorDerivedType1_ResetSpecialModeFlags
    .type ActorDerivedType1_ResetSpecialModeFlags, @function
ActorDerivedType1_ResetSpecialModeFlags: ; 0x02039db8
    ldr r2, [r0, #0xd0]
    add r1, r0, #0x200
    bic r2, r2, #0x4000
    str r2, [r0, #0xd0]
    ldr r3, [r0, #0x230]
    mov r2, #0x0
    bic r3, r3, #0x600000
    str r3, [r0, #0x230]
    strh r2, [r1, #0x68]
    bx lr
    .size ActorDerivedType1_ResetSpecialModeFlags, . - ActorDerivedType1_ResetSpecialModeFlags
