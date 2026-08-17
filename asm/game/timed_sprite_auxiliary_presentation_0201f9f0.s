; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gAuxiliaryTimedSpritePresentationVtable
.extern gTimedSpriteAuxiliaryAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern AnimationResource_Init
.extern ActorMotionAreaFollower_GetPosition
.extern PresentationList_AppendObject
.extern TimedSpritePresentation_InitBase
.extern func_0201e584
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global AuxiliaryTimedSpritePresentation_DestroyAndFree
    .type AuxiliaryTimedSpritePresentation_DestroyAndFree, @function
AuxiliaryTimedSpritePresentation_DestroyAndFree: ; 0x0201f9f0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fa40
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201fa18
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa18:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0201fa30
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa30:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fa40: .word gAuxiliaryTimedSpritePresentationVtable
    .size AuxiliaryTimedSpritePresentation_DestroyAndFree, .-AuxiliaryTimedSpritePresentation_DestroyAndFree

