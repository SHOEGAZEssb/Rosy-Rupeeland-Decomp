; Matching retail form; see src/game/actor_descriptor_callback_dispatch.c.
.text

    .global func_02034260
    .type func_02034260, @function
func_02034260: ; 0x02034260
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x2c]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r3, [r0, #0x54]
    cmp r3, #0x0
    beq .L_02034298
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r3, [r0, #0x54]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x1
    strh r2, [r3, #0x24]
.L_02034298:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x2c]
    ldr r2, [r2, #0x74]
    blx r2
    ldmia sp!, {r3, pc}
    .size func_02034260, . - func_02034260

    .global Actor_EnsureAuxiliaryCollisionResource
