; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.extern func_0201b260
.extern GamePhaseScriptVm_Push
.global func_0201b3f4
func_0201b3f4: ; 0x0201b3f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_0201b260
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_Push
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.size func_0201b3f4, . - func_0201b3f4
