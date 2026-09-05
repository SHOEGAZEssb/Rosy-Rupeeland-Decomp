.text
; Matching fallback for the portable implementation in src/game/modal_geometry.c.
.extern G3Command_SubmitTexCoord
.extern func_020adc40
.extern func_020adc90

.global func_0209b880
func_0209b880:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    ldr r4, [sp, #0x5c]
    ldr r9, [sp, #0x58]
    str r4, [sp, #0x5c]
    ldr r4, .L_0209bca4
    mov r5, #0x0
    str r5, [r4, #0x0]
    ldr r7, [r0, #0x8c]
    ldr r6, [r0, #0x88]
    add r7, r7, #0x60000
    add r0, r6, #0x80000
    mov r6, r0, lsl #0x4
    mov r0, r7, lsl #0x4
    mov r6, r6, asr #0x10
    mov r7, r0, asr #0x10
    rsb r0, r6, #0x0
    str r0, [r4, #0x2c]
    rsb r0, r7, #0x0
    str r0, [r4, #0x2c]
    sub r0, r5, #0x1000
    str r0, [r4, #0x2c]
    cmp r9, #0x2
    movgt r0, #0x2
    strgt r0, [r4, #0xbc]
    movle r0, #0x1
    str r1, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r10, r3
    strle r0, [r4, #0xbc]
    ldrh r0, [sp, #0x60]
    ldr r4, .L_0209bca8
    mov r8, #0x0
    str r0, [sp, #0xc]
    sub r0, r9, #0x1
    str r0, [sp, #0x2c]
    sub r0, r4, #0x14
    str r0, [sp, #0x24]
    sub r0, r4, #0x8
    str r0, [sp, #0x28]
    b .L_0209bc7c
.L_0209b924:
    ldr r0, [sp, #0x0]
    mov r1, #0xc
    mla r2, r8, r1, r0
    ldr r1, [r2, #0x14]
    ldr r0, [r2, #0x8]
    ldr r3, [r2, #0x10]
    sub r5, r1, r0
    ldr r0, [r2, #0x4]
    smull r2, r1, r5, r5
    sub r0, r3, r0
    rsb r6, r0, #0x0
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r1, r1, r0
    mov r0, r2, lsr #0xc
    smull r3, r2, r6, r6
    adds r3, r3, #0x800
    orr r0, r0, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    mov r7, r0
    cmp r7, #0x0
    ble .L_0209b9b0
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r1, r7
    mov r5, r0
    mov r0, r6
    bl func_020adc90
    mov r6, r0
.L_0209b9b0:
    ldr r0, [sp, #0x4]
    mov r1, #0xc
    ldr r7, [r0, r8, lsl #0x2]
    ldr r0, [sp, #0x0]
    mla r1, r8, r1, r0
    ldr r0, [sp, #0x4]
    ldmib r1, {r3, lr}
    add r0, r0, r8, lsl #0x2
    ldr ip, [r0, #0x4]
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x14]
    str r1, [sp, #0x20]
    smull r11, r1, r5, r7
    adds r2, r11, #0x800
    adc r1, r1, #0x0
    mov r11, r2, lsr #0xc
    orr r11, r11, r1, lsl #0x14
    smull r7, r1, r6, r7
    adds r2, r7, #0x800
    adc r1, r1, #0x0
    mov r7, r2, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    smull r2, r1, r5, ip
    smull ip, r5, r6, ip
    adds r2, r2, #0x800
    adc r6, r1, #0x0
    mov r1, r2, lsr #0xc
    adds r2, ip, #0x800
    adc r5, r5, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r5, lsl #0x14
    sub r5, r3, r11
    add r3, r11, r3
    str r5, [sp, #0x1c]
    orr r1, r1, r6, lsl #0x14
    str r3, [sp, #0x18]
    sub r3, r0, r1
    add r0, r1, r0
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x20]
    cmp r8, #0x0
    sub r11, lr, r7
    add r5, r7, lr
    str r3, [sp, #0x14]
    sub r6, r0, r2
    add r7, r2, r0
    bne .L_0209baf4
    ldr r1, [sp, #0x5c]
    ldr r0, [sp, #0x24]
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x8]
    ldr r1, [r10, #0xc]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x18]
    mov r1, r5, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, [sp, #0x28]
    str r1, [r0, #0x0]
    ldr r1, [sp, #0xc]
    str r1, [r0, #0x0]
    ldmia r10, {r0, r1}
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x1c]
    mov r1, r11, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    b .L_0209bb7c
.L_0209baf4:
    mov r0, r8, lsl #0x1
    add r1, r10, r0, lsl #0x3
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x8]
    ldr r1, [r1, #0xc]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x18]
    mov r1, r5, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldr r1, [sp, #0x8]
    str r0, [r4, #0x0]
    ldr r0, [sp, #0x8]
    add r1, r10, r1, lsl #0x3
    ldr r0, [r10, r0, lsl #0x3]
    ldr r1, [r1, #0x4]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x1c]
    mov r1, r11, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
.L_0209bb7c:
    mov r5, r8, lsl #0x1
    cmp r9, #0x2
    add r1, r10, r5, lsl #0x3
    ble .L_0209bc04
    ldr r0, [r1, #0x18]
    ldr r1, [r1, #0x1c]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x10]
    mov r1, r7, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    add r1, r10, r5, lsl #0x3
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x14]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x14]
    mov r1, r6, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    b .L_0209bc78
.L_0209bc04:
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x14]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x14]
    mov r1, r6, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    add r1, r10, r5, lsl #0x3
    ldr r0, [r1, #0x18]
    ldr r1, [r1, #0x1c]
    bl G3Command_SubmitTexCoord
    ldr r0, [sp, #0x10]
    mov r1, r7, lsl #0x4
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
.L_0209bc78:
    add r8, r8, #0x1
.L_0209bc7c:
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    blt .L_0209b924
    ldr r1, .L_0209bcac
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0209bca4: .word 0x4000444
.L_0209bca8: .word 0x4000494
.L_0209bcac: .word 0x4000504
.size func_0209b880, . - func_0209b880
