.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern OS_Halt
.extern data_ov085_02214434
.extern data_ov085_0221447c

.global func_ov085_02213b3c
func_ov085_02213b3c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r1, r5
    mov r4, #0x1
    ldr lr, .L_02213bc8
    b .L_02213bb8
.L_02213b54:
    ldr ip, [lr, r5, lsl #0x3]
    ldr r2, [r0, #0x208]
    mov r6, r4
    cmp ip, r2
    add r2, lr, r5, lsl #0x3
    bne .L_02213b80
    ldr r3, [r2, #0x4]
    ldr r2, [r0, #0x20c]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r6, r1
.L_02213b80:
    cmp r6, #0x0
    bne .L_02213bb4
    ldr r1, .L_02213bcc
    add r3, r1, r5, lsl #0x3
    ldr r1, [r3, #0x4]
    add r0, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r3, #0x0]
    ldrne r1, [r2, r1]
    ldreq r1, [r3, #0x0]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.L_02213bb4:
    add r5, r5, #0x1
.L_02213bb8:
    cmp r5, #0x9
    blt .L_02213b54
    bl OS_Halt
    ldmia sp!, {r4, r5, r6, pc}
.L_02213bc8: .word data_ov085_02214434
.L_02213bcc: .word data_ov085_0221447c
.size func_ov085_02213b3c, . - func_ov085_02213b3c
