; Matching retail form; see src/game/timed_sprite_offset_variant.c.
.text
.extern Heap_Free
.extern TimedSpritePresentation_Init
.extern TimedSpritePresentation_DestroyBase
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_020d6084
.global OffsetTimedSprite_Update
OffsetTimedSprite_Update: ; 0x0201e620
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x28]
    mov r4, r1
    subs r0, r0, #0x1
    str r0, [r5, #0x28]
    bmi L_0201e658
    ldr r0, [r5, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_0201e66c
L_0201e658:
    mov r0, r5
    mov r1, #0x0
    bl TimedSpritePresentation_SetVisible
    mov r0, #0x1
    b L_0201e6dc
L_0201e66c:
    add r0, r5, #0x8
    add r1, r5, #0x18
    bl VecFx32Object_Add
    ldr r3, [r5, #0x4]
    mov r0, #0x8
    ldrh r2, [r3, #0x24]
    mov r1, r4
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r5, #0x14]
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x4]
    ldr r2, [r5, #0xc]
    ldr r3, [r5, #0x10]
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    ldr r2, [r5, #0x4]
    ldr r1, [r5, #0x2c]
    ldrh r0, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
    ldr r0, [r5, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    moveq r0, #0x0
L_0201e6dc:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}


.size OffsetTimedSprite_Update, . - OffsetTimedSprite_Update
