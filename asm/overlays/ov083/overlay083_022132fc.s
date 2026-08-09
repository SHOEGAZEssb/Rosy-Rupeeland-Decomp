.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02213e48

.global func_ov083_022132fc
func_ov083_022132fc:
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
    beq .L_02213378
    ldr r1, .L_02213644
    mov r0, #0x0
    ldr r2, [r1, #0x58]
    ldr r1, [r1, #0x5c]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02213378:
    ldr r0, [r5, #0x298]
    cmp r0, #0x0
    beq .L_02213390
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    beq .L_0221339c
.L_02213390:
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    ble .L_0221353c
.L_0221339c:
    ldrsh r0, [r5, #0xda]
    cmp r0, #0x0
    beq .L_022133b4
    cmp r0, #0x1
    beq .L_022134d8
    b .L_0221363c
.L_022133b4:
    ldr r1, [r5, #0xd0]
    mov r0, r5
    orr r1, r1, #0x2
    str r1, [r5, #0xd0]
    ldr r2, [r5, #0x298]
    mov r1, r4
    str r2, [r5, #0x228]
    ldr r2, [r0, #0x0]
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
    ldr r1, [r5, #0x228]
    ldr r2, [r5, #0x20]
    ldr r0, [r1, #0x20]
    ldr r3, [r5, #0x1c]
    sub r0, r2, r0
    mov r2, r0, asr #0xc
    mul r0, r2, r2
    ldr r2, [r1, #0x1c]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r0, r2, r2, r0
    cmp r0, #0x24
    bge .L_022134c0
    mov r0, #0x1
    strh r0, [r5, #0xda]
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x2
    str r0, [r5, #0x260]
    ldr r0, [r5, #0x298]
    cmp r0, #0x0
    beq .L_0221363c
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x1d4]
    blx r2
    ldr r1, [r5, #0x298]
    ldr r0, [r1, #0x14]
    bic r0, r0, #0x10
    str r0, [r1, #0x14]
    b .L_0221363c
.L_022134c0:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r1, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    b .L_0221363c
.L_022134d8:
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x2
    str r0, [r5, #0x260]
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0221363c
    ldr r0, .L_02213644
    mov r2, #0x0
    ldr r4, [r0, #0x38]
    ldr r3, [r0, #0x3c]
    mov r1, #0x4
    str r4, [r5, #0x218]
    str r3, [r5, #0x21c]
    ldr r3, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    str r3, [r5, #0x220]
    str r0, [r5, #0x224]
    strh r2, [r5, #0xda]
    str r2, [r5, #0xc8]
    strb r1, [r5, #0xd4]
    str r2, [r5, #0x228]
    b .L_0221363c
.L_0221353c:
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
    bge .L_02213628
    ldr r0, .L_02213644
    ldr r2, [r0, #0x10]
    ldr r1, [r0, #0x14]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldr r1, [r0, #0x20]
    ldr r0, [r0, #0x24]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_0221363c
.L_02213628:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x22c
    ldr r2, [r2, #0xd0]
    blx r2
.L_0221363c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02213644: .word data_ov083_02213e48
.size func_ov083_022132fc, . - func_ov083_022132fc
