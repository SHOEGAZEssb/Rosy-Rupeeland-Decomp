; Matching retail form; see src/game/game_phase_script_vm_actor_rect_opcodes.c.
.text
.extern func_02008354
.extern GamePhaseScriptVm_Pop
.global func_020159d4
func_020159d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    strh r4, [sp, #2]
    strh r5, [sp, #4]
    strh r6, [sp, #6]
    strh r0, [sp]
    ldr r0, [r7, #0x84]
    add r1, sp, #0
    add r0, r0, #0x68
    bl func_02008354
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_020159d4, . - func_020159d4
