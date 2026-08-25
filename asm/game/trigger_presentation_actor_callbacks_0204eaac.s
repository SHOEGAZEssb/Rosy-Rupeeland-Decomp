; Matching retail form; see src/game/trigger_presentation_actor_callbacks.c.
.extern Actor_MarkFrameUpdateStarted
.extern ActorContactState_AddContact
.extern ActorContactState_RemoveContact
.extern Actor_TryDispatchActivationMode2
.extern Actor_UpdateTimedResourceState
.text

    .global TriggerPresentationActor_Update
TriggerPresentationActor_Update: ; 0x0204eaac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_MarkFrameUpdateStarted
    mov r0, r4
    bl Actor_UpdateTimedResourceState
    cmp r0, #0x0
    ldmia sp!, {r4, pc}
.size TriggerPresentationActor_Update, . - TriggerPresentationActor_Update

    .global TriggerPresentationActor_HandleContact

TriggerPresentationActor_HandleContact: ; 0x0204eac8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl ActorContactState_AddContact
    ldr r0, [r6, #0x188]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    cmpeq r4, #0x0
    bne .L_0204eb04
    mov r0, r6
    bl Actor_TryDispatchActivationMode2
.L_0204eb04:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.size TriggerPresentationActor_HandleContact, . - TriggerPresentationActor_HandleContact

    .global TriggerPresentationActor_RemoveContact

TriggerPresentationActor_RemoveContact: ; 0x0204eb0c
    ldr ip, .L_0204eb14
    bx ip
.L_0204eb14: .word ActorContactState_RemoveContact
.size TriggerPresentationActor_RemoveContact, . - TriggerPresentationActor_RemoveContact

