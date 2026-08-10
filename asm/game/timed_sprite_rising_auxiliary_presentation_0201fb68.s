; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern data_020d6180
.extern data_021052fc
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern AuxiliaryTimedSpritePresentation_InitBase
.extern AuxiliaryTimedSpritePresentation_DestroyBase

.global func_0201fb68
    .type func_0201fb68, @function
func_0201fb68: ; 0x0201fb68
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AuxiliaryTimedSpritePresentation_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201fb68, .-func_0201fb68

