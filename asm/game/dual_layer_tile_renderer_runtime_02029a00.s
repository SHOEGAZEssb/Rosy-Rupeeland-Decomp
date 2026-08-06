; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern func_0202a708

    .global func_02029a00
    .type func_02029a00, @function
func_02029a00: ; 0x02029a00
    ldr ip, .L_02029a18
    add r0, r0, r1, lsl #0x2
    mov r1, r2
    ldr r0, [r0, #0x28]
    mov r2, r3
    bx ip
.L_02029a18: .word func_0202a708
    .size func_02029a00, . - func_02029a00

