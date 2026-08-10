; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorMotionProbe_SetScale

    .global GamePhaseActorScriptVm_SetMotionProbeScale
GamePhaseActorScriptVm_SetMotionProbeScale: ; 0x0201555c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r4, #0x84]
    mov r1, r1, lsl #0x4
    bl ActorMotionProbe_SetScale
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetMotionProbeScale, . - GamePhaseActorScriptVm_SetMotionProbeScale

