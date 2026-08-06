; Matching retail form; see src/game/sub_dual_layer_resource_renderer_swapped.c.
.text
.extern func_020291b8
.extern data_020dedb4

    .global func_0202c4f4
    .type func_0202c4f4, @function
func_0202c4f4: ; 0x0202c4f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020291b8
    ldr r1, .L_0202c510
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c510: .word data_020dedb4
    .size func_0202c4f4, . - func_0202c4f4
