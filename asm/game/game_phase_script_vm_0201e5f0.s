; Matching retail form; see src/game/timed_sprite_offset_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern func_0201e3b8
.extern func_020050a4
.extern func_020050c8
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_020d6084
.global func_0201e5f0
func_0201e5f0: ; 0x0201e5f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    ldmia sp!, {r4, pc}


.size func_0201e5f0, . - func_0201e5f0
