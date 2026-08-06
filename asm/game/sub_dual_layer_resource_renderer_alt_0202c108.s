; Matching retail form; see src/game/sub_dual_layer_resource_renderer_alt.c.
.text
.extern func_02029370
.extern func_0202c138

    .global func_0202c108
    .type func_0202c108, @function
func_0202c108: ; 0x0202c108
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029370
    mov r0, r4
    bl func_0202c138
    ldmia sp!, {r4, pc}
    .size func_0202c108, . - func_0202c108
