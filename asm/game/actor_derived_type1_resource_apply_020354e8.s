; Matching retail form; see src/game/actor_derived_type1_resource_apply.c.
.text
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_020740c8

    .global ActorDerivedType1_ApplyResourceIndex
    .type ActorDerivedType1_ApplyResourceIndex, @function
ActorDerivedType1_ApplyResourceIndex: ; 0x020354e8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r1, r5, r1, lsl #0x2
    ldr r4, [r1, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldmia sp!, {r3, r4, r5, pc}
    .size ActorDerivedType1_ApplyResourceIndex, . - ActorDerivedType1_ApplyResourceIndex

    .global AttachmentController_SetEnabled

