.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_020050a4
.extern func_02044088
.extern func_ov083_02213bd4
.extern genrand_int32

.global func_ov083_02213be8
func_ov083_02213be8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02044088
    bl genrand_int32
    tst r0, #0x1
    mov r1, #0x4000
    rsbeq r1, r1, #0x0
    add r0, r4, #0x2a0
    bl func_ov083_02213bd4
    ldr r1, [r4, #0x298]
    cmp r1, #0x0
    beq .L_02213c24
    add r0, r4, #0x18
    add r1, r1, #0x18
    bl func_020050a4
.L_02213c24:
    ldr r0, [r4, #0x14]
    orr r1, r0, #0x10
    bic r0, r1, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov083_02213be8, . - func_ov083_02213be8
