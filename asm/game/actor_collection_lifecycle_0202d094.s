; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text
.extern ActorCollection_UnregisterAndDestroyAllActors
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern OverlaySlot_UnloadOverlay
.extern data_020f4e14
.extern gDebugFont

    .global ActorCollection_Deinit
    .type ActorCollection_Deinit, @function
ActorCollection_Deinit: ; 0x0202d094
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorCollection_UnregisterAndDestroyAllActors
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    beq .L_0202d0bc
    cmp r0, #0x2
    beq .L_0202d0d8
    b .L_0202d0f0
.L_0202d0bc:
    ldr r0, .L_0202d108
    ldr r1, [r4, #0xe00]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    mov r0, #0x0
    str r0, [r4, #0xe00]
    b .L_0202d0f0
.L_0202d0d8:
    ldr r0, .L_0202d10c
    ldr r1, [r4, #0xe00]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    mov r0, #0x0
    str r0, [r4, #0xe00]
.L_0202d0f0:
    add r0, r4, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0xe10
    bl OverlaySlot_UnloadOverlay
    ldmia sp!, {r4, pc}
.L_0202d108: .word data_020f4e14
.L_0202d10c: .word gDebugFont
    .size ActorCollection_Deinit, . - ActorCollection_Deinit
