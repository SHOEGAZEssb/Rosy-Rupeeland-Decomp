.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern func_01ff88c4
.extern func_ov026_021fd018


    .global func_ov026_021fd540
func_ov026_021fd540:
    stmdb sp!, {r4, lr}
    ldr ip, L_021fd5a8
    mov r1, #0x0
    str r1, [ip, #0x0]
    ldr r3, [r0, #0x30]
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x10]
    str r1, [ip, #0x2c]
    str r2, [ip, #0x2c]
    str r3, [ip, #0x2c]
    ldr r2, [r0, #0xb4]
    ldr r1, [r0, #0x70]
    str r1, [ip, #0x28]
    str r2, [ip, #0x28]
    str r1, [ip, #0x28]
    ldr r4, [r0, #0xa4]
    add r0, r0, #0x9c
    bl func_ov026_021fd018
    mov r2, r0
    mov r1, r4
    mov r0, #0x3
    bl func_01ff88c4
    ldr r0, L_021fd5ac
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_021fd5a8: .word 0x4000444
L_021fd5ac: .word 0x4000448
.size func_ov026_021fd540, .-func_ov026_021fd540

