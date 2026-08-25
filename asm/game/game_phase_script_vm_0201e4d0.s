; Matching retail form; see src/game/timed_sprite_oriented_variant.c.
.text
.extern Heap_Free
.extern TimedSpritePresentation_Init
.extern TimedSpritePresentation_DestroyBase
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteState_SetWorldPositionFromOrigin
.extern data_020d605c
.global OrientedTimedSprite_Destroy
OrientedTimedSprite_Destroy: ; 0x0201e4d0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}


.size OrientedTimedSprite_Destroy, . - OrientedTimedSprite_Destroy
