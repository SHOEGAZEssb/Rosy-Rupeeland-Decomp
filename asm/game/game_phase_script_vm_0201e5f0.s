; Matching retail form; see src/game/timed_sprite_offset_variant.c.
.text
.extern Heap_Free
.extern TimedSpritePresentation_Init
.extern TimedSpritePresentation_DestroyBase
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_020d6084
.global OffsetTimedSprite_Destroy
OffsetTimedSprite_Destroy: ; 0x0201e5f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}


.size OffsetTimedSprite_Destroy, . - OffsetTimedSprite_Destroy
