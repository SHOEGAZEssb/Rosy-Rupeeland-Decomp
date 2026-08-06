; Matching retail form; see src/game/main_dual_layer_resource_renderer.c.
.text
.extern func_02029648
.extern func_0202bf4c

    .global func_0202bf34
    .type func_0202bf34, @function
func_0202bf34: ; 0x0202bf34
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029648
    mov r0, r4
    bl func_0202bf4c
    ldmia sp!, {r4, pc}
    .size func_0202bf34, . - func_0202bf34
