; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern func_02011520

    .global func_0201155c
func_0201155c: ; 0x0201155c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02011520
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq L_0201157c
    mov r0, r4
    bl func_02011520
L_0201157c:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201155c, . - func_0201155c

