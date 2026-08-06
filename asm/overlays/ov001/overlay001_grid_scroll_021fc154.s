    .text
    .extern func_02095820
    .global func_ov001_021fc154
func_ov001_021fc154:
    stmdb sp!, {r3, lr}
    str r1, [r0, #0x1b4]
    ldr r3, [r0, #0x1bc]
    mov r2, #0x24
    ldr r3, [r3, #0xc]
    mul r2, r3, r2
    rsb r2, r2, #0x34
    sub r3, r2, r1
    str r3, [r0, #0x1b8]
    ldr r2, [r0, #0x8]
    str r3, [r2, #0x1c]
    ldr r3, [r0, #0x1b4]
    ldr r2, [r0, #0xc]
    rsb r3, r3, #0x0
    str r3, [r2, #0x1c]
    ldr r2, [r0, #0x1bc]
    ldr r12, [r0, #0x1b4]
    ldr r3, [r2, #0x50]
    rsb r12, r12, #0x2a
    add r2, r1, #0xaa
    add r0, r0, #0x28
    mov r1, #0xec
    str r12, [r3, #0x1c]
    bl func_02095820
    ldmia sp!, {r3, pc}
    .size func_ov001_021fc154, .-func_ov001_021fc154
