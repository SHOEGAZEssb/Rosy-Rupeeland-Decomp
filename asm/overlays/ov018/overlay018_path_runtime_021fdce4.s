    .text
/* Exact fallback; see src/overlays/ov018/overlay018_path_runtime.c. */
    .extern func_02092260
    .extern func_020922b0
    .extern func_020ae024
    .extern func_ov003_021fb8ac
    .extern func_ov018_021fdb7c
    .extern func_ov018_021fdbac
    .extern func_ov018_021fdbd4
    .extern func_ov018_021fdbfc
    .extern func_ov018_021fdc64
    .extern func_ov018_021fe184
    .extern func_ov018_021fe214
    .extern func_ov018_021ff3cc
    .extern func_ov018_021ff408
    .extern func_ov018_021ff420
    .extern func_ov018_021ff434
    .extern func_ov018_021ff770
    .extern func_ov018_021ff964
    .extern func_ov018_021ff984
    .extern func_ov018_021ffbb0

.global func_ov018_021fdce4
func_ov018_021fdce4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, [r4, #0x20]
    mov r1, r1, lsl #0x1b
    movs r1, r1, asr #0x1f
    beq L_021fdd10
    mov r1, #0x0
    str r1, [r4, #0x414]
    bl func_ov018_021fdbac
    b L_021fdd1c
L_021fdd10:
    mov r1, #0x1
    str r1, [r4, #0x408]
    bl func_ov018_021fdbd4
L_021fdd1c:
    ldr r0, [r4, #0x20]
    mov r1, r0, lsl #0x1a
    movs r1, r1, asr #0x1f
    beq L_021fddb0
    mov r0, r4
    bl func_ov018_021fdc64
    cmp r0, #0x0
    ldrne r0, [r4, #0x408]
    cmpne r0, #0x0
    beq L_021fdeb0
    mov r3, #0x1
    str r3, [r4, #0x404]
    ldr r1, [r4, #0x34]
    ldr r2, [r4, #0x38]
    mov r0, #0x2
    str r2, [sp, #0x0]
    stmib sp, {r0, r3}
    ldr r0, [r4, #0x190]
    mov r3, r1
    bl func_ov003_021fb8ac
    add r0, r4, #0x64
    add r1, r4, #0x30
    bl func_ov018_021fe184
    mov r0, r4
    bl func_ov018_021fdbfc
    mov r0, r4
    mov r1, #0x4b
    bl func_02092260
    ldr r2, [r4, #0x34]
    ldr r1, [r4, #0x5c]
    ldr r3, [r4, #0x38]
    add r1, r2, r1
    ldr r2, [r4, #0x60]
    ldr r0, [r4, #0x58]
    add r2, r3, r2
    bl func_ov018_021ff434
    b L_021fdeb0
L_021fddb0:
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021fde98
    bl func_ov018_021fdc64
    cmp r0, #0x0
    ldrne r0, [r4, #0x408]
    cmpne r0, #0x0
    beq L_021fde54
    ldr r0, [r4, #0x404]
    cmp r0, #0x0
    bne L_021fddf4
    mov r2, #0x1
    add r0, r4, #0x64
    add r1, r4, #0x30
    str r2, [r4, #0x404]
    bl func_ov018_021fe184
L_021fddf4:
    ldr r1, [r4, #0x38]
    mov r0, #0x2
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x190]
    ldr r1, [r4, #0x68]
    ldr r2, [r4, #0x6c]
    ldr r3, [r4, #0x34]
    bl func_ov003_021fb8ac
    add r0, r4, #0x64
    add r1, r4, #0x30
    bl func_ov018_021fe184
    mov r0, r4
    bl func_ov018_021fdbfc
    mov r0, r4
    mov r1, #0x1
    bl func_ov018_021fdb7c
    mov r0, r4
    mov r1, #0x4c
    mov r2, #0x7f
    bl func_020922b0
    b L_021fdeb0
L_021fde54:
    mov r0, r4
    mov r1, #0x0
    bl func_ov018_021fdb7c
    mov r0, r4
    mov r1, #0x4c
    mov r2, #0x0
    bl func_020922b0
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff420
    cmp r0, #0x0
    bne L_021fdeb0
    mov r0, #0x0
    str r0, [r4, #0x404]
    ldr r0, [r4, #0x58]
    mov r1, #0x3
    bl func_ov018_021ffbb0
    b L_021fdeb0
L_021fde98:
    mov r1, #0x0
    bl func_ov018_021fdb7c
    mov r0, r4
    mov r1, #0x4c
    mov r2, #0x0
    bl func_020922b0
L_021fdeb0:
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff408
    cmp r0, #0x0
    bne L_021fe10c
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021fe10c
    mov r0, r4
    bl func_ov018_021fdc64
    cmp r0, #0x0
    ldrne r0, [r4, #0x404]
    cmpne r0, #0x0
    ldrne r0, [r4, #0x408]
    cmpne r0, #0x0
    beq L_021fe10c
    ldr r5, [r4, #0x34]
    ldr r1, [r4, #0x5c]
    ldr r3, [r4, #0x38]
    ldr r2, [r4, #0x60]
    ldr r0, [r4, #0x58]
    add r1, r5, r1
    add r2, r3, r2
    bl func_ov018_021ff434
    ldr r0, [r4, #0x58]
    ldr r6, [r0, #0x10]
    cmp r6, #0x3
    blt L_021fdfd4
    ldr r5, [r0, #0x4]
    sub r7, r6, #0x2
    sub r0, r6, #0x3
    mov r3, r7, lsl #0x2
    mov r2, r0, lsl #0x2
    ldrsh r8, [r5, r3]
    add r1, r5, r7, lsl #0x2
    ldrsh r3, [r5, r2]
    add r0, r5, r0, lsl #0x2
    ldrsh r2, [r1, #0x2]
    ldrsh r1, [r0, #0x2]
    sub r0, r8, r3
    sub r1, r2, r1
    bl func_020ae024
    sub r1, r6, #0x1
    mov r6, r1, lsl #0x2
    add r2, r5, r1, lsl #0x2
    mov r3, r7, lsl #0x2
    add r1, r5, r7, lsl #0x2
    ldrsh r6, [r5, r6]
    ldrsh r3, [r5, r3]
    ldrsh r2, [r2, #0x2]
    ldrsh r1, [r1, #0x2]
    sub r5, r6, r3
    mov r7, r0
    sub r6, r2, r1
    mov r0, r5
    mov r1, r6
    bl func_020ae024
    sub r0, r7, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x8000
    rsbhi r0, r0, #0x10000
    movhi r0, r0, lsl #0x10
    movhi r0, r0, lsr #0x10
    cmp r0, #0x6000
    bls L_021fdfd4
    mul r0, r6, r6
    mla r0, r5, r5, r0
    cmp r0, #0x10
    ble L_021fdfd4
    mov r0, r4
    mov r1, #0x4d
    bl func_02092260
L_021fdfd4:
    ldr r0, [r4, #0x58]
    ldr r1, [r0, #0x24]
    cmp r1, #0x0
    bne L_021fe17c
    bl func_ov018_021ff770
    cmp r0, #0x0
    beq L_021fe17c
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff984
    cmp r0, #0x100
    ble L_021fe100
    cmp r0, #0x8000
    bge L_021fe100
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff964
    mov r0, r4
    mov r6, #0x3
    bl func_ov018_021fe214
    cmp r0, #0x0
    beq L_021fe040
    mov r0, r4
    mov r1, #0x1e
    bl func_02092260
    mov r0, #0x1
    str r0, [r4, #0x3c8]
    mov r6, #0x4
    b L_021fe068
L_021fe040:
    ldr r0, [r4, #0x420]
    cmp r0, #0x2
    mov r0, r4
    bne L_021fe060
    mov r1, #0x1e
    bl func_02092260
    mov r6, #0x5
    b L_021fe068
L_021fe060:
    mov r1, #0x77
    bl func_02092260
L_021fe068:
    ldr r0, [r4, #0x58]
    mov r8, #0x1
    ldr r7, [r0, #0x4]
    ldr r1, [r4, #0x5c]
    ldrsh r3, [r7, #0x0]
    ldrsh r2, [r7, #0x2]
    ldr r0, [r4, #0x60]
    sub r1, r3, r1
    sub r2, r2, r0
    mov r5, r8
    b L_021fe0d8
L_021fe094:
    add r0, r7, r8, lsl #0x2
    mov r9, r8, lsl #0x2
    ldrsh r3, [r0, #0x2]
    ldr r0, [r4, #0x60]
    ldrsh lr, [r7, r9]
    ldr ip, [r4, #0x5c]
    sub r9, r3, r0
    str r9, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    sub r10, lr, ip
    ldr r0, [r4, #0x190]
    mov r3, r10
    bl func_ov003_021fb8ac
    mov r1, r10
    mov r2, r9
    add r8, r8, #0x1
L_021fe0d8:
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x10]
    cmp r8, r0
    blt L_021fe094
    mov r0, #0x0
    str r0, [r4, #0x404]
    ldr r0, [r4, #0x58]
    mov r1, #0x2
    bl func_ov018_021ffbb0
    b L_021fe17c
L_021fe100:
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff3cc
    b L_021fe17c
L_021fe10c:
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff408
    cmp r0, #0x0
    bne L_021fe13c
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    bne L_021fe17c
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff420
    cmp r0, #0x0
    bne L_021fe17c
L_021fe13c:
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff408
    cmp r0, #0x0
    beq L_021fe168
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fe168
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff3cc
    b L_021fe17c
L_021fe168:
    mov r0, #0x0
    str r0, [r4, #0x404]
    ldr r0, [r4, #0x58]
    mov r1, #0x3
    bl func_ov018_021ffbb0
L_021fe17c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
    .size func_ov018_021fdce4, . - func_ov018_021fdce4
