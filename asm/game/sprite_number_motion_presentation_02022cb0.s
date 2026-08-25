; Matching retail form; see src/game/sprite_number_motion_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d6658
.extern gSpriteNumberGroupAllocationTag
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern SpriteNumberGroup_Init
.extern SpriteNumberGroup_Destroy
.extern SpriteNumberGroup_SetPosition
.extern SpriteNumberGroup_SetVisible
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern VecFx32Object_InitPlanarProjection
.extern gHeapContext

.global SpriteNumberMotionPresentation_Init
    .type SpriteNumberMotionPresentation_Init, @function
SpriteNumberMotionPresentation_Init: ; 0x02022cb0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x60
    mov r4, r0
    mov r5, r1
    mov r7, r2
    mov r6, r3
    bl FieldEffect_Init
    ldr r1, .L_02022e64
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    add r1, r7, #0x18
    str r5, [r4, #0x8]
    bl VecFx32Object_InitCopy
    add r0, r4, #0x1c
    bl VecFx32Object_Init
    add r0, r4, #0x2c
    bl VecFx32Object_Init
    ldr r1, [r4, #0x18]
    ldr r3, .L_02022e68
    add r1, r1, #0x10000
    str r1, [r4, #0x18]
    ldr r1, .L_02022e6c
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02022d3c
    mov r0, r7
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, r0
    mov r0, r5
    mov r2, r6
    bl SpriteNumberGroup_Init
    mov r5, r0
.L_02022d3c:
    str r5, [r4, #0x3c]
    cmp r6, #0x0
    bne .L_02022d54
    ldr r0, [r4, #0x3c]
    mov r1, #0x0
    bl SpriteNumberGroup_SetVisible
.L_02022d54:
    ldr r2, [r4, #0x8]
    add r0, sp, #0x40
    add r1, r4, #0xc
    bl VecFx32_Subtract
    add r0, sp, #0x50
    add r1, sp, #0x40
    bl VecFx32Object_InitPlanarProjection
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, [r4, #0x3c]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl SpriteNumberGroup_SetPosition
    ldr r0, [sp, #0x58]
    mov r1, #0x0
    mov r0, r0, asr #0xc
    cmp r0, #0x40
    ble .L_02022df4
    ldr r3, [sp, #0x78]
    add r0, sp, #0x30
    mov r2, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x30
    add r0, r4, #0x1c
    bl VecFx32Object_Assign
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    mov r1, #0x0
    ldr r3, [sp, #0x7c]
    add r0, sp, #0x20
    mov r2, r1
    bl VecFx32Object_InitComponents
    add r0, r4, #0x2c
    add r1, sp, #0x20
    bl VecFx32Object_Assign
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    b .L_02022e48
.L_02022df4:
    ldr r3, [sp, #0x78]
    add r0, sp, #0x10
    mov r2, r1
    rsb r3, r3, #0x0
    bl VecFx32Object_InitComponents
    add r1, sp, #0x10
    add r0, r4, #0x1c
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    ldr r1, [sp, #0x7c]
    add r0, sp, #0x0
    rsb r3, r1, #0x0
    mov r1, #0x0
    mov r2, r1
    bl VecFx32Object_InitComponents
    add r0, r4, #0x2c
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02022e48:
    mov r1, #0x0
    add r0, sp, #0x50
    str r1, [r4, #0x40]
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02022e64: .word data_020d6658
.L_02022e68: .word gHeapContext
.L_02022e6c: .word gSpriteNumberGroupAllocationTag
    .size SpriteNumberMotionPresentation_Init, .-SpriteNumberMotionPresentation_Init
