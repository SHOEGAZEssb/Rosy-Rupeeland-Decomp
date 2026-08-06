; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text

    .global func_02032c14
    .type func_02032c14, @function
func_02032c14: ; 0x02032c14
    ldr r2, [r0, #0x54]
    add r1, r0, #0x100
    ldrb r2, [r2, #0x38]
    strb r2, [r0, #0x194]
    ldr r2, [r0, #0x54]
    ldrb r2, [r2, #0x3a]
    strb r2, [r0, #0x195]
    ldr r2, [r0, #0x54]
    ldrh r2, [r2, #0x24]
    strh r2, [r1, #0x96]
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x200
    str r1, [r0, #0x10]
    bx lr
    .size func_02032c14, . - func_02032c14

