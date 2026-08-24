.text
.extern func_020b0808
.extern func_ov042_0220507c
.extern func_ov042_02204eb4
.extern gFx32CosSinTable
.global func_ov042_02205b38
func_ov042_02205b38:
    stmdb sp!, {r4, r5, r6, lr}
    ldr lr, .L_02205ca8
    mov r0, r2, asr #0x4
    mov r2, r0, lsl #0x1
    mov r6, #0x0
    str r6, [lr, #0x0]
    ldr ip, [r1, #0x4]
    ldr r1, [r1, #0x0]
    add r0, r2, #0x1
    mov r5, r2, lsl #0x1
    str r1, [lr, #0x2c]
    str ip, [lr, #0x2c]
    ldr r4, .L_02205cac
    mov r2, r0, lsl #0x1
    ldrsh r0, [r4, r5]
    ldrsh r1, [r4, r2]
    mov r5, r3
    str r6, [lr, #0x2c]
    ldr r4, [sp, #0x10]
    bl func_020b0808
    ldrh r0, [sp, #0x14]
    ldr r1, .L_02205cb0
    mov r2, #0x1
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    ldmia r4, {r0, r1}
    bl func_ov042_0220507c
    ldr r0, [r5, #0x4]
    ldr r2, [r5, #0x0]
    sub r1, r0, #0x1
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, #0xae
    bl func_ov042_02204eb4
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x4]
    bl func_ov042_0220507c
    ldr r1, [r5, #0x4]
    ldr r0, [r5, #0x8]
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_02205cb4
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    bl func_ov042_0220507c
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x8]
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_02205cb4
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r1, [r4, #0xc]
    bl func_ov042_0220507c
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x0]
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r1, r0, lsr #0x10
    ldr r1, .L_02205cb4
    mov r0, r6
    str r2, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
    ldmia sp!, {r4, r5, r6, pc}
.L_02205ca8: .word 0x4000444
.L_02205cac: .word gFx32CosSinTable
.L_02205cb0: .word 0x4000500
.L_02205cb4: .word 0x4000494
.size func_ov042_02205b38, . - func_ov042_02205b38
