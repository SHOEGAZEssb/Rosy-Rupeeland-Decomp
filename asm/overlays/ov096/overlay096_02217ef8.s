.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedType2_DispatchTransitionCallback
.extern func_020536b8

.global func_ov096_02217ef8
func_ov096_02217ef8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    tst r2, #0x100
    bne .L_02217f3c
    bl func_020536b8
    cmp r0, #0x0
    beq .L_02217f3c
    ldr r0, [r0, #0x1f8]
    ldrsh r1, [r4, #0x2e]
    ldrsb r0, [r0, #0x9]
    mov r1, r1, lsl #0x18
    cmp r0, r1, asr #0x1c
    ldrge r0, [r5, #0x260]
    orrge r0, r0, #0x100
    strge r0, [r5, #0x260]
.L_02217f3c:
    mov r0, r5
    mov r1, r4
    bl ActorExtendedType2_DispatchTransitionCallback
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov096_02217ef8, . - func_ov096_02217ef8
