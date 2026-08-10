; Matching retail form; see src/game/timed_sprite_offset_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d61f8
.extern gTimedSpritePresentationAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201e250
.extern func_0201e584
.extern TimedSpriteConfig_InitTracks
.extern func_0201f458
.extern gHeapContext

.global func_0201f3e8
    .type func_0201f3e8, @function
func_0201f3e8: ; 0x0201f3e8
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201f418
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201f410
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f410:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201f418: .word data_020d61f8
    .size func_0201f3e8, .-func_0201f3e8

