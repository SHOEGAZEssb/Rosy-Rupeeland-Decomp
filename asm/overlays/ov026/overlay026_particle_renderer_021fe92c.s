.text

/* Exact fallback; see src/overlays/ov026/overlay026_particle_renderer.c. */
.extern data_020f4e18
.extern data_ov026_022049b4
.extern data_ov026_02204a40
.extern func_02077ca0
.extern func_020949ec
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fe92c
func_ov026_021fe92c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_020949ec
    ldr ip, L_021fe9a8
    ldr r1, L_021fe9ac
    ldr r3, L_021fe9b0
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r4, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe97c
    ldr r3, L_021fe9b4
    ldr r1, L_021fe9b8
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r5
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fe97c:
    str r0, [r4, #0x9c]
    mov r0, #0x4
    ldr r1, L_021fe9bc
    str r0, [r4, #0xa0]
    ldr r0, L_021fe9c0
    str r1, [r4, #0xa4]
    strh r0, [r4, #0xa8]
    mov r1, #0x1f
    mov r0, r4
    strh r1, [r4, #0xaa]
    ldmia sp!, {r3, r4, r5, pc}
L_021fe9a8: .word data_ov026_022049b4
L_021fe9ac: .word data_ov026_02204a40
L_021fe9b0: .word gHeapContext
L_021fe9b4: .word 0x6121
L_021fe9b8: .word data_020f4e18
L_021fe9bc: .word 0x666
L_021fe9c0: .word 0x7fff
.size func_ov026_021fe92c, .-func_ov026_021fe92c

