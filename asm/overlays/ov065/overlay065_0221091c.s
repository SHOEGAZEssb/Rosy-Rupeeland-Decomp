.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern data_020c9670
.extern func_020050a4
.extern genrand_int32

.global func_ov065_0221091c
func_ov065_0221091c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    bl genrand_int32
    add r2, r7, #0x100
    ldr r1, .L_022109f8
    ldrh r3, [r2, #0x22]
    and r0, r0, r1
    add r0, r0, #0x1000
    add r0, r3, r0
    strh r0, [r2, #0x22]
    ldrh r0, [r2, #0x22]
    ldr r1, .L_022109fc
    ldr r2, [r7, #0x144]
    mov r0, r0, asr #0x4
    mov r4, r0, lsl #0x1
    add r0, r4, #0x1
    mov r3, r0, lsl #0x1
    mov r0, r4, lsl #0x1
    ldrsh r3, [r1, r3]
    ldrsh r1, [r1, r0]
    ldr r0, [r7, #0x148]
    smull r2, r4, r3, r2
    adds r5, r2, #0x800
    smull r2, r0, r1, r0
    adc r3, r4, #0x0
    adds r1, r2, #0x800
    mov r5, r5, lsr #0xc
    adc r0, r0, #0x0
    mov r4, r1, lsr #0xc
    orr r5, r5, r3, lsl #0x14
    orr r4, r4, r0, lsl #0x14
    bl genrand_int32
    ldr r2, .L_02210a00
    add r1, r7, #0x134
    and r7, r0, r2
    mov r0, r6
    bl func_020050a4
    smull r0, r2, r5, r7
    adds r3, r0, #0x800
    smull r1, r0, r4, r7
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    ldr r4, [r6, #0x4]
    orr r3, r3, r2, lsl #0x14
    add r2, r4, r3
    str r2, [r6, #0x4]
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    ldr r2, [r6, #0x8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r6, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022109f8: .word 0x7ff
.L_022109fc: .word data_020c9670
.L_02210a00: .word 0xfff
.size func_ov065_0221091c, . - func_ov065_0221091c
