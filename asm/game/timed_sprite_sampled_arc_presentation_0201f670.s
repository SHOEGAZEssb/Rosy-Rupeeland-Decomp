; Matching retail form; see src/game/timed_sprite_sampled_arc_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gTimedSpriteSampledArcPresentationVtable
.extern gTimedSpritePresentationAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionAreaFollower_GetPosition
.extern FieldEffect_Init
.extern func_0201edd0
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global TimedSpriteSampledArcPresentation_Destroy
    .type TimedSpriteSampledArcPresentation_Destroy, @function
TimedSpriteSampledArcPresentation_Destroy: ; 0x0201f670
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201f6a0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201f698
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f698:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201f6a0: .word gTimedSpriteSampledArcPresentationVtable
    .size TimedSpriteSampledArcPresentation_Destroy, .-TimedSpriteSampledArcPresentation_Destroy

