.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern func_020b1bfc
.extern func_020b1c64

.global func_ov058_0220f228
func_ov058_0220f228:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r8, r1
    add r0, r9, r8, lsl #0x2
    ldr r2, [r0, #0x58]
    cmp r2, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r0, #0x6c]
    mov r0, #0xc
    mul r4, r2, r0
    cmp r1, #0x34
    bgt .L_0220f290
    add r5, r9, #0x20
    ldr r0, [r5, r4]
    mov r1, r1, lsl #0x6
    ldr r0, [r0, #0x24]
    mov r2, #0x300
    bl func_020b1c64
    add r0, r9, r8, lsl #0x2
    ldr r1, [r0, #0x6c]
    ldr r2, [r5, r4]
    mov r1, r1, lsl #0x6
    ldr r0, [r2, #0x24]
    mov r2, #0x300
    bl func_020b1bfc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0220f290:
    add r5, r9, #0x20
    ldr r0, [r5, r4]
    rsb r6, r1, #0x40
    mov r7, r6, lsl #0x6
    ldr r0, [r0, #0x24]
    mov r2, r7
    mov r1, r1, lsl #0x6
    bl func_020b1c64
    add r0, r9, r8, lsl #0x2
    ldr r1, [r0, #0x6c]
    ldr r2, [r5, r4]
    mov r1, r1, lsl #0x6
    ldr r0, [r2, #0x24]
    mov r2, r7
    bl func_020b1bfc
    ldr r0, [r5, r4]
    rsb r1, r6, #0xc
    mov r7, r1, lsl #0x6
    ldr r0, [r0, #0x24]
    mov r2, r7
    add r0, r0, r6, lsl #0x6
    mov r1, #0x0
    bl func_020b1c64
    ldr r0, [r5, r4]
    mov r2, r7
    ldr r0, [r0, #0x24]
    mov r1, #0x0
    add r0, r0, r6, lsl #0x6
    bl func_020b1bfc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov058_0220f228, . - func_ov058_0220f228
