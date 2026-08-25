; Matching retail form; see src/game/timed_sprite_burst_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern TouchPoint_Init
.extern gFx32CosSinTable
.extern gTimedSpritePointerArrayAllocationTag
.extern gTimedSpriteBurstManagerVtable
.extern gTimedSpritePresentationAllocationTag
.extern data_020f4e18
.extern gGamePhaseRuntime
.extern Heap_AllocAlternateEntry
.extern Heap_FreeAlternateEntry
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotion_GetPosition
.extern FieldEffect_Init
.extern TimedSpritePresentation_SetVisible
.extern OrientedTimedSprite_Init
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

.global OwnedPointerArray_Clear
.type OwnedPointerArray_Clear, @function

OwnedPointerArray_Clear: ; 0x0201f0d0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0201f0f0
    bl Heap_FreeAlternateEntry
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0201f0f0:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size OwnedPointerArray_Clear, .-OwnedPointerArray_Clear
