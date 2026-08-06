; Matching retail form; see src/game/actor_orientation_animation_control.c.
.text
.extern func_02072b68

    .global func_02034be4
    .type func_02034be4, @function
func_02034be4: ; 0x02034be4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x54]
    mov r4, r1
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    cmp r1, #0x0
    beq .L_02034c58
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02034c58:
    cmp r4, #0x0
    bge .L_02034ccc
    rsb r4, r4, #0x0
    ldr r0, [r5, #0x54]
    and r1, r4, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x54]
    tst r0, #0x10
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x40
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    and r1, r4, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x58]
    tst r0, #0x10
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x40
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x40
    streqh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.L_02034ccc:
    ldr r0, [r5, #0x54]
    and r1, r4, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x54]
    tst r0, #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    and r1, r4, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x58]
    tst r0, #0x10
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x40
    streqh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02034be4, . - func_02034be4

    .global func_02034d34

