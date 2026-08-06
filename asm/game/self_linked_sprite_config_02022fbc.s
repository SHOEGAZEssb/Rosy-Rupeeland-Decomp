; Matching retail form; see src/game/self_linked_sprite_config.c.
.text
.global func_02022fbc
    .type func_02022fbc, @function
func_02022fbc:
    mov r2, #0x0
    strh r2, [r0, #0x0]
    strh r2, [r0, #0x2]
    strh r2, [r0, #0x4]
    strh r2, [r0, #0x6]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r0, [r0, #0x14]
    mov r1, #0x1
    str r1, [r0, #0x18]
    str r0, [r0, #0x1c]
    str r2, [r0, #0x20]
    bx lr
    .size func_02022fbc, .-func_02022fbc
