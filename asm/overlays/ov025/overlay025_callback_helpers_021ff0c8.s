.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */



    .global func_ov025_021ff0c8
func_ov025_021ff0c8:
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x10]
    ldr r3, [r0, #0x20]
    ldr r2, [r0, #0x30]
    mov r1, ip, asr #0xb
    add r3, r3, r2
    add r1, ip, r1, lsr #0x14
    mov r2, r3, asr #0xb
    mov r1, r1, lsl #0x4
    add r2, r3, r2, lsr #0x14
    mov r2, r2, lsl #0x4
    ldr r3, [r0, #0xe8]
    mov lr, r1, asr #0x10
    strh lr, [r3, #0x2c]
    mov ip, r2, asr #0x10
    strh ip, [r3, #0x2e]
    ldr r2, [r0, #0xa8]
    ldr r3, [r0, #0xec]
    add r2, r2, r1, asr #0x10
    strh r2, [r3, #0x2c]
    strh ip, [r3, #0x2e]
    ldr r2, [r0, #0xf0]
    strh lr, [r2, #0x2c]
    strh ip, [r2, #0x2e]
    ldr r2, [r0, #0xa8]
    ldr r3, [r0, #0xf4]
    add r0, r2, r1, asr #0x10
    strh r0, [r3, #0x2c]
    strh ip, [r3, #0x2e]
    ldmia sp!, {r3, pc}
.size func_ov025_021ff0c8, .-func_ov025_021ff0c8

