.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */



    .global func_ov023_021fef54
func_ov023_021fef54:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov023_021fef54, .-func_ov023_021fef54

