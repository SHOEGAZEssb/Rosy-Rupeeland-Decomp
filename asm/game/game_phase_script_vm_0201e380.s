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
.extern data_020d6248
.extern data_020d6098
.global func_0201e380
func_0201e380: ; 0x0201e380
    stmdb sp!, {r4, lr}
    ldr r1, L_0201e3b4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    add r0, r4, #0x8
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201e3b4: .word data_020d6098


.size func_0201e380, . - func_0201e380
