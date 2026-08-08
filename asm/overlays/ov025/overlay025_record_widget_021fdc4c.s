.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */



    .global func_ov025_021fdc4c
func_ov025_021fdc4c:
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov025_021fdc4c, .-func_ov025_021fdc4c

