; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern gRisingAuxiliaryTimedSpritePresentationVtable
.extern gGamePhaseRuntime
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern AuxiliaryTimedSpritePresentation_InitBase
.extern AuxiliaryTimedSpritePresentation_DestroyBase

.global RisingAuxiliaryTimedSpritePresentation_Destroy
    .type RisingAuxiliaryTimedSpritePresentation_Destroy, @function
RisingAuxiliaryTimedSpritePresentation_Destroy: ; 0x0201fb54
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AuxiliaryTimedSpritePresentation_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size RisingAuxiliaryTimedSpritePresentation_Destroy, .-RisingAuxiliaryTimedSpritePresentation_Destroy

