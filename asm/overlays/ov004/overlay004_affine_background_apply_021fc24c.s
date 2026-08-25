    .text
    .extern func_020adc90
    .extern func_020afd28
    .extern gFx32CosSinTable
    .global Overlay004_ApplyAffineBackground
Overlay004_ApplyAffineBackground: ; 0x021fc24c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r8, r0
    add r0, r8, #0x100
    ldrsh r2, [r0, #0x10]
    ldr r0, L_021fc398
    ldr r1, [r8, #0x124]
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r0, [r0, r2]
    bl func_020adc90
    str r0, [sp, #0x8]
    add r0, r8, #0x100
    ldrsh r2, [r0, #0x10]
    ldr r0, L_021fc398
    ldr r1, [r8, #0x124]
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r0, [r0, r2]
    bl func_020adc90
    ldr r1, [sp, #0x8]
    rsb r2, r0, #0x0
    str r0, [sp, #0xc]
    str r1, [sp, #0x14]
    str r2, [sp, #0x10]
    ldr r4, [r8, #0x10c]
    ldr r2, [r8, #0x108]
    sub r6, r4, #0x60
    sub r5, r2, #0x80
    stmia sp, {r5, r6}
    ldr r0, L_021fc39c
    add r7, r6, #0xc0
    add r1, sp, #0x8
    add r3, r4, #0xc0
    bl func_020afd28
    stmia sp, {r5, r7}
    ldr r0, L_021fc3a0
    ldr r2, [r8, #0x108]
    add r1, sp, #0x8
    add r3, r4, #0xc0
    bl func_020afd28
    add r0, r8, #0x100
    ldrsh r2, [r0, #0x10]
    ldr r1, [r8, #0x140]
    ldr r0, L_021fc398
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r0, [r0, r2]
    mov r1, r1, lsl #0x2
    bl func_020adc90
    str r0, [sp, #0x8]
    add r0, r8, #0x100
    ldrsh r2, [r0, #0x10]
    ldr r1, [r8, #0x140]
    ldr r0, L_021fc398
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r0, [r0, r2]
    mov r1, r1, lsl #0x2
    bl func_020adc90
    ldr r1, [sp, #0x8]
    str r0, [sp, #0xc]
    rsb r0, r0, #0x0
    str r0, [sp, #0x10]
    str r1, [sp, #0x14]
    stmia sp, {r5, r6}
    ldr r0, L_021fc3a4
    ldr r2, [r8, #0x108]
    add r1, sp, #0x8
    add r3, r4, #0xc0
    bl func_020afd28
    stmia sp, {r5, r7}
    ldr r2, [r8, #0x108]
    ldr r0, L_021fc3a8
    add r1, sp, #0x8
    add r3, r4, #0xc0
    bl func_020afd28
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fc398: .word gFx32CosSinTable
L_021fc39c: .word 0x4001030
L_021fc3a0: .word 0x4000030
L_021fc3a4: .word 0x4001020
L_021fc3a8: .word 0x4000020
    .size Overlay004_ApplyAffineBackground, .-Overlay004_ApplyAffineBackground

