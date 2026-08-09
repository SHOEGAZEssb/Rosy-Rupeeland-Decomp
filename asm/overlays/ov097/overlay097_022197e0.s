.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221a4c8

.global func_ov097_022197e0
func_ov097_022197e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr ip, [r0, #0x278]
    cmp ip, #0x0
    ldrne r2, [r0, #0x228]
    cmpne r2, #0x0
    beq .L_022198b0
    ldr r1, [r2, #0x1c]
    ldr r2, [r2, #0x20]
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    mov lr, #0x0
    mov r6, r2, asr #0x10
    mov r3, #0x1
    mov r5, r1, asr #0x10
    ldr r7, [ip, #0x8]
    mov r2, lr
    mov r11, lr
    mov r1, r3
    b .L_0221988c
.L_0221982c:
    ldr r4, [ip, #0x4]
    add r4, r4, lr, lsl #0x3
    ldrsh r8, [r4, #0x6]
    ldrsh r9, [r4, #0x2]
    ldrsh r10, [r4, #0x0]
    cmp r6, r8
    movlt r8, r3
    movge r8, r2
    cmp r6, r9
    movge r9, r1
    movlt r9, r11
    cmp r5, r10
    movge r10, #0x1
    ldrsh r4, [r4, #0x4]
    movlt r10, #0x0
    cmp r5, r4
    movlt r4, #0x1
    movge r4, #0x0
    and r4, r10, r4
    and r4, r9, r4
    tst r8, r4
    movne r1, #0x1
    bne .L_02219898
    add lr, lr, #0x1
.L_0221988c:
    cmp lr, r7
    blt .L_0221982c
    mov r1, #0x0
.L_02219898:
    cmp r1, #0x0
    bne .L_022198b0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022198b0:
    ldr r2, .L_022198e4
    add r1, r0, #0x200
    ldr r4, [r2, #0x68]
    ldr r3, [r2, #0x6c]
    mov r2, #0x0
    str r4, [r0, #0x2a4]
    str r3, [r0, #0x2a8]
    strh r2, [r1, #0x98]
    strh r2, [r1, #0x9c]
    ldr r1, [r0, #0x260]
    orr r1, r1, #0xa
    str r1, [r0, #0x260]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022198e4: .word data_ov097_0221a4c8
.size func_ov097_022197e0, . - func_ov097_022197e0
