; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern func_020292f0

    .global func_0202bc38
    .type func_0202bc38, @function
func_0202bc38: ; 0x0202bc38
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020292f0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202bc38, . - func_0202bc38
