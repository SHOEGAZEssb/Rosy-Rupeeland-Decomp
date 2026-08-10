; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern data_020d6180
.extern data_021052fc
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201f724
.extern func_0201fa44

.global func_0201fb54
    .type func_0201fb54, @function
func_0201fb54: ; 0x0201fb54
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201fa44
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201fb54, .-func_0201fb54

