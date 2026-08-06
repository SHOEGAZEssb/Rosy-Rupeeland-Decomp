    .text
    .extern func_02095820
    .global func_ov000_021fc340
func_ov000_021fc340:
    stmdb sp!, {r3, lr}
    str r1, [r0, #0x264]
    ldr r3, [r0, #0x26c]
    mov r2, #0x24
    ldr r3, [r3, #0xc]
    mul r2, r3, r2
    rsb r2, r2, #0x34
    sub r3, r2, r1
    str r3, [r0, #0x268]
    ldr r2, [r0, #0x8]
    str r3, [r2, #0x1c]
    ldr r3, [r0, #0x264]
    ldr r2, [r0, #0xc]
    rsb r3, r3, #0x0
    str r3, [r2, #0x1c]
    ldr r2, [r0, #0x26c]
    ldr r12, [r0, #0x264]
    ldr r3, [r2, #0x50]
    rsb r12, r12, #0x2a
    add r2, r1, #0xaa
    add r0, r0, #0x24
    mov r1, #0xec
    str r12, [r3, #0x1c]
    bl func_02095820
    ldmia sp!, {r3, pc}
    .size func_ov000_021fc340, .-func_ov000_021fc340
