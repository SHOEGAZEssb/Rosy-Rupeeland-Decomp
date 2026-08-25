; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_DispatchRuntimeObjectValue
GamePhaseActorScriptVm_DispatchRuntimeObjectValue:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x1
    beq L_02019fb8
    cmp r0, #0x2
    beq L_02019fdc
    b L_0201a000
L_02019fb8:
    ldr r0, L_0201a008
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x34]
    blx r2
    b L_0201a000
L_02019fdc:
    ldr r0, L_0201a008
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x34]
    blx r2
L_0201a000:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0201a008: .word gGamePhaseRuntime
.size GamePhaseActorScriptVm_DispatchRuntimeObjectValue, . - GamePhaseActorScriptVm_DispatchRuntimeObjectValue
