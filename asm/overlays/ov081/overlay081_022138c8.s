.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_020c9670
.extern func_020050a4
.extern Actor_QueryTerrainHeight
.extern func_020bf1f8
.extern func_ov081_0221367c
.extern genrand_int32

.global func_ov081_022138c8
func_ov081_022138c8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    cmp r0, #0x0
    bne .L_0221396c
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl func_020050a4
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    bl genrand_int32
    mov r1, #0x60000
    bl func_020bf1f8
    mov r0, r5, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    add lr, r1, #0x18000
    mov r3, r0, lsl #0x1
    ldr r1, .L_022139d8
    ldr ip, [r4, #0x7c]
    ldrsh r3, [r1, r3]
    mov r2, r2, lsl #0x1
    ldrsh r1, [r1, r2]
    mla r2, lr, r3, ip
    str r2, [r4, #0x7c]
    ldr r2, [r4, #0x80]
    mov r0, r4
    mla r1, lr, r1, r2
    str r1, [r4, #0x80]
    mov r2, r1, asr #0x10
    ldr r1, [r4, #0x7c]
    mov r1, r1, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r0, r0, lsl #0x10
    str r0, [r4, #0x84]
    mov r0, #0x0
    str r0, [r4, #0x210]
.L_0221396c:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0x4b]
    cmp r0, #0x0
    mov r0, r4
    beq .L_022139a4
    bl func_ov081_0221367c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_022139a4:
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_022139d0
    mov r0, r4
    bl func_ov081_0221367c
.L_022139d0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_022139d8: .word data_020c9670
.size func_ov081_022138c8, . - func_ov081_022138c8
