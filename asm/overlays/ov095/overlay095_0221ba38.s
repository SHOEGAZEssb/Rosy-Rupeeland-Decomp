.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cec0
.extern data_ov095_0221ced0
.extern func_020050a4
.extern Actor_GetCachedTerrainHeight
.extern Actor_QueryTerrainHeight
.extern func_0203e7c8
.extern func_ov095_0221b6d8

.global func_ov095_0221ba38
func_ov095_0221ba38:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov095_0221b6d8
    cmp r0, #0x0
    bne .L_0221baac
    ldr r0, .L_0221bbc4
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_0221bbc8
    bne .L_0221ba98
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0221ba98:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221bb7c
.L_0221baac:
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    addne r0, r4, #0x200
    ldrneh r0, [r0, #0x98]
    cmpne r0, #0x0
    beq .L_0221bb7c
    ldrsh r0, [r4, #0xac]
    cmp r0, #0xff
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221bb7c
    add r0, r4, #0xb0
    add r1, r4, #0x22c
    bl func_020050a4
    ldr r0, [r4, #0x228]
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x1c]
    sub r1, r1, r0
    cmp r1, #0x10000
    ldrgt r0, [r4, #0xb4]
    subgt r0, r0, #0x10000
    strgt r0, [r4, #0xb4]
    bgt .L_0221bb24
    mov r0, #0x10000
    rsb r0, r0, #0x0
    cmp r1, r0
    ldrlt r0, [r4, #0xb4]
    addlt r0, r0, #0x10000
    strlt r0, [r4, #0xb4]
.L_0221bb24:
    ldr r1, [r4, #0x228]
    ldr r0, [r4, #0x234]
    ldr r1, [r1, #0x20]
    cmp r1, r0
    movgt r2, #0x50000
    movle r2, #0x30000
    ldr r1, [r4, #0xb8]
    rsble r2, r2, #0x0
    add r2, r1, r2
    str r2, [r4, #0xb8]
    ldr r1, [r4, #0xb4]
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r1, r0, lsl #0x10
    str r1, [r4, #0xbc]
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x3c]
    blx r2
.L_0221bb7c:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_0221bbac
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    ldreq r0, [r4, #0xd0]
    orreq r0, r0, #0x80000
    streq r0, [r4, #0xd0]
    beq .L_0221bbb8
.L_0221bbac:
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x80000
    str r0, [r4, #0xd0]
.L_0221bbb8:
    mov r0, r4
    bl func_0203e7c8
    ldmia sp!, {r4, pc}
.L_0221bbc4: .word data_ov095_0221cec0
.L_0221bbc8: .word data_ov095_0221ced0
.size func_ov095_0221ba38, . - func_ov095_0221ba38
