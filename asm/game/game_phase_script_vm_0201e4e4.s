; Matching retail form; see src/game/timed_sprite_oriented_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern func_0201e3b8
.extern func_020050a4
.extern func_020050c8
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteState_SetWorldPositionFromOrigin
.extern data_020d605c
.global func_0201e4e4
func_0201e4e4: ; 0x0201e4e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}


.size func_0201e4e4, . - func_0201e4e4
