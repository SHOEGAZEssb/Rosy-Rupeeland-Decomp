; Matching retail form; see src/game/sprite_motion_delta.c.
.text

.global func_02020364
    .type func_02020364, @function
func_02020364: ; 0x02020364
    mov r1, #0x0
    strh r1, [r0, #0xc]
    strh r1, [r0, #0xe]
    bx lr
    .size func_02020364, .-func_02020364
