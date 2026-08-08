.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */
.extern data_ov025_02203338
.extern func_020953c8


    .global func_ov025_021ff21c
func_ov025_021ff21c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020953c8
    ldr r1, L_021ff238
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
L_021ff238: .word data_ov025_02203338
.size func_ov025_021ff21c, .-func_ov025_021ff21c

