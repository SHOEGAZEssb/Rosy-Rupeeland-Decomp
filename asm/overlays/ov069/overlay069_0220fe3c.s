.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_020c9670
.extern func_02005030
.extern func_02005058
.extern func_020ae024

.global func_ov069_0220fe3c
func_ov069_0220fe3c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r4, r0
    add r0, sp, #0x10
    mov r5, r2
    bl func_02005030
    add r0, sp, #0x0
    mov r1, r5
    bl func_02005030
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x8]
    add r5, r2, #0x2f000
    ldr r0, [sp, #0xc]
    ldr r2, [sp, #0x4]
    sub r0, r1, r0
    sub r3, r0, #0x28000
    ldr r1, [sp, #0x14]
    sub r0, r3, r5
    sub r1, r2, r1
    str r5, [sp, #0x18]
    str r3, [sp, #0x8]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_0220ff1c
    mov r0, r3, lsl #0x1
    ldrsh r5, [r1, r2]
    ldrsh r2, [r1, r0]
    mov r0, #0x5000
    umull lr, r6, r5, r0
    mov r1, #0x0
    umull ip, r3, r2, r0
    adds lr, lr, #0x800
    mov r7, lr, lsr #0xc
    mla r6, r5, r1, r6
    mla r3, r2, r1, r3
    mov lr, r5, asr #0x1f
    mla r6, lr, r0, r6
    mov r1, r2, asr #0x1f
    adc r5, r6, #0x0
    mla r3, r1, r0, r3
    adds r1, ip, #0x800
    orr r7, r7, r5, lsl #0x14
    adc r0, r3, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r7, [r4, #0x324]
    add r0, sp, #0x0
    str r1, [r4, #0x328]
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220ff1c: .word data_020c9670
.size func_ov069_0220fe3c, . - func_ov069_0220fe3c
