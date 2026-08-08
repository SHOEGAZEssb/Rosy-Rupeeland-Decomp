.text

/* Exact fallback; see src/overlays/ov029/overlay029_lifecycle_tail.c. */



    .global func_ov029_021fe780
func_ov029_021fe780:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov029_021fe780, .-func_ov029_021fe780
    .global func_ov029_021fe798
func_ov029_021fe798:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov029_021fe798, .-func_ov029_021fe798
