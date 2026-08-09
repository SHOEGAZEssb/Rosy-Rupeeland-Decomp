.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_020e7318
.extern data_ov083_02213e48
.extern func_0205940c
.extern gSoundContext

.global func_ov083_02213170
func_ov083_02213170:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r1, #0x1
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    strb r1, [r4, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x298]
    mov r1, #0x0
    cmp r0, #0x0
    beq .L_022131c0
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r1, #0x1
.L_022131c0:
    cmp r1, #0x0
    mov r2, #0x0
    bne .L_022131e8
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r2, #0x1
    b .L_02213204
.L_022131e8:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x5a]
    add r1, r1, #0x1
    strh r1, [r0, #0x5a]
    ldrsh r0, [r0, #0x5a]
    cmp r0, #0x1e
    movgt r2, #0x1
.L_02213204:
    cmp r2, #0x0
    beq .L_022132a0
    add r0, r4, #0x200
    mov r2, #0x0
    strh r2, [r0, #0x5a]
    ldr r1, .L_022132a8
    strh r2, [r0, #0x56]
    ldr r2, [r1, #0x8]
    ldr r0, [r1, #0xc]
    ldr r1, .L_022132ac
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r2, [r4, #0x260]
    ldr r0, .L_022132b0
    orr r2, r2, #0x4
    str r2, [r4, #0x260]
    ldrh r2, [r4, #0x4e]
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_0221326c
    ldr r0, .L_022132b4
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_0221326c:
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02213290
    ldr r1, [r0, #0x29c]
    tst r1, #0x1
    beq .L_02213290
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d8]
    blx r1
.L_02213290:
    mov r0, #0x0
    strh r0, [r4, #0xda]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_022132a0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_022132a8: .word data_ov083_02213e48
.L_022132ac: .word data_020e7318
.L_022132b0: .word 0xffff
.L_022132b4: .word gSoundContext
.size func_ov083_02213170, . - func_ov083_02213170
