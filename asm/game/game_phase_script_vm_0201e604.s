; Matching retail form; see src/game/timed_sprite_offset_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_020d6084
.global func_0201e604
func_0201e604: ; 0x0201e604
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}


.size func_0201e604, . - func_0201e604
