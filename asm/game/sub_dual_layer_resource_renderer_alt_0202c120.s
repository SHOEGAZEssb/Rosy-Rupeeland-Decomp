; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern func_02029648
.extern func_0202c138

    .global func_0202c120
    .type func_0202c120, @function
func_0202c120: ; 0x0202c120
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029648
    mov r0, r4
    bl func_0202c138
    ldmia sp!, {r4, pc}
    .size func_0202c120, . - func_0202c120
