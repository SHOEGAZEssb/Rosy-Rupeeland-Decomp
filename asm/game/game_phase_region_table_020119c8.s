; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text
.extern GameWork_TestFlag
.extern gGameWork

    .global func_020119c8
func_020119c8: ; 0x020119c8
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    movlt r0, #0x1
    ldmltia sp!, {r3, pc}
    ldr r0, L_020119f0
    add r1, r2, r1
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    ldmia sp!, {r3, pc}
L_020119f0: .word gGameWork
    .size func_020119c8, . - func_020119c8

