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
.extern TimedSpritePresentation_InitBase
.extern func_0201e28c
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

.global func_02023308
    .type func_02023308, @function
func_02023308: ; 0x02023308
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r2, [r4, #0x8]
    add r0, sp, #0x0
    add r1, r4, #0xc
    bl VecFx32_Subtract
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    ldr r2, [r4, #0x3c]
    mov r0, r0, asr #0xc
    strh r0, [r2, #0x2c]
    mov r3, r1, asr #0xc
    add r0, r4, #0xc
    add r1, r4, #0x1c
    strh r3, [r2, #0x2e]
    bl VecFx32Object_Add
    add r0, r4, #0x1c
    add r1, r4, #0x2c
    bl VecFx32Object_Add
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    cmp r0, #0x3c
    add r0, sp, #0x10
    blt .L_02023390
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_02023398
.L_02023390:
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02023398:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size func_02023308, .-func_02023308

