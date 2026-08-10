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

.global func_0201f6a4
    .type func_0201f6a4, @function
func_0201f6a4: ; 0x0201f6a4
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
.L_0201f6dc: .word data_020d61d0
    .size func_0201f6a4, .-func_0201f6a4

