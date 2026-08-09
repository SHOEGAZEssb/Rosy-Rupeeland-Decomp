.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_0221a43c
func_ov097_0221a43c:
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov097_0221a43c, . - func_ov097_0221a43c
