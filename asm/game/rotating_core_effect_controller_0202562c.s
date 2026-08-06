; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text

    .global func_0202562c
    .type func_0202562c, @function
func_0202562c: ; 0x0202562c
    ldr r0, [r0, #0x8]
    add r0, r0, #0x200
    ldrh r1, [r0, #0xee]
    orr r1, r1, #0x4
    strh r1, [r0, #0xee]
    bx lr
    .size func_0202562c, . - func_0202562c
