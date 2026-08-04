; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text
.extern func_02012704
.extern func_02072bdc

    .global func_02015580
func_02015580: ; 0x02015580
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r2, [r4, #0x84]
    and r1, r0, #0xff
    ldr r0, [r2, #0x54]
    bl func_02072bdc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02015580, . - func_02015580

