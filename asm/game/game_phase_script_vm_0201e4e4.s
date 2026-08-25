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
.global OrientedTimedSprite_DestroyAndFree
OrientedTimedSprite_DestroyAndFree: ; 0x0201e4e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}


.size OrientedTimedSprite_DestroyAndFree, . - OrientedTimedSprite_DestroyAndFree
