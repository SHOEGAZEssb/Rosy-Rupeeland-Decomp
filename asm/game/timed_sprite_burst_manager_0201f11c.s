; Matching retail form; see src/game/timed_sprite_burst_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern TouchPoint_Init
.extern data_020c9670
.extern gTimedSpritePointerArrayAllocationTag
.extern data_020d6220
.extern gTimedSpritePresentationAllocationTag
.extern data_020f4e18
.extern data_021052fc
.extern func_02003e20
.extern func_02003e38
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotion_GetPosition
.extern func_0201e250
.extern func_0201e3b8
.extern func_0201e454
.extern func_0201eefc
.extern func_0201f0b0
.extern func_0201f0d0
.extern func_0201f0fc
.extern func_0201f11c
.extern func_0201f15c
.extern func_0201f204
.extern func_0201f2b4
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont
.extern gHeapContext
.extern genrand_int32

.global func_0201f11c
.type func_0201f11c, @function

func_0201f11c: ; 0x0201f11c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_0201f138
    bl func_0201f0d0
.L_0201f138:
    ldr r1, .L_0201f154
    ldr r3, .L_0201f158
    mov r0, r4, lsl #0x2
    mov r2, #0x4
    bl func_02003e20
    stmia r5, {r0, r4}
    ldmia sp!, {r3, r4, r5, pc}
.L_0201f154: .word gTimedSpritePointerArrayAllocationTag
.L_0201f158: .word gHeapContext
    .size func_0201f11c, .-func_0201f11c

