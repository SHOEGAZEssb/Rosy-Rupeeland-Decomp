.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_ov096_02218590
.extern func_ov096_0221880c
.extern func_ov096_0221881c

.global func_ov096_0221883c
func_ov096_0221883c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x20
    str r1, [r4, #0x260]
    bl func_ov096_02218590
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x0
    bne .L_022188d0
    mov r0, r4
    bl func_ov096_0221881c
    cmp r0, #0x0
    beq .L_022188d0
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x98]
    ldrsh r1, [r0, #0x9a]
    cmp r2, r1
    bge .L_022188d0
    mov r1, #0x0
    add ip, r2, #0x1
    strh ip, [r0, #0x98]
    mov ip, #0x1
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x29c
    strh ip, [r4, #0xd6]
    bl func_ov096_0221880c
    mov r0, #0x0
    str r0, [r4, #0x44]
    ldr r1, [r4, #0x260]
    mov r0, #0x1
    orr r1, r1, #0x20
    str r1, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_022188d0:
    ldr r2, [r4, #0x2a0]
    ldr r1, .L_02218954
    mov r0, #0x0
    umull ip, r3, r2, r1
    mla r3, r2, r0, r3
    mov r2, r2, asr #0x1f
    adds ip, ip, #0x800
    mla r3, r2, r1, r3
    adc r2, r3, r0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x2a0]
    ldr r2, [r4, #0x2a4]
    umull ip, r3, r2, r1
    adds ip, ip, #0x800
    mla r3, r2, r0, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r1, r3
    adc r2, r3, r0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x2a4]
    ldr r2, [r4, #0x2a8]
    umull ip, r3, r2, r1
    adds ip, ip, #0x800
    mla r3, r2, r0, r3
    mov r2, r2, asr #0x1f
    mla r3, r2, r1, r3
    adc r1, r3, r0
    mov r2, ip, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r4, #0x2a8]
    ldmia sp!, {r4, pc}
.L_02218954: .word 0xfae
.size func_ov096_0221883c, . - func_ov096_0221883c
