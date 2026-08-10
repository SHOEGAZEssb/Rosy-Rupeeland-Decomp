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

.global func_0201f378
    .type func_0201f378, @function
func_0201f378: ; 0x0201f378
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0201e250
    ldr r0, .L_0201f3e4
    ldr r1, [sp, #0x28]
    str r0, [r7, #0x0]
    ldr r0, [sp, #0x2c]
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x30]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x34]
    str r1, [sp, #0x8]
    ldr ip, [sp, #0x38]
    str r0, [sp, #0xc]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x10]
    bl func_0201f458
    mov r0, r7
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0201f3e4: .word data_020d61f8
    .size func_0201f378, .-func_0201f378

