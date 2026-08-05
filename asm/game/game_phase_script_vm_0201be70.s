; Matching retail form; see src/game/game_phase_script_vm_call_return_opcodes.c.
.text
.extern func_02012704
.global func_0201be70
func_0201be70: ; 0x0201be70
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201be70, . - func_0201be70
