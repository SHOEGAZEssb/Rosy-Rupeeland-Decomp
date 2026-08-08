.text

/* Exact fallback; see src/overlays/ov037/overlay037_terminal_teardown_thunks.c for documented portable C. */

    .extern func_020720d4
    .extern func_02095670
    .extern func_ov037_021fcf1c
    .extern func_02095308
    .extern Heap_Free
    .extern data_ov037_021fedac

    .global func_ov037_021fe99c
func_ov037_021fe99c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl func_020720d4
    mov r0, r4
    bl func_02095670
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fe99c, .-func_ov037_021fe99c

    .global func_ov037_021fe9c4
func_ov037_021fe9c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl func_020720d4
    mov r0, r4
    bl func_02095670
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fe9c4, .-func_ov037_021fe9c4

    .global func_ov037_021fe9e4
func_ov037_021fe9e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fe9e4, .-func_ov037_021fe9e4

    .global func_ov037_021fea00
func_ov037_021fea00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fea00, .-func_ov037_021fea00

    .global func_ov037_021fea14
func_ov037_021fea14:
    bx lr
    .size func_ov037_021fea14, .-func_ov037_021fea14

    .global func_ov037_021fea18
func_ov037_021fea18:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fea18, .-func_ov037_021fea18

    .global func_ov037_021fea34
func_ov037_021fea34:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fea34, .-func_ov037_021fea34

    .global func_ov037_021fea48
func_ov037_021fea48:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fea48, .-func_ov037_021fea48

    .global func_ov037_021fea64
func_ov037_021fea64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov037_021fcf1c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fea64, .-func_ov037_021fea64

    .global func_ov037_021fea78
func_ov037_021fea78:
    bx lr
    .size func_ov037_021fea78, .-func_ov037_021fea78

    .global func_ov037_021fea7c
func_ov037_021fea7c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021feaa0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021feaa0: .word data_ov037_021fedac
    .size func_ov037_021fea7c, .-func_ov037_021fea7c
