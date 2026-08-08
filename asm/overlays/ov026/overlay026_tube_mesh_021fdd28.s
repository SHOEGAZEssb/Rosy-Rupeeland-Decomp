.text

/* Exact fallback; see src/overlays/ov026/overlay026_tube_mesh.c. */
.extern func_01ff88c4
.extern func_ov026_021fd018


    .global func_ov026_021fdd28
func_ov026_021fdd28:
    stmdb sp!, {r4, lr}
    ldr ip, L_021fdd7c
    mov r1, #0x0
    str r1, [ip, #0x0]
    ldr r3, [r0, #0x10]
    ldr r2, [r0, #0xc]
    ldr r1, [r0, #0x8]
    str r1, [ip, #0x2c]
    str r2, [ip, #0x2c]
    str r3, [ip, #0x2c]
    ldr r4, [r0, #0x1c]
    add r0, r0, #0x14
    bl func_ov026_021fd018
    mov r2, r0
    mov r1, r4
    mov r0, #0x3
    bl func_01ff88c4
    ldr r0, L_021fdd80
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_021fdd7c: .word 0x4000444
L_021fdd80: .word 0x4000448
.size func_ov026_021fdd28, .-func_ov026_021fdd28

