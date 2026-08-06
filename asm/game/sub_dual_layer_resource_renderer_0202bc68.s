; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern func_02029370
.extern func_0202bc98

    .global func_0202bc68
    .type func_0202bc68, @function
func_0202bc68: ; 0x0202bc68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029370
    mov r0, r4
    bl func_0202bc98
    ldmia sp!, {r4, pc}
    .size func_0202bc68, . - func_0202bc68
