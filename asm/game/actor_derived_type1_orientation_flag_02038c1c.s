; Matching retail form; see src/game/actor_derived_type1_orientation_flag.c.
.text

    .global ActorDerivedType1_UpdateOrientationFlag
    .type ActorDerivedType1_UpdateOrientationFlag, @function
ActorDerivedType1_UpdateOrientationFlag: ; 0x02038c1c
    ldr r1, [r0, #0xc8]
    cmp r1, #0x0
    blt .L_02038c3c
    cmp r1, #0x8000
    ldrlt r1, [r0, #0x230]
    orrlt r1, r1, #0x80000000
    strlt r1, [r0, #0x230]
    bxlt lr
.L_02038c3c:
    ldr r1, [r0, #0x230]
    bic r1, r1, #0x80000000
    str r1, [r0, #0x230]
    bx lr
    .size ActorDerivedType1_UpdateOrientationFlag, . - ActorDerivedType1_UpdateOrientationFlag
