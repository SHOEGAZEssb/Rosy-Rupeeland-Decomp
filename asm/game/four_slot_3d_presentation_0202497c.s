; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern data_020c9670
.extern func_020ae024

    .global func_0202497c
    .type func_0202497c, @function
func_0202497c: ; 0x0202497c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    ldrsh r5, [r6, #0x4]
    ldrsh r0, [r6, #0x0]
    ldrsh r4, [r6, #0x6]
    ldrsh r1, [r6, #0x2]
    sub r0, r5, r0
    mov r5, r2
    sub r1, r4, r1
    mov r4, r3
    bl func_020ae024
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    ldr r1, .L_02024af8
    mov r0, r0, lsl #0x1
    ldrsh r0, [r1, r0]
    mov r2, r2, lsl #0x1
    ldrsh r1, [r1, r2]
    mul r2, r5, r0
    mul ip, r5, r1
    ldr r0, .L_02024afc
    mov r1, r2, asr #0xb
    str r4, [r0, #0x0]
    add r2, r2, r1, lsr #0x14
    mov r1, ip, asr #0xb
    mov r3, r2, asr #0xc
    add r1, ip, r1, lsr #0x14
    mov lr, r1, asr #0xc
    ldrsh r4, [r6, #0x2]
    add r3, r3, r3, lsr #0x1f
    ldrsh ip, [r6, #0x0]
    add r5, r4, r3, asr #0x1
    add r4, lr, lr, lsr #0x1f
    mov r5, r5, lsl #0x10
    add lr, ip, r4, asr #0x1
    mov ip, r5, asr #0x10
    mov r5, lr, lsl #0x10
    mov ip, ip, lsl #0x10
    mov r5, r5, asr #0x10
    mov ip, ip, lsr #0x10
    mov r5, r5, lsl #0x10
    mov ip, ip, lsl #0x10
    orr ip, ip, r5, lsr #0x10
    ldr r5, .L_02024b00
    str ip, [r0, #0xc]
    str r5, [r0, #0xc]
    ldrsh ip, [r6, #0x2]
    ldrsh lr, [r6, #0x0]
    ldrh r5, [sp, #0x10]
    sub r3, ip, r3, asr #0x1
    mov r3, r3, lsl #0x10
    sub ip, lr, r4, asr #0x1
    mov r4, r3, asr #0x10
    mov r3, ip, lsl #0x10
    mov r4, r4, lsl #0x10
    mov r3, r3, asr #0x10
    mov r4, r4, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r4, r4, lsl #0x10
    orr r3, r4, r3, lsr #0x10
    str r3, [r0, #0x14]
    str r5, [r0, #0x0]
    ldrsh r3, [r6, #0x6]
    ldrsh r4, [r6, #0x4]
    sub r3, r3, r2, asr #0xc
    mov r3, r3, lsl #0x10
    sub r5, r4, r1, asr #0xc
    mov r4, r3, asr #0x10
    mov r3, r5, lsl #0x10
    mov r4, r4, lsl #0x10
    mov r3, r3, asr #0x10
    mov r4, r4, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r4, r4, lsl #0x10
    orr r3, r4, r3, lsr #0x10
    str r3, [r0, #0x14]
    ldrsh r3, [r6, #0x6]
    ldrsh r4, [r6, #0x4]
    add r2, r3, r2, asr #0xc
    mov r2, r2, lsl #0x10
    add r1, r4, r1, asr #0xc
    mov r2, r2, asr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x14]
    ldmia sp!, {r4, r5, r6, pc}
.L_02024af8: .word data_020c9670
.L_02024afc: .word 0x4000480
.L_02024b00: .word 0xfff0
    .size func_0202497c, . - func_0202497c
