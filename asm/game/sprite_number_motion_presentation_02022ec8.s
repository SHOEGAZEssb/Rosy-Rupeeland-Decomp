; Matching retail form; see src/game/sprite_number_motion_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d6658
.extern data_020d6678
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern func_0201e250
.extern func_0201e28c
.extern func_0202293c
.extern func_02022b70
.extern func_02022c30
.extern func_02022c80
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02056f00
.extern gHeapContext

.global func_02022ec8
    .type func_02022ec8, @function
func_02022ec8: ; 0x02022ec8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02022f24
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x3c]
    cmp r4, #0x0
    beq .L_02022ef4
    mov r0, r4
    bl func_02022b70
    mov r0, r4
    bl Heap_Free
.L_02022ef4:
    add r0, r5, #0x2c
    bl VecFx32Object_Destroy
    add r0, r5, #0x1c
    bl VecFx32Object_Destroy
    add r0, r5, #0xc
    bl VecFx32Object_Destroy
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02022f24: .word data_020d6658
    .size func_02022ec8, .-func_02022ec8

