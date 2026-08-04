; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern func_02011498

    .global func_02011470
func_02011470: ; 0x02011470
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_02011498
    ldr r1, [r4, #0x8]
    mov r0, r4
    bic r1, r1, #0xff
    orr r1, r1, #0xff
    str r1, [r4, #0x8]
    ldmia sp!, {r4, pc}
    .size func_02011470, . - func_02011470

