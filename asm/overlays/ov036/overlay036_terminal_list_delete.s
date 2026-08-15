.text

/* Exact fallback; see src/overlays/ov036/overlay036_terminal_teardown_thunks.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern Heap_Free
    .extern data_ov036_02205eac

    .global func_ov036_02204d44
func_ov036_02204d44:
    stmdb sp!, {r4, lr}
    ldr r1, L_02204d68
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02204d68: .word data_ov036_02205eac
    .size func_ov036_02204d44, .-func_ov036_02204d44

