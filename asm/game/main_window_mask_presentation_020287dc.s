; Matching retail form; see src/game/main_window_mask_presentation.c.
.text


    .global func_020287dc
    .type func_020287dc, @function
func_020287dc: ; 0x020287dc
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0xe000
    orr r0, r0, #0x8000
    str r0, [r1, #0x0]
    ldrh r0, [r1, #0x4a]
    bic r0, r0, #0x3f00
    orr r0, r0, #0x1d00
    strh r0, [r1, #0x4a]
    ldrh r0, [r1, #0x4a]
    bic r0, r0, #0x3f
    orr r0, r0, #0x3f
    strh r0, [r1, #0x4a]
    bx lr
    .size func_020287dc, . - func_020287dc

