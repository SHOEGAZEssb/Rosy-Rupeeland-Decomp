; Matching retail form; see src/game/attachment_visibility_toggle.c.
.text

    .global func_02035518
    .type func_02035518, @function
func_02035518: ; 0x02035518
    cmp r1, #0x0
    ldr r1, [r0, #0x4]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
    .size func_02035518, . - func_02035518

    .global func_02035538

