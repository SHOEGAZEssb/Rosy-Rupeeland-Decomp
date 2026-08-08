.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */

    .global func_ov032_02201930
func_ov032_02201930:
    ldr r2, [r0, #0x4c]
    mov r1, #0x18
    ldr ip, [r2, #0xc]
    ldr r3, [r2, #0x14]
    ldr r2, [r0, #0x18]
    sub r0, r3, ip
    mul r1, r0, r1
    mov r0, #0x78
    strh r0, [r2, #0x2c]
    add r0, r1, #0x24
    strh r0, [r2, #0x2e]
    bx lr
.size func_ov032_02201930, .-func_ov032_02201930

