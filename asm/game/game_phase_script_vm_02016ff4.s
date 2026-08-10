; Matching retail form; see src/game/game_phase_script_vm_actor_sequence_opcodes.c.
.text
.extern ActorMotionProbe_ResetMotion
.global GamePhaseActorScriptVm_ResetMotionProbe
GamePhaseActorScriptVm_ResetMotionProbe:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x84]
    bl ActorMotionProbe_ResetMotion
    mov r0, #0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_ResetMotionProbe, . - GamePhaseActorScriptVm_ResetMotionProbe
