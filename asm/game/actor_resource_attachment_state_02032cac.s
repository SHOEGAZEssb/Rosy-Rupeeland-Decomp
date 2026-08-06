; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text

    .global func_02032cac
    .type func_02032cac, @function
func_02032cac: ; 0x02032cac
    cmp r1, #0x0
    ldr r1, [r0, #0x10]
    orrne r1, r1, #0x100
    biceq r1, r1, #0x100
    str r1, [r0, #0x10]
    bx lr
    .size func_02032cac, . - func_02032cac

