; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern func_02029648
.extern func_0202c574

    .global func_0202c55c
    .type func_0202c55c, @function
func_0202c55c: ; 0x0202c55c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029648
    mov r0, r4
    bl func_0202c574
    ldmia sp!, {r4, pc}
    .size func_0202c55c, . - func_0202c55c
