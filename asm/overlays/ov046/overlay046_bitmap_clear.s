.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_graphics_recovery.c.

.global func_ov046_0220bc80
func_ov046_0220bc80:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, [r2, #0x8]
    mov r0, #0x6
    mul lr, r3, r0
    ldr r3, [r2, #0x10]
    ldr r4, [r2, #0x4]
    mla ip, r3, r0, lr
    ldr r0, [r2, #0xc]
    mov r2, r4, lsl #0x3
    add r3, r2, r0, lsl #0x3
    ldr r1, [r1, #0x24]
    mov r0, #0x0
    b .L_0220bd08
.L_0220bcb4:
    mov r4, lr, asr #0x4
    add r4, lr, r4, lsr #0x1b
    mov r6, lr, lsl #0x1b
    mov r5, r4, asr #0x5
    mov r7, r6, lsr #0x16
    mov r6, r5, lsl #0xb
    add r5, r1, r7, lsl #0x1
    mov r4, r2
    add r6, r5, r6, lsl #0x1
    b .L_0220bcfc
.L_0220bcdc:
    mov r5, r4, asr #0x4
    add r5, r4, r5, lsr #0x1b
    and r7, r4, #0x1f
    mov r5, r5, asr #0x5
    add r5, r7, r5, lsl #0xa
    mov r5, r5, lsl #0x1
    strh r0, [r5, r6]
    add r4, r4, #0x1
.L_0220bcfc:
    cmp r4, r3
    blt .L_0220bcdc
    add lr, lr, #0x1
.L_0220bd08:
    cmp lr, ip
    blt .L_0220bcb4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov046_0220bc80, . - func_ov046_0220bc80
