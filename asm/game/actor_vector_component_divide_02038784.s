; Matching retail form; see src/game/actor_vector_component_divide.c.
.text
.extern VecFx32Object_Init
.extern func_020adc90

    .global VecFx32Object_DivideByScalar
    .type VecFx32Object_DivideByScalar, @function
VecFx32Object_DivideByScalar: ; 0x02038784
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl VecFx32Object_Init
    ldr r0, [r5, #0x4]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0x4]
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0x8]
    ldr r0, [r5, #0xc]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
    .size VecFx32Object_DivideByScalar, . - VecFx32Object_DivideByScalar
