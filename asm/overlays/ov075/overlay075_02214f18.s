.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_020050a4
.extern func_02033f44

.global func_ov075_02214f18
func_ov075_02214f18:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r4, r0
    str r1, [r4, #0x208]
    ldr r6, [r4, #0x21c]
    cmp r6, #0x0
    bne .L_02214f64
    ldr r1, [r4, #0x208]
    add r0, r4, #0x20c
    add r1, r1, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x208]
    bl func_02033f44
    str r0, [r4, #0x218]
    add r0, r4, #0x18
    add r1, r4, #0x20c
    bl func_020050a4
    mov r0, #0x1
    strh r0, [r4, #0xd6]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02214f64:
    ldr r0, [r4, #0x208]
    mvn ip, #0x0
    mov lr, ip
    sub r5, ip, #0x80000000
    ldr r3, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    mov r8, ip
    b .L_02214fac
.L_02214f84:
    ldrsh r0, [r6, #0x2]
    sub r1, r7, r3, asr #0xc
    add r6, r6, #0x4
    sub r10, r0, r2, asr #0xc
    mul r9, r10, r10
    mla r9, r1, r1, r9
    cmp r5, r9
    movgt r5, r9
    movgt ip, r7
    movgt lr, r0
.L_02214fac:
    ldrsh r7, [r6, #0x0]
    cmp r7, r8
    bne .L_02214f84
    mvn r0, #0x0
    cmp ip, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    mov r0, ip, lsl #0xc
    str r0, [r4, #0x210]
    mov r0, lr, lsl #0xc
    str r0, [r4, #0x214]
    ldr r0, [r4, #0x208]
    bl func_02033f44
    str r0, [r4, #0x218]
    add r0, r4, #0x18
    add r1, r4, #0x20c
    bl func_020050a4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_ov075_02214f18, . - func_ov075_02214f18
