; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern func_02074110
.extern func_020755bc

    .global func_0202836c
    .type func_0202836c, @function
func_0202836c: ; 0x0202836c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    bl func_020755bc
    ldr r0, [r4, #0x34]
    bl func_02074110
    ldmia sp!, {r4, pc}
    .size func_0202836c, . - func_0202836c

