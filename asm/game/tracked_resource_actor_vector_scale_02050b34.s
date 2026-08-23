; Matching retail form; see src/game/tracked_resource_actor_vector_scale.c.
.extern func_020adc90
.text
    .global VecFx32Object_DivideInPlaceByScalar
VecFx32Object_DivideInPlaceByScalar:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    bl func_020adc90
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_020adc90
    str r0, [r5, #0x8]
    ldr r0, [r5, #0xc]
    mov r1, r4
    bl func_020adc90
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size VecFx32Object_DivideInPlaceByScalar, . - VecFx32Object_DivideInPlaceByScalar
