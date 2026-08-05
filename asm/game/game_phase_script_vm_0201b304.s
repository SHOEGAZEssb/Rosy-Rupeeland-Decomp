; Matching retail form; see src/game/game_phase_script_vm_control_flow_opcodes.c.
.text
.extern func_0201b278
.global func_0201b304
func_0201b304: ; 0x0201b304
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_0201b278
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201b304, . - func_0201b304
