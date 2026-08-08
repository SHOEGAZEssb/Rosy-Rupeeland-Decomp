.text

/* Exact fallback; see src/overlays/ov028/overlay028_selection_runtime.c. */
.extern func_ov028_021fe558


    .global func_ov028_021fe6bc
func_ov028_021fe6bc:
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x8c]
    mov r1, #0x18
    ldrh r2, [ip, #0x24]
    mov r3, #0x84
    bic r2, r2, #0x4
    strh r2, [ip, #0x24]
    ldr r2, [r0, #0x220]
    ldr ip, [r0, #0x8c]
    ldr r2, [r2, #0x44]
    ldr lr, [r2, #0xc]
    ldr r2, [r2, #0x14]
    sub r2, r2, lr
    mul r1, r2, r1
    strh r3, [ip, #0x2c]
    add r1, r1, #0x1e
    strh r1, [ip, #0x2e]
    ldr r1, [r0, #0x220]
    ldr r1, [r1, #0x44]
    ldr r1, [r1, #0x14]
    bl func_ov028_021fe558
    ldmia sp!, {r3, pc}
.size func_ov028_021fe6bc, .-func_ov028_021fe6bc
