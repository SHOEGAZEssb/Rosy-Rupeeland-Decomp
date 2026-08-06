; Matching retail form; see src/game/byte_tile_map_owner.c.
.text

    .global func_0202bbf8
    .type func_0202bbf8, @function
func_0202bbf8: ; 0x0202bbf8
    ldr r2, [r0, #0x24]
    mov r1, r1, lsl #0x1f
    bic r2, r2, #0x2
    orr r1, r2, r1, lsr #0x1e
    str r1, [r0, #0x24]
    bx lr
    .size func_0202bbf8, . - func_0202bbf8
