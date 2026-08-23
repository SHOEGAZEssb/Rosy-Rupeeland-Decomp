; Matching retail form; see src/game/actor_vector_damping.c.
.text

    .global VecFx32Object_ScaleInPlaceRounded
    .type VecFx32Object_ScaleInPlaceRounded, @function
VecFx32Object_ScaleInPlaceRounded: ; 0x020328d0
    ldr r2, [r0, #0x4]
    smull ip, r3, r2, r1
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x4]
    ldr r2, [r0, #0x8]
    smull ip, r3, r2, r1
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x8]
    ldr r2, [r0, #0xc]
    smull r3, r1, r2, r1
    adds r2, r3, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r0, #0xc]
    bx lr
    .size VecFx32Object_ScaleInPlaceRounded, . - VecFx32Object_ScaleInPlaceRounded
