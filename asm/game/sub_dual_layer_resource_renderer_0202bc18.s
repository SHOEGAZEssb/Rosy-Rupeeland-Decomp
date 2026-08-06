; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern func_020291b8
.extern data_020debd4

    .global func_0202bc18
    .type func_0202bc18, @function
func_0202bc18: ; 0x0202bc18
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020291b8
    ldr r1, .L_0202bc34
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202bc34: .word data_020debd4
    .size func_0202bc18, . - func_0202bc18
