; Matching retail form; see src/game/game_phase_currency_hud_lifecycle.c.
.text
.extern data_020d4178
.extern func_02071e90

    .global func_02010854
func_02010854: ; 0x02010854
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4
    bl func_02071e90
    ldr r1, L_02010874
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
L_02010874: .word data_020d4178
    .size func_02010854, . - func_02010854

