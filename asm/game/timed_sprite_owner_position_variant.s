; Matching retail form; see src/game/timed_sprite_owner_position_variant.c.
.text
.extern Heap_Free
.extern data_020d60d8
.extern VecFx32Object_Assign
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern TimedSpritePresentation_DestroyBase
.extern TimedSpritePresentation_SetVisible
.extern AttachedTimedSprite_Init

.global OwnerPositionTimedSprite_Init
.type OwnerPositionTimedSprite_Init, @function
OwnerPositionTimedSprite_Init: ; 0x0201ecbc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AttachedTimedSprite_Init
    ldr r1, .L_0201ece8
    ldrsh r0, [sp, #0x8]
    str r1, [r4, #0x0]
    ldrsh r1, [sp, #0xc]
    strh r0, [r4, #0x38]
    mov r0, r4
    strh r1, [r4, #0x3a]
    ldmia sp!, {r4, pc}
.L_0201ece8: .word data_020d60d8
    .size OwnerPositionTimedSprite_Init, .-OwnerPositionTimedSprite_Init

.global OwnerPositionTimedSprite_Destroy
.type OwnerPositionTimedSprite_Destroy, @function
OwnerPositionTimedSprite_Destroy: ; 0x0201ecec
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size OwnerPositionTimedSprite_Destroy, .-OwnerPositionTimedSprite_Destroy

.global OwnerPositionTimedSprite_DestroyAndFree
.type OwnerPositionTimedSprite_DestroyAndFree, @function
OwnerPositionTimedSprite_DestroyAndFree: ; 0x0201ed00
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size OwnerPositionTimedSprite_DestroyAndFree, .-OwnerPositionTimedSprite_DestroyAndFree

.global OwnerPositionTimedSprite_Update
.type OwnerPositionTimedSprite_Update, @function
OwnerPositionTimedSprite_Update: ; 0x0201ed1c
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x28]
    subs r1, r1, #0x1
    str r1, [r0, #0x28]
    bmi .L_0201ed48
    ldr r1, [r0, #0x4]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0201ed58
.L_0201ed48:
    mov r1, #0x0
    bl TimedSpritePresentation_SetVisible
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_0201ed58:
    ldr r1, [r0, #0x2c]
    add r0, r0, #0x8
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size OwnerPositionTimedSprite_Update, .-OwnerPositionTimedSprite_Update

.global OwnerPositionTimedSprite_ApplyPositionAndSpriteOffsets
.type OwnerPositionTimedSprite_ApplyPositionAndSpriteOffsets, @function
OwnerPositionTimedSprite_ApplyPositionAndSpriteOffsets: ; 0x0201ed70
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x14]
    ldr r2, [r4, #0x30]
    mov r0, #0x8
    add r2, r3, r2
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    ldr r2, [r4, #0xc]
    ldr r3, [r4, #0x10]
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    ldr r2, [r4, #0x4]
    ldrsh r1, [r4, #0x38]
    ldrh r0, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
    ldrsh r1, [r4, #0x3a]
    cmp r1, #0x0
    ldrge r0, [r4, #0x4]
    strgeb r1, [r0, #0x3a]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    .size OwnerPositionTimedSprite_ApplyPositionAndSpriteOffsets, .-OwnerPositionTimedSprite_ApplyPositionAndSpriteOffsets
