.text

/* Exact fallback; see src/overlays/ov026/overlay026_particle_renderer.c. */
.extern data_ov026_022049b4
.extern func_02077d08
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021fea04
func_ov026_021fea04:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fea48
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fea30
    mov r0, r4
    bl func_02077d08
    mov r0, r4
    bl Heap_Free
L_021fea30:
    mov r0, r5
    bl func_ov026_021fce50
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fea48: .word data_ov026_022049b4
.size func_ov026_021fea04, .-func_ov026_021fea04

