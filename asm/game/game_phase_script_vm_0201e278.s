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
.global FieldEffect_DestroyAndFree
FieldEffect_DestroyAndFree: ; 0x0201e278
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}


.size FieldEffect_DestroyAndFree, . - FieldEffect_DestroyAndFree
