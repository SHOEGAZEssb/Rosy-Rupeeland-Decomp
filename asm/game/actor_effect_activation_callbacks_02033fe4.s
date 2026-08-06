; Matching retail form; see src/game/actor_effect_activation_callbacks.c.
.text
.extern data_02105310
.extern func_0200b04c
.extern func_0200b294

    .global func_02033fe4
    .type func_02033fe4, @function
func_02033fe4: ; 0x02033fe4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_02034040
    bl func_0200b294
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, .L_02034040
    bl func_0200b04c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x78]
    blx r2
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02034040: .word data_02105310
    .size func_02033fe4, . - func_02033fe4

    .global func_02034044

