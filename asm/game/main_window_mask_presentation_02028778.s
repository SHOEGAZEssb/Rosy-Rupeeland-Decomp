; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern data_020de838
.extern func_0201e250

    .global func_02028778
    .type func_02028778, @function
func_02028778: ; 0x02028778
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e250
    ldr r1, .L_020287a0
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x4]
    orr r1, r1, #0x2
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.L_020287a0: .word data_020de838
    .size func_02028778, . - func_02028778

