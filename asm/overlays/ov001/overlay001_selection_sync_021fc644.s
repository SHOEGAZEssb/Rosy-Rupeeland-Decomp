    .text
    .extern func_020befec
    .global Overlay001_SyncSelection
Overlay001_SyncSelection: ; 0x021fc644
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x1bc]
    ldr lr, [r4, #0x1cc]
    ldr ip, [r0, #0x14]
    ldr r1, [r0, #0xc]
    mov r0, #0x24
    sub r2, ip, r1
    mul r1, lr, r0
    mul r3, r2, r0
    add r0, ip, ip, lsl #0x2
    add r0, lr, r0
    str r0, [r4, #0x1ac]
    ldr r2, [r4, #0x20]
    add r0, r1, #0x38
    strh r0, [r2, #0x2c]
    add r0, r3, #0x34
    strh r0, [r2, #0x2e]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bne L_021fc6bc
    ldr r2, [r4, #0x20c]
    ldr r0, [r4, #0x1ac]
    mov r1, #0x0
    add r0, r2, r0, lsl #0x5
    ldr r2, [r0, #0x10]
    mov r0, #0x1e
    str r2, [r4, #0x1c]
    str r1, [r4, #0x1f8]
    str r0, [r4, #0x1fc]
L_021fc6bc:
    ldr r5, [r4, #0x1b0]
    cmp r5, #0x0
    blt L_021fc744
    mov r0, r5
    mov r1, #0x5
    bl func_020befec
    ldr r1, [r4, #0x1bc]
    ldr r1, [r1, #0xc]
    subs r1, r0, r1
    bmi L_021fc730
    cmp r1, #0x3
    bge L_021fc730
    mov r0, #0x24
    mul r2, r1, r0
    mov r0, r5
    mov r1, #0x5
    add r6, r2, #0x34
    ldr r5, [r4, #0x24]
    bl func_020befec
    mov r0, #0x24
    mul r0, r1, r0
    add r0, r0, #0x38
    strh r0, [r5, #0x2c]
    strh r6, [r5, #0x2e]
    ldr r1, [r4, #0x24]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
L_021fc730:
    ldr r1, [r4, #0x24]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
L_021fc744:
    ldr r1, [r4, #0x24]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
    .size Overlay001_SyncSelection, .-Overlay001_SyncSelection
