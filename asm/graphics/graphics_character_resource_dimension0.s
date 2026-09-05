.text
; Matching fallback for the portable implementation in src/graphics/graphics_character_resource_dimensions.c.

.global func_02070454
func_02070454:
    ldr r0, [r0, #0x28]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x16
    bx lr
.size func_02070454, . - func_02070454
