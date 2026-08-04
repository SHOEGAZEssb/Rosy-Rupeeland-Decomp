.text
.global func_0200572c
.type func_0200572c, @function
    .extern data_020d4168
    .extern func_020057dc
    .extern func_02073fc4

func_0200572c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #4
    ldr r12, [pc, #0x9c]
    mov r4, r0
    str r12, [r4, #0]
    ldr r12, [sp, #0x28]
    str r1, [r4, #0xc]
    add r0, r4, #0x14
    mov r6, r2
    mov r5, r3
    str r12, [r4, #0x10]
    bl func_020057dc
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    and r0, r0, #0xff
    str r0, [sp, #0]
    ldr r2, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r0, r6
    bl func_02073fc4
    ldr r2, [sp, #0x18]
    str r0, [r4, #4]
    mov r12, r0
    ldrh r3, [r12, #0x24]
    and r2, r2, #0xff
    ldr r1, [sp, #0x1c]
    orr r3, r3, #8
    strh r3, [r12, #0x24]
    str r2, [sp, #0]
    ldr r2, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r0, r5
    bl func_02073fc4
    str r0, [r4, #8]
    ldrh r2, [r0, #0x24]
    mov r1, #0
    orr r2, r2, #8
    strh r2, [r0, #0x24]
    str r1, [r4, #0x1c]
    str r1, [r4, #0x18]
    mov r0, r4
    add sp, sp, #4
    ldmia sp!, {r3, r4, r5, r6, pc}
    .word data_020d4168
    .size func_0200572c, .-func_0200572c
