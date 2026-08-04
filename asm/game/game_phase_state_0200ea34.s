; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern func_0201de8c

    .global func_0200ea34
func_0200ea34: ; 0x0200ea34
    ldr ip, L_0200ea44
    add r0, r0, #0x358
    add r0, r0, #0x2c00
    bx ip
L_0200ea44: .word func_0201de8c
    .size func_0200ea34, . - func_0200ea34

