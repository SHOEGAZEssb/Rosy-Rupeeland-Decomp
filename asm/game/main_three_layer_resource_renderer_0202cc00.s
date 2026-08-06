; Matching retail form; see src/game/main_three_layer_resource_renderer.c.
.text
.extern func_020292f0

    .global func_0202cc00
    .type func_0202cc00, @function
func_0202cc00: ; 0x0202cc00
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020292f0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202cc00, . - func_0202cc00
