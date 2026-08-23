; Matching retail form; see src/game/timed_sprite_presentation.c.
.text
.extern Heap_Free
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern GraphicsSpriteGroup_CreateState
.extern GraphicsSpriteGroup_ReleaseState
.extern TimedSpritePresentation_SetVisible
.extern gFieldEffectVtable
.extern data_020d6098
.global FieldEffect_DestroyBase
FieldEffect_DestroyBase: ; 0x0201e28c
    bx lr


.size FieldEffect_DestroyBase, . - FieldEffect_DestroyBase
