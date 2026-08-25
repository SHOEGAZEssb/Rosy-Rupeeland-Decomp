    .text
    .global Overlay000_SyncSelection
Overlay000_SyncSelection:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x26c]
    ldr lr, [r0, #0x27c]
    ldr r12, [r1, #0x14]
    ldr r2, [r1, #0xc]
    mov r1, #0x24
    mul r3, lr, r1
    sub r2, r12, r2
    mul r1, r2, r1
    add r2, r12, r12, lsl #0x2
    add r2, lr, r2
    str r2, [r0, #0x25c]
    ldr r12, [r0, #0x20]
    add r2, r3, #0x38
    strh r2, [r12, #0x2c]
    add r1, r1, #0x34
    strh r1, [r12, #0x2e]
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    ldmneia sp!, {r3, pc}
    ldr r3, [r0, #0x250]
    ldr r1, [r0, #0x25c]
    mov r2, #0x0
    add r1, r3, r1, lsl #0x5
    ldr r3, [r1, #0x10]
    mov r1, #0x1e
    str r3, [r0, #0x1c]
    str r2, [r0, #0x2a8]
    str r1, [r0, #0x2ac]
    ldmia sp!, {r3, pc}
    .size Overlay000_SyncSelection, .-Overlay000_SyncSelection
