.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08

.global func_ov079_02213530
func_ov079_02213530:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    orr r1, r2, #0x3
    str r1, [r5, #0x260]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_0221359c
    ldr r1, .L_02213658
    mov r0, #0x0
    ldr r2, [r1, #0xa0]
    ldr r1, [r1, #0xa4]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221359c:
    ldr r1, [r5, #0x24]
    ldr r0, [r5, #0x1dc]
    cmp r1, r0
    bne .L_0221361c
    ldr r2, [r5, #0x20]
    ldr r1, [r5, #0x234]
    ldrsh r0, [r4, #0x8]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r3, [r5, #0x1c]
    ldr r2, [r5, #0x230]
    smulbb r0, r0, r0
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, r0
    ble .L_0221361c
    ldr r1, .L_02213658
    mov r0, r5
    ldr r3, [r1, #0x98]
    ldr r2, [r1, #0x9c]
    add r1, r5, #0x22c
    str r3, [r5, #0x220]
    str r2, [r5, #0x224]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, #0xb4
    str r0, [r5, #0x2a4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0221361c:
    ldr r0, [r5, #0x2a4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x2a4]
    ldr r0, [r5, #0x29c]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x298]
    ldrne r2, [r2, r1]
    mov r1, r4
    ldreq r2, [r5, #0x298]
    blx r2
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02213658: .word data_ov079_02213b08
.size func_ov079_02213530, . - func_ov079_02213530
