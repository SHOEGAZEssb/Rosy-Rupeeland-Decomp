; Matching retail form; see src/game/timed_sprite_sampled_arc_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gTimedSpriteSampledArcPresentationVtable
.extern gTimedSpritePresentationAllocationTag
.extern gGamePhaseRuntime
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionAreaFollower_GetPosition
.extern FieldEffect_Init
.extern SampledArcTimedSprite_Init
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global TimedSpriteSampledArcPresentation_DestroyAndFree
    .type TimedSpriteSampledArcPresentation_DestroyAndFree, @function
TimedSpriteSampledArcPresentation_DestroyAndFree: ; 0x0201f6a4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201f6dc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201f6cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f6cc:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201f6dc: .word gTimedSpriteSampledArcPresentationVtable
    .size TimedSpriteSampledArcPresentation_DestroyAndFree, .-TimedSpriteSampledArcPresentation_DestroyAndFree
