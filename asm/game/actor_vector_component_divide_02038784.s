; Matching retail form; see src/game/actor_vector_component_divide.c.
.text
.extern func_02004fe0
.extern func_020adc90

    .global func_02038784
    .type func_02038784, @function
func_02038784: ; 0x02038784
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl func_02004fe0
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
    .size func_02038784, . - func_02038784
