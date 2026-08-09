.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022152e8
.extern func_ov081_02213710

.global func_ov081_0221373c
func_ov081_0221373c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x4b]
    ldr ip, [r4, #0x1c]
    ldr r3, [r4, #0x218]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x21c]
    sub r3, ip, r3
    sub r1, r2, r1
    cmp r0, #0x0
    mov r2, r3, asr #0xc
    mov r1, r1, asr #0xc
    bne .L_02213784
    mul r0, r1, r1
    mla r1, r2, r2, r0
    ldr r0, [r4, #0x240]
    cmp r1, r0
    ble .L_022137bc
.L_02213784:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x214
    ldr r2, [r2, #0xc8]
    blx r2
    mov r0, #0x0
    str r0, [r4, #0x210]
    ldr r1, .L_022137c4
    mov r0, r4
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_022137bc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_022137c4: .word data_ov081_022152e8
.size func_ov081_0221373c, . - func_ov081_0221373c
