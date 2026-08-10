; Matching retail form; see src/game/game_phase_script_vm_math_opcodes.c.
.text
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern GamePhaseScriptVm_SetResult

    .global GamePhaseActorScriptVm_GetVectorY
GamePhaseActorScriptVm_GetVectorY: ; 0x02012e18
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x84]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x8]
    mov r0, r4
    mov r1, r1, asr #0xc
    bl GamePhaseScriptVm_SetResult
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_GetVectorY, . - GamePhaseActorScriptVm_GetVectorY

