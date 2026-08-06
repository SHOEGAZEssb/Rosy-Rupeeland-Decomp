; Matching retail form; see src/game/tracked_resource_actor_impulse_ground_stop.c.
.text
    .global func_02051fa4
func_02051fa4:
    ldr r2, [r0, #0x24]
    ldr r1, [r0, #0x1dc]
    cmp r2, r1
    movle r1, #0x0
    strle r1, [r0, #0x40]
    strle r1, [r0, #0x3c]
    bx lr
    .size func_02051fa4, . - func_02051fa4
