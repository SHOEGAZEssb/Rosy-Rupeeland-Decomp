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
.global FieldEffect_Init
FieldEffect_Init: ; 0x0201e250
    ldr r1, L_0201e270
    str r1, [r0, #0x0]
    ldr r1, [r0, #0x4]
    bic r2, r1, #0x1
    bic r1, r2, #0x2
    bic r1, r1, #0x3fc
    str r1, [r0, #0x4]
    bx lr
L_0201e270: .word gFieldEffectVtable


.size FieldEffect_Init, . - FieldEffect_Init
