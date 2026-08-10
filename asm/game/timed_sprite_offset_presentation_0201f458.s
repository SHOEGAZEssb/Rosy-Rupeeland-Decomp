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

.global func_0201f458
    .type func_0201f458, @function
func_0201f458: ; 0x0201f458
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x38
    mov r5, r0
    add r0, sp, #0x0
    mov r7, r1
    mov r4, r2
    mov r6, r3
    bl TimedSpriteConfig_InitTracks
    str r6, [r5, #0xc]
    ldr r1, [sp, #0x50]
    ldr r0, [sp, #0x54]
    ldr r2, [sp, #0x58]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    add r0, sp, #0x10
    mov r1, r7
    str r6, [sp, #0x0]
    str r2, [sp, #0xc]
    bl VecFx32Object_Assign
    mov r0, #0x2
    str r0, [sp, #0x34]
    mov r0, #0x384
    str r0, [sp, #0x30]
    mov r0, #0x0
    ldr r1, .L_0201f518
    ldr r3, .L_0201f51c
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0201f4ec
    ldr r3, [sp, #0x5c]
    add r1, sp, #0x0
    mov r2, r4
    bl func_0201e584
.L_0201f4ec:
    str r0, [r5, #0x8]
    mov r0, #0x384
    strh r0, [r5, #0x10]
    ldr r1, [sp, #0x60]
    add r0, sp, #0x20
    strh r1, [r5, #0x12]
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0201f518: .word gTimedSpritePresentationAllocationTag
.L_0201f51c: .word gHeapContext
    .size func_0201f458, .-func_0201f458

