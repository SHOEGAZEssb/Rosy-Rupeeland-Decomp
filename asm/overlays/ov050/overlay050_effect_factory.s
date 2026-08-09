.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_manager_recovery.c.
.extern Heap_Alloc
.extern Heap_Free
.extern data_ov050_0220e320
.extern data_ov050_0220e394
.extern data_ov050_0220e3e0
.extern func_ov050_0220d600
.extern func_ov050_0220d6b0
.extern func_ov050_0220d6e8
.extern func_ov050_0220d7c4
.extern func_ov050_0220d95c
.extern gHeapContext

.global func_ov050_0220d9c4
func_ov050_0220d9c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldr r0, [r7, #0x34]
    mov r6, r1
    cmp r0, #0x0
    beq .L_0220da98
    ldr r0, [r7, #0x10]
    add r0, r0, #0x1
    str r0, [r7, #0x10]
    cmp r0, #0xa
    ble .L_0220da98
    mov r0, #0x0
    str r0, [r7, #0x10]
    ldr r0, [r7, #0xc]
    cmp r0, #0xa
    bge .L_0220da98
    ldr r1, .L_0220db2c
    ldr r3, .L_0220db30
    mov r0, #0x2c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0220da40
    add r1, r7, #0x20
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x14]
    ldr r2, [r7, #0x18]
    ldr r3, [r7, #0x1c]
    bl func_ov050_0220d600
    mov r4, r0
.L_0220da40:
    ldr r1, [r7, #0x30]
    mov r0, r4
    bl func_ov050_0220d7c4
    ldr r1, .L_0220db34
    ldr r3, .L_0220db30
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r7, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r7, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r7, #0xc]
    add r0, r0, #0x1
    str r0, [r7, #0xc]
.L_0220da98:
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0220db20
    ldr r4, [r7, #0x4]
    ldr r9, .L_0220db38
    add r8, sp, #0x4
    b .L_0220db18
.L_0220dac0:
    ldr r5, [r4, #0x8]
    ldmib r6, {r0, r1}
    mov r3, r1, asr #0xc
    mov r2, r0, asr #0xc
    mov r0, r5
    mov r1, r8
    str r9, [sp, #0x4]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    bl func_ov050_0220d6e8
    cmp r0, #0x0
    beq .L_0220db14
    mov r0, r7
    mov r1, r4
    bl func_ov050_0220d95c
    cmp r5, #0x0
    beq .L_0220db14
    mov r0, r5
    bl func_ov050_0220d6b0
    mov r0, r5
    bl Heap_Free
.L_0220db14:
    ldr r4, [r4, #0x0]
.L_0220db18:
    cmp r4, #0x0
    bne .L_0220dac0
.L_0220db20:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0220db2c: .word data_ov050_0220e3e0
.L_0220db30: .word gHeapContext
.L_0220db34: .word data_ov050_0220e320
.L_0220db38: .word data_ov050_0220e394
.size func_ov050_0220d9c4, . - func_ov050_0220d9c4
