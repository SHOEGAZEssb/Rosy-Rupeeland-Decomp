.text

/* Exact fallback; see src/overlays/ov026/overlay026_disc_mesh.c. */
.extern func_01ff88c4
.extern func_ov026_021fd018


    .global func_ov026_021fe284
func_ov026_021fe284:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe2c0
    mov r2, #0x0
    str r2, [r1, #0x0]
    ldr r4, [r0, #0x10]
    add r0, r0, #0x8
    bl func_ov026_021fd018
    mov r2, r0
    mov r1, r4
    mov r0, #0x3
    bl func_01ff88c4
    ldr r0, L_021fe2c4
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_021fe2c0: .word 0x4000444
L_021fe2c4: .word 0x4000448
.size func_ov026_021fe284, .-func_ov026_021fe284

