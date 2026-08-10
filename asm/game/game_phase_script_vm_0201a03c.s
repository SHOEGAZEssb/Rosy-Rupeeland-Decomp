; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern data_020d430c
.extern data_021052fc
.extern GamePhaseRuntime_GetAuxiliaryOverlayObject
.extern GamePhaseScriptVm_Pop
.extern func_ov056_0220f054
.global func_0201a03c
func_0201a03c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r2, L_0201a088
    ldr r1, L_0201a08c
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    str r2, [sp, #0x0]
    str r4, [sp, #0x8]
    bl GamePhaseRuntime_GetAuxiliaryOverlayObject
    add r1, sp, #0x0
    bl func_ov056_0220f054
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_0201a088: .word data_020d430c
L_0201a08c: .word data_021052fc
.size func_0201a03c, . - func_0201a03c
