; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gAuxiliaryTimedSpritePresentationVtable
.extern gTimedSpriteAuxiliaryAllocationTag
.extern gGamePhaseRuntime
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern AnimationResource_Init
.extern ActorMotionAreaFollower_GetPosition
.extern RuntimePresentationManager_AppendFirstListEffect
.extern FieldEffect_Init
.extern func_0201e584
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global AuxiliaryTimedSpritePresentation_DestroyBase
    .type AuxiliaryTimedSpritePresentation_DestroyBase, @function
AuxiliaryTimedSpritePresentation_DestroyBase: ; 0x0201fa44
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fa8c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201fa6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa6c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0201fa84
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa84:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fa8c: .word gAuxiliaryTimedSpritePresentationVtable
    .size AuxiliaryTimedSpritePresentation_DestroyBase, .-AuxiliaryTimedSpritePresentation_DestroyBase

