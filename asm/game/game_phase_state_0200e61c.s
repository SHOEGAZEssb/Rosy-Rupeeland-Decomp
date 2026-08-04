; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern func_0201df64
.extern func_0201e0ec
.extern func_0202d380
.extern func_0203abb0
.extern func_020a2324

    .global func_0200e61c
func_0200e61c: ; 0x0200e61c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201df64
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201e0ec
    bl func_020a2324
    bl func_0203abb0
    add r0, r4, #0x4
    bl func_0202d380
    ldmia sp!, {r4, pc}
    .size func_0200e61c, . - func_0200e61c

