.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern func_ov023_021fe77c


    .global func_ov023_021ffb0c
func_ov023_021ffb0c:
    stmdb sp!, {r3, lr}
    bl func_ov023_021fe77c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov023_021ffb0c, .-func_ov023_021ffb0c

