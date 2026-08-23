; Matching retail form; see src/game/tracked_resource_actor_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorVtable
.extern ActorRuntimeBase_Init
.extern func_0203130c
.extern Actor_ReleaseSecondaryRenderAttachment
.extern Type7Actor_ClearGlobalRelationshipToActor
.text

    .global TrackedResourceActor_Init
TrackedResourceActor_Init: ; 0x0204fcb8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorRuntimeBase_Init
    ldr r0, .L_0204fd04
    mov ip, #0x0
    str r0, [r4, #0x0]
    str ip, [r4, #0x1ec]
    add r2, r4, #0x100
    ldrh r3, [r2, #0xf0]
    sub r1, ip, #0x8000
    mov r0, r4
    and r1, r3, r1
    strh r1, [r2, #0xf0]
    ldr r1, [r4, #0x1f4]
    bic r1, r1, #0x1
    str r1, [r4, #0x1f4]
    strh ip, [r2, #0xf8]
    str ip, [r4, #0x1fc]
    ldmia sp!, {r4, pc}
.L_0204fd04: .word gTrackedResourceActorVtable
.size TrackedResourceActor_Init, . - TrackedResourceActor_Init

    .global TrackedResourceActor_DestroyComplete

TrackedResourceActor_DestroyComplete: ; 0x0204fd08
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fd5c
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fd4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fd4c:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fd5c: .word gTrackedResourceActorVtable
.size TrackedResourceActor_DestroyComplete, . - TrackedResourceActor_DestroyComplete

    .global TrackedResourceActor_DestroyAndFree

TrackedResourceActor_DestroyAndFree: ; 0x0204fd60
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fdbc
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fda4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fda4:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fdbc: .word gTrackedResourceActorVtable
.size TrackedResourceActor_DestroyAndFree, . - TrackedResourceActor_DestroyAndFree

    .global TrackedResourceActor_Destroy

TrackedResourceActor_Destroy: ; 0x0204fdc0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204fe14
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204fe04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204fe04:
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204fe14: .word gTrackedResourceActorVtable
.size TrackedResourceActor_Destroy, . - TrackedResourceActor_Destroy

