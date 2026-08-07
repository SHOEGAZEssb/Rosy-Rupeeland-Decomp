.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern func_ov022_021fdca0


    .global func_ov022_021fefe0
func_ov022_021fefe0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x48]
    mov r0, #0x18
    orr r1, r1, #0x2
    str r1, [r4, #0x48]
    ldr r3, [r4, #0xa4]
    mov r2, #0x86
    ldrh r1, [r3, #0x24]
    bic r1, r1, #0x4
    strh r1, [r3, #0x24]
    ldr r1, [r4, #0x2b8]
    ldr r3, [r4, #0xa4]
    ldr r1, [r1, #0x30]
    ldr ip, [r1, #0xc]
    ldr r1, [r1, #0x14]
    sub r1, r1, ip
    mul r0, r1, r0
    strh r2, [r3, #0x2c]
    add r0, r0, #0x1c
    strh r0, [r3, #0x2e]
    ldr r0, [r4, #0x2b8]
    bl func_ov022_021fdca0
    ldr r0, [r0, #0x0]
    str r0, [r4, #0x2bc]
    ldmia sp!, {r4, pc}
.size func_ov022_021fefe0, .-func_ov022_021fefe0

