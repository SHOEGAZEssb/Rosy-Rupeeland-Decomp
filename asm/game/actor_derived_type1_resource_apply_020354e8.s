; Matching retail form; see src/game/actor_derived_type1_resource_apply.c.
.text
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern GraphicsSpriteGroup_ReplaceStateResources

    .global ActorDerivedType1_ApplyResourceIndex
    .type ActorDerivedType1_ApplyResourceIndex, @function
ActorDerivedType1_ApplyResourceIndex: ; 0x020354e8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r1, r5, r1, lsl #0x2
    ldr r4, [r1, #0x208]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldmia sp!, {r3, r4, r5, pc}
    .size ActorDerivedType1_ApplyResourceIndex, . - ActorDerivedType1_ApplyResourceIndex

    .global AttachmentController_SetEnabled

