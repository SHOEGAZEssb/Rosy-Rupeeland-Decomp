.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_02105310
.extern func_02005070
.extern func_0200b04c
.extern Actor_SetRuntimeFlag80
.extern func_02032228
.extern func_02032370
.extern Actor_UpdateAnimationState
.extern func_02034164
.extern ActorDerivedRuntime_UpdateFrame
.extern func_ov081_0221367c

.global func_ov081_02212de0
func_ov081_02212de0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x114]
    cmp r1, #0x0
    beq .L_02212dfc
    bl ActorDerivedRuntime_UpdateFrame
    ldmia sp!, {r4, pc}
.L_02212dfc:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r0, r4
    bl Actor_SetRuntimeFlag80
    mov r0, r4
    bl func_02034164
    ldr r0, .L_02212fdc
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02212e40
    ldr r0, [r4, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02212e8c
.L_02212e40:
    ldrsh r0, [r4, #0xd6]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x2
    bhi .L_02212e78
    mov r1, #0x1
    mov r0, r4
    strh r1, [r4, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_02212e78:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
.L_02212e8c:
    add r0, r4, #0x200
    ldrh r3, [r0, #0x3c]
    mov r2, #0x1
    mov r1, #0x0
    and r3, r3, #0x2
    strh r3, [r0, #0x3c]
    strh r2, [r4, #0xd6]
    str r1, [r4, #0x40]
    mov r0, r4
    str r1, [r4, #0x3c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    bne .L_02212fb0
    ldr r1, [r4, #0x234]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_02212ef4
    ldr r0, [r4, #0x230]
    cmp r0, r1
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x230]
    blt .L_02212ef4
    mov r0, r4
    bl func_ov081_0221367c
.L_02212ef4:
    ldr r0, [r4, #0x20c]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r4, #0x208]
    ldrne r1, [r2, r1]
    ldreq r1, [r4, #0x208]
    blx r1
    ldrsh r0, [r4, #0xd6]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_02212f50
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x124]
    blx r1
    cmp r0, #0x0
    movne r0, #0x5
    strneh r0, [r4, #0xd6]
.L_02212f50:
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    beq .L_02212f70
    mov r0, r4
    add r1, r1, #0x18
    mov r2, #0x800
    bl func_02032370
    b .L_02212fb0
.L_02212f70:
    add r0, r4, #0x98
    bl func_02005070
    ldr r1, .L_02212fe0
    cmp r0, r1
    ble .L_02212f9c
    ldr r1, [r4, #0x9c]
    ldr r2, [r4, #0xa0]
    mov r0, r4
    mov r3, #0x400
    bl func_02032228
    b .L_02212fb0
.L_02212f9c:
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    mov r0, r4
    mov r3, #0x800
    bl func_02032228
.L_02212fb0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
.L_02212fdc: .word data_02105310
.L_02212fe0: .word 0x19a
.size func_ov081_02212de0, . - func_ov081_02212de0
