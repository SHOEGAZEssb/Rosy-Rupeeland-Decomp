; Matching retail form; see src/game/actor_effect_activation_callbacks.c.
.text
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorRuntimeCollection_GetBusyState

    .global Actor_TryDispatchActivationMode2
    .type Actor_TryDispatchActivationMode2, @function
Actor_TryDispatchActivationMode2: ; 0x02033fe4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_02034040
    bl ActorRuntimeCollection_GetBusyState
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, .L_02034040
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x78]
    blx r2
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02034040: .word gActorRuntimeCollection
    .size Actor_TryDispatchActivationMode2, . - Actor_TryDispatchActivationMode2

    .global Actor_DispatchActivationMode1

