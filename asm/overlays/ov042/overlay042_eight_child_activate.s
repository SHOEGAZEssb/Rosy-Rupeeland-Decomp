.text
.extern func_020a1794
    .global func_ov042_0220a93c
func_ov042_0220a93c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    ldmltia sp!, {r4, pc}
    add r0, r4, r0, lsl #0x2
    ldr ip, [r0, #0x4c]
    mov r0, r2, lsl #0x10
    ldrh r3, [ip, #0x42]
    mov r0, r0, asr #0x10
    mov r2, #0x8
    bic r3, r3, #0x4
    strh r3, [ip, #0x42]
    ldr ip, [r4, #0x8c]
    mov r3, #0x0
    add ip, r4, ip, lsl #0x2
    ldr ip, [ip, #0x4c]
    strh r0, [ip, #0x3c]
    strh r0, [ip, #0x3e]
    ldr r0, [r4, #0x8c]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x4c]
    strh r2, [r0, #0x40]
    ldr r2, [r4, #0x8c]
    ldr r0, [r4, #0x48]
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0x4c]
    add r2, r2, #0x2c
    bl func_020a1794
    ldr r0, [r4, #0x8c]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x6c]
    str r0, [r4, #0x8c]
    ldmia sp!, {r4, pc}
    .size func_ov042_0220a93c, . - func_ov042_0220a93c
