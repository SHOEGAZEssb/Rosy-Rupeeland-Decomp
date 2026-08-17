; Matching retail form; see src/game/timed_sprite_oriented_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteState_SetWorldPositionFromOrigin
.extern data_020d605c
.global func_0201e500
func_0201e500: ; 0x0201e500
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r2, [r5, #0x28]
    mov r4, r1
    subs r1, r2, #0x1
    str r1, [r5, #0x28]
    bpl L_0201e530
    mov r1, #0x0
    bl TimedSpritePresentation_SetVisible
    mov r0, #0x1
    b L_0201e57c
L_0201e530:
    add r0, r5, #0x8
    add r1, r5, #0x18
    bl VecFx32Object_Add
    ldr r1, [r5, #0x14]
    mov r0, #0x8
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x4]
    ldr r2, [r5, #0xc]
    ldr r3, [r5, #0x10]
    mov r1, r4
    bl GraphicsSpriteState_SetWorldPositionFromOrigin
    ldr r0, [r5, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x8
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    moveq r0, #0x0
L_0201e57c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201e500, . - func_0201e500
