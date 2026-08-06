; Matching retail form; see src/game/actor_motion_probe_configuration.c.
.text
    .global func_0203c410
    .type func_0203c410, @function
func_0203c410: ; 0x0203c410
    str r1, [r0, #0x20c]
    bx lr
    .size func_0203c410, . - func_0203c410

    .global func_0203c418
    .type func_0203c418, @function
func_0203c418: ; 0x0203c418
    str r1, [r0, #0x244]
    str r2, [r0, #0x248]
    ldr r2, [sp, #0x0]
    str r3, [r0, #0x24c]
    ldr r1, [sp, #0x4]
    str r2, [r0, #0x250]
    str r1, [r0, #0x254]
    bx lr
    .size func_0203c418, . - func_0203c418
