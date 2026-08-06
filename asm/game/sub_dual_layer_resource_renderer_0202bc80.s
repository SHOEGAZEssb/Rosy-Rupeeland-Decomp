; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern func_02029648
.extern func_0202bc98

    .global func_0202bc80
    .type func_0202bc80, @function
func_0202bc80: ; 0x0202bc80
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029648
    mov r0, r4
    bl func_0202bc98
    ldmia sp!, {r4, pc}
    .size func_0202bc80, . - func_0202bc80
