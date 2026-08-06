; Matching retail form; see src/game/sub_three_layer_resource_renderer.c.
.text
.extern func_020292f0

    .global func_0202c8c8
    .type func_0202c8c8, @function
func_0202c8c8: ; 0x0202c8c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020292f0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c8c8, . - func_0202c8c8
