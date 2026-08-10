; Matching retail form; see src/game/sprite_number_motion_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d6658
.extern data_020d6678
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
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

.global func_02022e70
    .type func_02022e70, @function
func_02022e70: ; 0x02022e70
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02022ec4
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x3c]
    cmp r4, #0x0
    beq .L_02022e9c
    mov r0, r4
    bl func_02022b70
    mov r0, r4
    bl Heap_Free
.L_02022e9c:
    add r0, r5, #0x2c
    bl func_02005058
    add r0, r5, #0x1c
    bl func_02005058
    add r0, r5, #0xc
    bl func_02005058
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02022ec4: .word data_020d6658
    .size func_02022e70, .-func_02022e70

