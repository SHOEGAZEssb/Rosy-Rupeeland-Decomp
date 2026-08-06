; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern func_0201e28c

    .global func_020287a4
    .type func_020287a4, @function
func_020287a4: ; 0x020287a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020287a4, . - func_020287a4

