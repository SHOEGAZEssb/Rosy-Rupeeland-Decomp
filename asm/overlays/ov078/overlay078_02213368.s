.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern func_0204305c
.extern func_020be334
.extern func_ov078_022134d0

.global func_ov078_02213368
func_ov078_02213368:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    ldr r1, [r6, #0xd0]
    mov r7, r0
    tst r1, #0x100
    mov r5, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r5, #0x1e]
    mov r2, r6
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    bl func_0204305c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x1a]
    tst r0, #0x100
    bne .L_022133d0
    ldr r1, [r7, #0x24]
    ldr r0, [r6, #0x24]
    sub r0, r1, r0
    bl func_020be334
    cmp r0, #0x28000
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
.L_022133d0:
    ldr r0, [r7, #0x278]
    mov r4, #0x0
    cmp r0, #0x0
    beq .L_022133f8
    ldr r1, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    bl func_ov078_022134d0
    cmp r0, #0x0
    movne r4, #0x1
    b .L_02213430
.L_022133f8:
    ldr r1, [r7, #0x20]
    ldr r0, [r6, #0x20]
    ldr r3, [r7, #0x1c]
    sub r0, r1, r0
    mov r0, r0, asr #0xc
    mul r1, r0, r0
    ldr r2, [r6, #0x1c]
    ldrsh ip, [r5, #0xa]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    smulbb r0, ip, ip
    cmp r1, r0
    movlt r4, #0x1
.L_02213430:
    cmp r4, #0x0
    add r0, r7, #0x200
    beq .L_022134b8
    ldrh r3, [r0, #0x5e]
    ldrsh r2, [r5, #0x16]
    ldr r1, .L_022134c8
    add r2, r3, r2
    strh r2, [r0, #0x5e]
    ldrh r0, [r0, #0x5e]
    cmp r0, r1
    blo .L_022134ac
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0xd4]
    blx r2
    ldr r1, .L_022134cc
    mov r0, r7
    ldr r2, [r1, #0x38]
    ldr r1, [r1, #0x3c]
    str r2, [r7, #0x220]
    str r1, [r7, #0x224]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    add r0, r7, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x98]
    strh r1, [r0, #0x9c]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022134ac:
    mov r0, #0x6
    strb r0, [r7, #0x24c]
    b .L_022134c0
.L_022134b8:
    mov r1, #0x0
    strh r1, [r0, #0x5e]
.L_022134c0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022134c8: .word 0x1770
.L_022134cc: .word data_ov078_02215c88
.size func_ov078_02213368, . - func_ov078_02213368
