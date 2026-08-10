; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d61a8
.extern gTimedSpriteAuxiliaryAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern AnimationResource_Init
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201ded4
.extern func_0201e250
.extern func_0201e584
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global func_0201fa90
    .type func_0201fa90, @function
func_0201fa90: ; 0x0201fa90
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201faf8
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r4, #0x8]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    ldrsh r1, [r4, #0x12]
    mvn r0, #0x0
    cmp r1, r0
    ldrne r0, [r4, #0x8]
    ldrne r0, [r0, #0x4]
    strneb r1, [r0, #0x3a]
    ldrsh r0, [r4, #0x10]
    sub r0, r0, #0x1
    strh r0, [r4, #0x10]
    ldrsh r0, [r4, #0x10]
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, pc}
.L_0201faf8: .word data_021052fc
    .size func_0201fa90, .-func_0201fa90

