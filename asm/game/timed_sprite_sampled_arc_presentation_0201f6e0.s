; Matching retail form; see src/game/timed_sprite_sampled_arc_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d61d0
.extern gTimedSpritePresentationAllocationTag
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201e250
.extern func_0201edd0
.extern func_0201f0fc
.extern gHeapContext

.global func_0201f6e0
    .type func_0201f6e0, @function
func_0201f6e0: ; 0x0201f6e0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201f720
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
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_0201f720: .word data_021052fc
    .size func_0201f6e0, .-func_0201f6e0

