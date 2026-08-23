; Matching retail form; see src/game/record_sprite_motion_presentation.c.
.text
.extern Heap_Free
.extern OS_Halt
.extern data_020d6630
.extern data_020f4e18
.extern data_021e9ac0
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern SelfLinkedSpriteConfig_Init
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_02056f00
.extern ActorDescriptor_InitRange
.extern ActorDescriptor_Init
.extern ActorDescriptor_GetComponent
.extern ActorDescriptorComponent_LoadResources
.extern ActorDescriptorComponent_GetAnimation
.extern ActorDatabase_QueryDefinitionKind
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_ReleaseState

.global func_02023260
    .type func_02023260, @function
func_02023260: ; 0x02023260
    stmdb sp!, {r4, lr}
    ldr r1, .L_020232ac
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x44]
    ldr r1, [r4, #0x3c]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x48
    bl AnimationResourceState_Destroy
    add r0, r4, #0x2c
    bl VecFx32Object_Destroy
    add r0, r4, #0x1c
    bl VecFx32Object_Destroy
    add r0, r4, #0xc
    bl VecFx32Object_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020232ac: .word data_020d6630
    .size func_02023260, .-func_02023260

