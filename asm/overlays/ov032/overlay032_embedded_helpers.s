.text

/* Exact fallback; see src/overlays/ov032/overlay032_embedded_helpers.c for documented portable C. */
.extern data_ov032_022022f8
.extern func_02071ea4
.extern func_02071eb8
.extern func_ov032_0220142c


    .global func_ov032_021fd7a4
func_ov032_021fd7a4:
    ldr r2, L_021fd7bc
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021fd7bc: .word data_ov032_022022f8
.size func_ov032_021fd7a4, .-func_ov032_021fd7a4
    .global func_ov032_021fd7c0
func_ov032_021fd7c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc
    bl func_02071ea4
    add r0, r4, #0x18
    bl func_ov032_0220142c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov032_021fd7c0, .-func_ov032_021fd7c0
    .global func_ov032_021fd7e0
func_ov032_021fd7e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov032_021fd7e0, .-func_ov032_021fd7e0
