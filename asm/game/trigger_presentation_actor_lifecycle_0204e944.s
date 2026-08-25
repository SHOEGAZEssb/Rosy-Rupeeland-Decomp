; Matching retail form; see src/game/trigger_presentation_actor_lifecycle.c.
.extern Heap_Free
.extern data_020e2560
.extern ActorRuntimeBase_Init
.extern RuntimeActor_DestroyAlternateEntry
.extern Actor_ReleaseSecondaryRenderAttachment
.text

    .global TriggerPresentationActor_Init
TriggerPresentationActor_Init: ; 0x0204e944
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorRuntimeBase_Init
    ldr r0, .L_0204e96c
    add r1, r4, #0x100
    str r0, [r4, #0x0]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0xec]
    ldmia sp!, {r4, pc}
.L_0204e96c: .word data_020e2560
.size TriggerPresentationActor_Init, . - TriggerPresentationActor_Init

    .global TriggerPresentationActor_Destroy

TriggerPresentationActor_Destroy: ; 0x0204e970
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204e9a4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    mov r0, r4
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204e9a4: .word data_020e2560
.size TriggerPresentationActor_Destroy, . - TriggerPresentationActor_Destroy

    .global TriggerPresentationActor_DestroyAndFree

TriggerPresentationActor_DestroyAndFree: ; 0x0204e9a8
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204e9e4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    mov r0, r4
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204e9e4: .word data_020e2560
.size TriggerPresentationActor_DestroyAndFree, . - TriggerPresentationActor_DestroyAndFree

