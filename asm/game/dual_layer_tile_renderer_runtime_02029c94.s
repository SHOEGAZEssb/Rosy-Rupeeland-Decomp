; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern func_0202b9bc

    .global func_02029c94
    .type func_02029c94, @function
func_02029c94: ; 0x02029c94
    ldr ip, .L_02029ca0
    add r0, r0, #0x60
    bx ip
.L_02029ca0: .word func_0202b9bc
    .size func_02029c94, . - func_02029c94

