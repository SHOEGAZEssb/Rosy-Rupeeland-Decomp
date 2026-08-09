.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_geometry_recovery.c.
.extern func_ov048_0220bbfc
.extern func_ov048_0220bc28

.global func_ov048_0220baec
func_ov048_0220baec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr lr, .L_0220bbf4
    mov r7, r0
    mov r0, #0x0
    str r0, [lr, #0x0]
    mov ip, #0x10000
    str ip, [lr, #0x28]
    str ip, [lr, #0x28]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str ip, [lr, #0x28]
    mov r1, #0x1f
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x3f
    str r0, [sp, #0x4]
    bl func_ov048_0220bbfc
    bl func_ov048_0220bc28
    ldr r3, .L_0220bbf8
    mov r0, r6, lsl #0x10
    mov r1, r7, lsl #0x10
    ldr r2, [sp, #0x20]
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r6, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    mov r2, r5, lsl #0x10
    mov ip, #0x1
    mov r5, r1, asr #0x10
    mov r1, r2, asr #0x10
    mov r5, r5, lsl #0x10
    mov r7, r1, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r1, r1, asr #0x10
    mov r4, r1, lsl #0x10
    ldrh lr, [sp, #0x24]
    str ip, [r3, #0x0]
    sub r2, r3, #0x80
    mov r1, r0, lsr #0x10
    mov r0, r6, lsr #0x10
    mov r7, r7, lsr #0x10
    mov r4, r4, lsr #0x10
    str lr, [r2, #0x0]
    orr r6, r0, r1, lsl #0x10
    sub lr, r3, #0x74
    str r6, [lr, #0x0]
    mov r6, r5, lsr #0x10
    ldrh r5, [sp, #0x28]
    str r6, [lr, #0x0]
    orr r1, r7, r1, lsl #0x10
    sub r6, r3, #0x6c
    str r1, [r6, #0x0]
    str r5, [r2, #0x0]
    orr r1, r7, r4, lsl #0x10
    str r1, [r6, #0x0]
    orr r0, r0, r4, lsl #0x10
    str r0, [r6, #0x0]
    mov r0, #0x0
    str r0, [r3, #0x4]
    str ip, [r3, #-0xb8]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bbf4: .word 0x4000444
.L_0220bbf8: .word 0x4000500
.size func_ov048_0220baec, . - func_ov048_0220baec
