; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern data_020d6b3c
.extern func_02026514
.extern func_02071eb8
.extern func_02074330
.extern gDebugFont

    .global func_02025b54
    .type func_02025b54, @function
func_02025b54: ; 0x02025b54
    stmdb sp!, {r4, lr}
    ldr r1, .L_02025b8c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02025b90
    ldr r1, [r4, #0xa8]
    ldr r0, [r0, #0x0]
    bl func_02074330
    add r0, r4, #0xb8
    bl func_02071eb8
    add r0, r4, #0x4
    bl func_02026514
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02025b8c: .word data_020d6b3c
.L_02025b90: .word gDebugFont
    .size func_02025b54, . - func_02025b54
