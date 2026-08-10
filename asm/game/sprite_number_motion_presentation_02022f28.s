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
.extern func_020066a4
.extern func_0201e250
.extern func_0201e28c
.extern func_0202293c
.extern func_02022b70
.extern func_02022c30
.extern func_02022c80
.extern func_02030acc
.extern Actor_GetCollection
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
    bl func_020066a4
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl func_02005058
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr r0, [r4, #0x3c]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_02022c30
    add r0, r4, #0xc
    add r1, r4, #0x1c
    bl func_020050c8
    add r0, r4, #0x1c
    add r1, r4, #0x2c
    bl func_020050c8
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    cmp r0, #0x3c
    add r0, sp, #0x10
    blt .L_02022fac
    bl func_02005058
    mov r0, #0x1
    b .L_02022fb4
.L_02022fac:
    bl func_02005058
    mov r0, #0x0
.L_02022fb4:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size func_02022f28, .-func_02022f28

