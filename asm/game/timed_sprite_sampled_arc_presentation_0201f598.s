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
.extern func_0201edd0
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global TimedSpriteSampledArcPresentation_Init
    .type TimedSpriteSampledArcPresentation_Init, @function
TimedSpriteSampledArcPresentation_Init: ; 0x0201f598
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x38
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl FieldEffect_Init
    ldr r1, .L_0201f664
    add r0, sp, #0x0
    str r1, [r4, #0x0]
    bl TimedSpriteConfig_InitTracks
    ldr r0, [sp, #0x50]
    ldr r2, [sp, #0x54]
    str r0, [sp, #0x8]
    mov r1, r7
    add r0, sp, #0x10
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r2, [sp, #0xc]
    bl VecFx32Object_Assign
    mov r0, #0x2
    str r0, [sp, #0x34]
    mov r0, #0x4b0
    str r0, [sp, #0x30]
    mov r0, #0x0
    ldr r1, .L_0201f668
    ldr r3, .L_0201f66c
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    mov r0, #0x2c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0201f628
    add r1, sp, #0x0
    bl func_0201edd0
.L_0201f628:
    str r0, [r4, #0x8]
    ldr r1, [r0, #0x4]
    ldr r2, [sp, #0x58]
    add r0, sp, #0x20
    strh r2, [r1, #0x28]
    ldr r1, [r4, #0x8]
    mov r2, #0x2
    ldr r1, [r1, #0x4]
    strb r2, [r1, #0x3a]
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0201f664: .word gTimedSpriteSampledArcPresentationVtable
.L_0201f668: .word gTimedSpritePresentationAllocationTag
.L_0201f66c: .word gHeapContext
    .size TimedSpriteSampledArcPresentation_Init, .-TimedSpriteSampledArcPresentation_Init

