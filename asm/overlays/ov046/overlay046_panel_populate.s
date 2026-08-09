.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_graphics_recovery.c.
.extern GameWork_TestFlag
.extern data_020d7834
.extern data_ov046_0220cd14
.extern data_ov046_0220cdf0
.extern func_02072b68
.extern func_020740e8
.extern func_ov046_0220bd14
.extern gGameWork

.global func_ov046_0220bffc
func_ov046_0220bffc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    str r3, [sp, #0x0]
    mov r9, r0
    movs r8, r2
    ldrne r2, [r9, #0xbc]
    mov r3, #0x0
    ldrneh r0, [r2, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r2, #0x24]
.L_0220c020:
    add r0, r9, r3, lsl #0x2
    ldr r2, [r0, #0x3c]
    add r3, r3, #0x1
    ldrh r0, [r2, #0x24]
    cmp r3, #0x20
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    blt .L_0220c020
    mov r0, #0x34
    mov r2, #0x14
    mul r4, r1, r0
    add r0, r9, r1, lsl #0x2
    ldr r0, [r0, #0xe0]
    ldr r3, .L_0220c194
    mul r2, r1, r2
    ldr r1, .L_0220c198
    cmp r0, #0x2
    add r7, r1, r2
    ldr r4, [r3, r4]
    ldr r2, [r1, r2]
    bne .L_0220c188
    ldr r1, .L_0220c19c
    mov r0, #0x28
    mla r6, r2, r0, r1
    mov r5, #0x0
    add r11, r9, #0x14
    b .L_0220c180
.L_0220c08c:
    ldrsh r0, [r4, #0x0]
    cmp r0, #0x3
    beq .L_0220c188
    ldrh r1, [r4, #0xa]
    cmp r1, #0x0
    beq .L_0220c0b8
    ldr r0, .L_0220c1a0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220c178
.L_0220c0b8:
    ldrsh r3, [r4, #0x2]
    add r1, r9, r5, lsl #0x2
    mov r2, #0xc
    ldr r0, [r9, #0x4]
    ldr r1, [r1, #0x3c]
    smlabb r2, r3, r2, r11
    bl func_020740e8
    ldrsh r1, [r4, #0x4]
    add r0, r9, r5, lsl #0x2
    ldr r0, [r0, #0x3c]
    and r1, r1, #0xff
    bl func_02072b68
    ldrsh r3, [r4, #0x6]
    ldr r1, [r6, #0x18]
    ldr r0, [r7, #0x4]
    ldr ip, [r6, #0x1c]
    add r0, r1, r0, lsl #0x6
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r10, r0, asr #0x10
    add r2, r9, r5, lsl #0x2
    ldr r3, [r7, #0x8]
    mov r0, #0x30
    mla r0, r3, r0, ip
    ldrsh lr, [r4, #0x8]
    ldr r1, [r2, #0x3c]
    cmp r8, #0x0
    add r0, lr, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r10, [r1, #0x2c]
    strh r0, [r1, #0x2e]
    ldr r2, [r2, #0x3c]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    beq .L_0220c178
    ldrh r2, [r4, #0xa]
    ldr r1, [sp, #0x0]
    cmp r1, r2
    bne .L_0220c178
    ldr r1, [r9, #0xbc]
    strh r10, [r1, #0x2c]
    strh r0, [r1, #0x2e]
    ldr r1, [r9, #0xbc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_0220c178:
    add r5, r5, #0x1
    add r4, r4, #0xc
.L_0220c180:
    cmp r5, #0x20
    blt .L_0220c08c
.L_0220c188:
    mov r0, r9
    bl func_ov046_0220bd14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c194: .word data_020d7834
.L_0220c198: .word data_ov046_0220cd14
.L_0220c19c: .word data_ov046_0220cdf0
.L_0220c1a0: .word gGameWork
.size func_ov046_0220bffc, . - func_ov046_0220bffc
