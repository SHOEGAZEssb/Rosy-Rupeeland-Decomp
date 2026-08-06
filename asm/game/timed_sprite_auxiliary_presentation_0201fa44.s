; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d61a8
.extern data_020d6270
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern func_02005580
.extern func_02009d78
.extern func_0201ded4
.extern func_0201e250
.extern func_0201e584
.extern func_0201f0fc
.extern gHeapContext

.global func_0201fa44
    .type func_0201fa44, @function
func_0201fa44: ; 0x0201fa44
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fa8c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201fa6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa6c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0201fa84
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa84:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fa8c: .word data_020d61a8
    .size func_0201fa44, .-func_0201fa44

