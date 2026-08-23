; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_UpdateAttachmentDirectionFromVector
.extern Actor_GetOwningCollection

    .global GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38
GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38: ; 0x0201389c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    ldr r0, [r4, #0x84]
    bl Actor_GetOwningCollection
    mov r1, r5
    bl ActorCollection_FindActorByRuntimeId
    mov r2, r0
    ldr r0, [r4, #0x84]
    ldr ip, [r2, #0x1c]
    ldr r1, [r0, #0x1c]
    ldr r3, [r2, #0x20]
    ldr r2, [r0, #0x20]
    sub r1, ip, r1
    sub r2, r3, r2
    bl Actor_UpdateAttachmentDirectionFromVector
    ldr r0, [r4, #0x84]
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    beq L_02013900
    ldrb r1, [r0, #0x38]
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    b L_0201390c
L_02013900:
    mov r0, r4
    mov r1, #0x0
    bl GamePhaseScriptVm_SetResult
L_0201390c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38, . - GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38
