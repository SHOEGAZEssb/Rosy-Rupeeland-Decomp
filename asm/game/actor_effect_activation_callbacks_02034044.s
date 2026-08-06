; Matching retail form; see src/game/actor_effect_activation_callbacks.c.
.text

    .global func_02034044
    .type func_02034044, @function
func_02034044: ; 0x02034044
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x78]
    blx r2
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_02034044, . - func_02034044

    .global func_02034060

