; Matching retail form; see src/game/actor_terrain_geometry_queries.c.
.text
.extern data_021052fc

    .global func_02034464
    .type func_02034464, @function
func_02034464: ; 0x02034464
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, [r0, #0x14]
    mov r3, #0x0
    strh r3, [sp, #0x8]
    tst r0, #0x4000000
    bne .L_020344a8
    ldr r0, .L_020344b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
.L_020344a8:
    ldr r0, [sp, #0x8]
    add sp, sp, #0xc
    ldmia sp!, {pc}
.L_020344b4: .word data_021052fc
    .size func_02034464, . - func_02034464

    .global Position_AdjustForTerrainHeight
