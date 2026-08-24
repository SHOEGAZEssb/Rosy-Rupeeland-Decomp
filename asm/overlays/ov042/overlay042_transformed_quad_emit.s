.text
.extern func_020b0808
.extern func_ov042_0220507c
.extern func_ov042_02204eb4
.extern gFx32CosSinTable
.global func_ov042_02204ee4
func_ov042_02204ee4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, .L_0220506c
    mov lr, #0x0
    str lr, [ip, #0x0]
    ldr r5, [r1, #0xc]
    ldr r4, [r1, #0x8]
    ldr r1, [r1, #0x4]
    mov r0, r2, asr #0x4
    str r1, [ip, #0x2c]
    str r4, [ip, #0x2c]
    str r5, [ip, #0x2c]
    mov r1, r0, lsl #0x1
    ldmib r3, {r2, r4, r5}
    str r2, [ip, #0x28]
    str r4, [ip, #0x28]
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    ldr r2, .L_02205070
    mov r1, r0, lsl #0x1
    ldr r6, [sp, #0x14]
    str r5, [ip, #0x28]
    ldmia r6, {r4, r5}
    str r4, [ip, #0x2c]
    str r5, [ip, #0x2c]
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    str lr, [ip, #0x2c]
    ldr r5, [sp, #0x10]
    ldr r4, [sp, #0x18]
    bl func_020b0808
    ldrh r0, [sp, #0x1c]
    ldr r1, .L_02205074
    mov r2, #0x1
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    ldmia r4, {r0, r1}
    bl func_ov042_0220507c
    ldmia r5, {r0, r1, r2}
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov042_02204eb4
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x4]
    bl func_ov042_0220507c
    ldr r1, [r5, #0x4]
    ldr r0, [r5, #0xc]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_02205078
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    bl func_ov042_0220507c
    ldr r1, [r5, #0x10]
    ldr r0, [r5, #0xc]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_02205078
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r1, [r4, #0xc]
    bl func_ov042_0220507c
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x0]
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, .L_02205078
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    mov r0, #0x0
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220506c: .word 0x4000444
.L_02205070: .word gFx32CosSinTable
.L_02205074: .word 0x4000500
.L_02205078: .word 0x4000494
.size func_ov042_02204ee4, . - func_ov042_02204ee4
