.text

/* Exact fallback; see src/overlays/ov026/overlay026_motion_objects.c. */
.extern func_01ff88c4
.extern func_ov026_021fd018


    .global func_ov026_021fe56c
func_ov026_021fe56c:
    stmdb sp!, {r4, lr}
    ldr r2, L_021fe5b8
    mov r3, #0x0
    str r3, [r2, #0x0]
    ldr r1, [r0, #0x1c]
    str r3, [r2, #0x2c]
    str r1, [r2, #0x2c]
    str r3, [r2, #0x2c]
    ldr r4, [r0, #0xc]
    add r0, r0, #0x4
    bl func_ov026_021fd018
    mov r2, r0
    mov r1, r4
    mov r0, #0x3
    bl func_01ff88c4
    ldr r0, L_021fe5bc
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_021fe5b8: .word 0x4000444
L_021fe5bc: .word 0x4000448
.size func_ov026_021fe56c, .-func_ov026_021fe56c

