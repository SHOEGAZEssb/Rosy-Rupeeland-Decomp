.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290

.global func_ov075_0221558c
func_ov075_0221558c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r5, r0
    ldr r2, [r2, #0x38]
    mov r4, r1
    blx r2
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
    beq .L_02215608
    ldr r1, .L_022157c4
    mov r0, #0x0
    ldr r2, [r1, #0x18]
    ldr r1, [r1, #0x1c]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02215608:
    ldr r1, [r5, #0x298]
    cmp r1, #0x0
    beq .L_022156bc
    ldr r0, [r1, #0x29c]
    tst r0, #0x1
    bne .L_022156bc
    ldr r0, [r1, #0xd0]
    tst r0, #0x100
    bne .L_022156bc
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x2
    str r0, [r5, #0xd0]
    ldr r1, [r5, #0x298]
    str r1, [r5, #0x228]
    ldr r2, [r5, #0x20]
    ldr r0, [r1, #0x20]
    ldr r4, [r5, #0x1c]
    sub r0, r2, r0
    mov r2, r0, asr #0xc
    mul r0, r2, r2
    ldr r3, [r1, #0x1c]
    sub r2, r4, r3
    mov r2, r2, asr #0xc
    mla r0, r2, r2, r0
    cmp r0, #0x24
    bge .L_022156a4
    ldr r0, [r5, #0x260]
    mov r1, r5
    bic r0, r0, #0x2
    str r0, [r5, #0x260]
    ldr r0, [r5, #0x298]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1d4]
    blx r2
    ldr r1, [r5, #0x298]
    ldr r0, [r1, #0x14]
    bic r0, r0, #0x10
    str r0, [r1, #0x14]
    b .L_022157bc
.L_022156a4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r1, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    b .L_022157bc
.L_022156bc:
    ldr r0, [r5, #0xd0]
    mov r1, #0x0
    bic r0, r0, #0x2
    str r0, [r5, #0xd0]
    str r1, [r5, #0x228]
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
    bge .L_022157a8
    ldr r0, .L_022157c4
    ldr r2, [r0, #0x50]
    ldr r1, [r0, #0x54]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldr r1, [r0, #0x10]
    ldr r0, [r0, #0x14]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_022157bc
.L_022157a8:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x22c
    ldr r2, [r2, #0xd0]
    blx r2
.L_022157bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_022157c4: .word data_ov075_02217290
.size func_ov075_0221558c, . - func_ov075_0221558c
