; Matching retail form; see src/game/timed_sprite_burst_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern TouchPoint_Init
.extern data_020c9670
.extern gTimedSpritePointerArrayAllocationTag
.extern gTimedSpriteBurstManagerVtable
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
.extern TimedSpriteBurstManager_Init
.extern OwnedPointerArray_Destroy
.extern OwnedPointerArray_Clear
.extern TimedSpriteConfig_InitTracks
.extern OwnedPointerArray_Resize
.extern TimedSpriteBurstManager_Destroy
.extern TimedSpriteBurstManager_DestroyAndFree
.extern TimedSpriteBurstManager_Update
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont
.extern gHeapContext
.extern genrand_int32

.global OwnedPointerArray_Destroy
.type OwnedPointerArray_Destroy, @function

OwnedPointerArray_Destroy: ; 0x0201f0b0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_0201f0c8
    bl OwnedPointerArray_Clear
.L_0201f0c8:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size OwnedPointerArray_Destroy, .-OwnedPointerArray_Destroy

