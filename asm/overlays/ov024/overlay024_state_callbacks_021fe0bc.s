.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_callbacks.c. */
.extern func_ov024_021fd86c


    .global func_ov024_021fe0bc
func_ov024_021fe0bc:
    stmdb sp!, {r3, lr}
    bl func_ov024_021fd86c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov024_021fe0bc, .-func_ov024_021fe0bc

