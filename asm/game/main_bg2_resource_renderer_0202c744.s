; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern func_020291b8
.extern data_020dee2c

    .global func_0202c744
    .type func_0202c744, @function
func_0202c744: ; 0x0202c744
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020291b8
    ldr r1, .L_0202c760
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0202c760: .word data_020dee2c
    .size func_0202c744, . - func_0202c744
