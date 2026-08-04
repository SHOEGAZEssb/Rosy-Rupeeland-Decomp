; Matching retail form; see src/game/game_phase_script_vm_runtime.c.
.text

    .global func_02012704
func_02012704: ; 0x02012704
    ldrsb r1, [r0, #0x7c]
    sub r1, r1, #0x1
    strb r1, [r0, #0x7c]
    ldrsb r1, [r0, #0x7c]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4c]
    bx lr
    .size func_02012704, . - func_02012704

