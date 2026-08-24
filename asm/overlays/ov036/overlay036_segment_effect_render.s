.text

/* Exact fallback; see src/overlays/ov036/overlay036_segment_effect_render.c for documented portable C. */

    .extern func_ov036_021fd660
    .extern gFx32CosSinTable

    .global func_ov036_021fd97c
func_ov036_021fd97c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x60]
    ldr r1, L_021fdb94
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    mov r2, r2, lsl #0x1
    mov r0, r0, lsl #0x1
    ldr r6, [r4, #0xac]
    ldrsh r3, [r1, r2]
    ldrsh r2, [r1, r0]
    ldr r1, L_021fdb98
    mov r0, #0x1
    str r0, [r1, #0x0]
    ldrh r0, [r4, #0xb6]
    mul r5, r6, r3
    str r0, [r1, #-0x80]
    mul r3, r6, r2
    ldr r0, [r4, #0x9c]
    ldr r1, [r4, #0xa0]
    ldr r2, [r4, #0x30]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r6, r5, asr #0xb
    mov ip, r3, asr #0xb
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    add r5, r5, r6, lsr #0x14
    add r6, r3, ip, lsr #0x14
    bl func_ov036_021fd660
    ldr r0, [r4, #0xa8]
    ldr r2, [r4, #0xa4]
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    ldr r2, L_021fdb9c
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r2, #0x0]
    sub r0, r2, #0x14
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r3, [r4, #0xa8]
    ldr ip, [r4, #0xa4]
    add r3, r3, r6, asr #0xc
    mov r3, r3, lsl #0x10
    add lr, ip, r5, asr #0xc
    mov ip, r3, asr #0x10
    mov r3, lr, lsl #0x10
    mov ip, ip, lsl #0x10
    mov r3, r3, asr #0x10
    mov ip, ip, lsr #0x10
    mov r3, r3, lsl #0x10
    mov ip, ip, lsl #0x10
    orr r3, ip, r3, lsr #0x10
    str r3, [r2, #0x0]
    ldr r3, [r4, #0xa0]
    ldr ip, [r4, #0x9c]
    add r3, r3, r6, asr #0xc
    mov r3, r3, lsl #0x10
    add lr, ip, r5, asr #0xc
    mov ip, r3, asr #0x10
    mov r3, lr, lsl #0x10
    mov ip, ip, lsl #0x10
    mov r3, r3, asr #0x10
    mov ip, ip, lsr #0x10
    mov r3, r3, lsl #0x10
    mov ip, ip, lsl #0x10
    orr r3, ip, r3, lsr #0x10
    str r3, [r2, #0x0]
    ldrh r3, [r4, #0xb6]
    str r3, [r0, #0x0]
    ldr r3, [r4, #0xa8]
    ldr lr, [r4, #0xa4]
    mov r3, r3, lsl #0x10
    mov ip, r3, asr #0x10
    mov r3, lr, lsl #0x10
    mov ip, ip, lsl #0x10
    mov r3, r3, asr #0x10
    mov ip, ip, lsr #0x10
    mov r3, r3, lsl #0x10
    mov ip, ip, lsl #0x10
    orr r3, ip, r3, lsr #0x10
    str r3, [r2, #0x0]
    ldr r3, [r4, #0xa0]
    ldr lr, [r4, #0x9c]
    mov r3, r3, lsl #0x10
    mov ip, r3, asr #0x10
    mov r3, lr, lsl #0x10
    mov ip, ip, lsl #0x10
    mov r3, r3, asr #0x10
    mov ip, ip, lsr #0x10
    mov r3, r3, lsl #0x10
    mov ip, ip, lsl #0x10
    orr r3, ip, r3, lsr #0x10
    str r3, [r2, #0x0]
    str r1, [r0, #0x0]
    ldr r0, [r4, #0xa0]
    ldr r3, [r4, #0x9c]
    sub r0, r0, r6, asr #0xc
    mov r0, r0, lsl #0x10
    sub ip, r3, r5, asr #0xc
    mov r3, r0, asr #0x10
    mov r0, ip, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, asr #0x10
    mov r3, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    ldr r0, [r4, #0xa8]
    ldr r3, [r4, #0xa4]
    sub r0, r0, r6, asr #0xc
    mov r0, r0, lsl #0x10
    sub r4, r3, r5, asr #0xc
    mov r3, r0, asr #0x10
    mov r0, r4, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, asr #0x10
    mov r3, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    str r1, [r2, #0x70]
    ldmia sp!, {r4, r5, r6, pc}
L_021fdb94: .word gFx32CosSinTable
L_021fdb98: .word 0x4000500
L_021fdb9c: .word 0x4000494
    .size func_ov036_021fd97c, .-func_ov036_021fd97c
