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
.extern GraphicsArchive_ReleaseCharacterResource
.extern GraphicsArchive_ReleasePaletteResource
.extern GraphicsArchive_ReleaseCellResource
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
