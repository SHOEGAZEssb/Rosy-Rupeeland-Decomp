; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern func_020292f0

    .global func_0202c764
    .type func_0202c764, @function
func_0202c764: ; 0x0202c764
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020292f0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202c764, . - func_0202c764
