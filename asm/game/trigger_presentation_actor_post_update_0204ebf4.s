; Matching retail form; see src/game/trigger_presentation_actor_post_update.c.
.extern Actor_SetInteractionFlag2000
.extern Actor_DispatchActivationMode1
.text
    .global TriggerPresentationActor_PostUpdate
TriggerPresentationActor_PostUpdate:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_SetInteractionFlag2000
    mov r0, r4
    bl Actor_DispatchActivationMode1
    ldmia sp!, {r4, pc}
.size TriggerPresentationActor_PostUpdate, . - TriggerPresentationActor_PostUpdate

