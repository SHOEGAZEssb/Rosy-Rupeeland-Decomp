; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text
.extern ActorCollection_Deinit
.extern OverlaySlot_Destroy

    .global ActorCollection_Destructor
    .type ActorCollection_Destructor, @function
ActorCollection_Destructor: ; 0x0202d06c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorCollection_Deinit
    add r0, r4, #0xe10
    bl OverlaySlot_Destroy
    add r0, r4, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ActorCollection_Destructor, . - ActorCollection_Destructor
