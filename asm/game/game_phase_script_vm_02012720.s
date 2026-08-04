; Matching retail form; see src/game/game_phase_script_vm_runtime.c.
.text

    .global func_02012720
func_02012720: ; 0x02012720
    ldrsb r2, [r0, #0x7c]
    add r2, r0, r2, lsl #0x2
    str r1, [r2, #0x4c]
    ldrsb r1, [r0, #0x7c]
    add r1, r1, #0x1
    strb r1, [r0, #0x7c]
    bx lr
    .size func_02012720, . - func_02012720

