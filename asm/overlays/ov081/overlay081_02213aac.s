.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern gFx32CosSinTable
.extern VecFx32Object_Assign
.extern func_ov081_0221367c
.extern genrand_int32

.global func_ov081_02213aac
func_ov081_02213aac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    cmp r0, #0x0
    bne .L_02213b24
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl VecFx32Object_Assign
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r1, .L_02213b78
    mov r2, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldr r3, [r4, #0x7c]
    ldrsh r1, [r1, r0]
    add r0, r3, r2, lsl #0x13
    str r0, [r4, #0x7c]
    ldr r2, [r4, #0x80]
    mov r0, #0x0
    add r1, r2, r1, lsl #0x13
    str r1, [r4, #0x80]
    str r0, [r4, #0x210]
.L_02213b24:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_02213b70
    mov r0, r4
    bl func_ov081_0221367c
.L_02213b70:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02213b78: .word gFx32CosSinTable
.size func_ov081_02213aac, . - func_ov081_02213aac
