; Matching retail form; see src/game/timed_sprite_offset_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gTimedSpriteOffsetPresentationVtable
.extern gTimedSpritePresentationAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionAreaFollower_GetPosition
.extern FieldEffect_Init
.extern func_0201e584
.extern TimedSpriteConfig_InitTracks
.extern TimedSpriteOffsetPresentation_CreateSprite
.extern gHeapContext

.global TimedSpriteOffsetPresentation_DestroyAndFree
    .type TimedSpriteOffsetPresentation_DestroyAndFree, @function
TimedSpriteOffsetPresentation_DestroyAndFree: ; 0x0201f41c
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201f454
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201f444
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f444:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201f454: .word gTimedSpriteOffsetPresentationVtable
    .size TimedSpriteOffsetPresentation_DestroyAndFree, .-TimedSpriteOffsetPresentation_DestroyAndFree

