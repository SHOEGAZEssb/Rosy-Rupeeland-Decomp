.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */



    .global func_ov025_021fd3dc
func_ov025_021fd3dc:
    ldr r1, [r0, #0x174]
    mov r2, #0x100
    strh r2, [r1, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x174]
    bx lr
.size func_ov025_021fd3dc, .-func_ov025_021fd3dc

