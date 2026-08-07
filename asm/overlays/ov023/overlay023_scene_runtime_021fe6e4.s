.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */



    .global func_ov023_021fe6e4
func_ov023_021fe6e4:
    ldr r2, [r0, #0xcc]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x388]
    cmp r1, #0x0
    beq L_021fe70c
    cmp r1, #0x1
    beq L_021fe740
    bx lr
L_021fe70c:
    ldr r2, [r0, #0x390]
    ldr r3, [r0, #0xcc]
    ldr r2, [r2, #0x38]
    mov r1, #0x1a
    ldr ip, [r2, #0x14]
    ldr r0, [r2, #0xc]
    mov r2, #0x86
    sub ip, ip, r0
    mul r0, ip, r1
    strh r2, [r3, #0x2c]
    add r0, r0, #0x2d
    strh r0, [r3, #0x2e]
    bx lr
L_021fe740:
    ldr r2, [r0, #0x48c]
    mov r1, #0x16
    add r2, r0, r2, lsl #0x2
    ldr r2, [r2, #0x430]
    ldr r3, [r0, #0xcc]
    ldr r0, [r2, #0x48]
    mov r2, #0x88
    ldr ip, [r0, #0x14]
    ldr r0, [r0, #0xc]
    sub ip, ip, r0
    mul r0, ip, r1
    strh r2, [r3, #0x2c]
    add r0, r0, #0x3e
    strh r0, [r3, #0x2e]
    bx lr
.size func_ov023_021fe6e4, .-func_ov023_021fe6e4

