.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cec0
.extern func_ov095_0221bf8c

.global func_ov095_0221bbf0
func_ov095_0221bbf0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov095_0221bf8c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x134]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r5, #0x260]
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_0221bc70
    ldr r0, .L_0221bd64
    ldr r1, [r0, #0x38]
    ldr r0, [r0, #0x3c]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_0221bd5c
.L_0221bc70:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x11c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x124]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x12c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x130]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x234]
    ldr r2, [r5, #0x1c]
    sub r0, r1, r0
    mov r1, r0, asr #0xc
    mul r0, r1, r1
    ldr r1, [r5, #0x230]
    sub r1, r2, r1
    mov r1, r1, asr #0xc
    mla r0, r1, r1, r0
    cmp r0, #0x24
    bge .L_0221bd48
    ldr r0, .L_0221bd64
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x24]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_0221bd5c
.L_0221bd48:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x22c
    ldr r2, [r2, #0xd0]
    blx r2
.L_0221bd5c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0221bd64: .word data_ov095_0221cec0
.size func_ov095_0221bbf0, . - func_ov095_0221bbf0
