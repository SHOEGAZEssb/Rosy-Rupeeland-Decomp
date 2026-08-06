; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern func_02005cc8
.extern func_02025bdc

    .global func_02025fc4
    .type func_02025fc4, @function
func_02025fc4: ; 0x02025fc4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc8
    bl func_02005cc8
    mov r0, r4
    bl func_02025bdc
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02025fc4, . - func_02025fc4
