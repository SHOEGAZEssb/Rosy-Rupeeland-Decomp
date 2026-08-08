.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern data_ov026_022049ec
.extern func_02002728
.extern func_ov026_021fce50


    .global func_ov026_021fd4e0
func_ov026_021fd4e0:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd508
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xb0]
    bl func_02002728
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd508: .word data_ov026_022049ec
.size func_ov026_021fd4e0, .-func_ov026_021fd4e0

