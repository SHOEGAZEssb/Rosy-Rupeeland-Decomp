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
.extern func_0202293c
.extern func_02022b70
.extern func_02022c30
.extern func_02022c80
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_02056f00
.extern gHeapContext

.global func_02022f28
    .type func_02022f28, @function
func_02022f28: ; 0x02022f28
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r2, [r4, #0x8]
    add r0, sp, #0x0
    add r1, r4, #0xc
    bl VecFx32_Subtract
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr r0, [r4, #0x3c]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_02022c30
    add r0, r4, #0xc
    add r1, r4, #0x1c
    bl VecFx32Object_Add
    add r0, r4, #0x1c
    add r1, r4, #0x2c
    bl VecFx32Object_Add
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    cmp r0, #0x3c
    add r0, sp, #0x10
    blt .L_02022fac
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_02022fb4
.L_02022fac:
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02022fb4:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size func_02022f28, .-func_02022f28

