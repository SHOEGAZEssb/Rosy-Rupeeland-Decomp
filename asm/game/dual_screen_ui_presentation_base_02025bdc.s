; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern data_020d6b3c
.extern func_02026514
.extern func_02071eb8
.extern func_02074330
.extern gDebugFont

    .global func_02025bdc
    .type func_02025bdc, @function
func_02025bdc: ; 0x02025bdc
    stmdb sp!, {r4, lr}
    ldr r1, .L_02025c14
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02025c18
    ldr r1, [r4, #0xa8]
    ldr r0, [r0, #0x0]
    bl func_02074330
    add r0, r4, #0xb8
    bl func_02071eb8
    add r0, r4, #0x4
    bl func_02026514
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02025c14: .word data_020d6b3c
.L_02025c18: .word gDebugFont
    .size func_02025bdc, . - func_02025bdc
