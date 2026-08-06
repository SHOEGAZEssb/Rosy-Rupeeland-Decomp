; Matching retail form; see src/game/main_bg2_resource_renderer.c.
.text
.extern func_02029648
.extern func_0202c7c4

    .global func_0202c7ac
    .type func_0202c7ac, @function
func_0202c7ac: ; 0x0202c7ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02029648
    mov r0, r4
    bl func_0202c7c4
    ldmia sp!, {r4, pc}
    .size func_0202c7ac, . - func_0202c7ac
