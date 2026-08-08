.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_exit_state.c for documented portable C. */
.extern func_ov030_021fe768
.extern Heap_Free


    .global func_ov030_021ff6e4
func_ov030_021ff6e4:
    stmdb sp!, {r3, lr}
    bl func_ov030_021fe768
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov030_021ff6e4, .-func_ov030_021ff6e4
    .global func_ov030_021ff6f4
func_ov030_021ff6f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov030_021ff6f4, .-func_ov030_021ff6f4
