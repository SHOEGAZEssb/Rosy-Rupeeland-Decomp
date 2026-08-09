.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_0204362c
.extern func_020593dc
.extern func_ov095_0221b6d8
.extern gSoundContext

.global func_ov095_0221bed0
func_ov095_0221bed0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_ov095_0221b6d8
    cmp r0, #0x0
    movne r4, #0x1
    mov r0, r5
    moveq r4, #0x0
    bl func_0204362c
    cmp r0, #0x0
    beq .L_0221bf0c
    cmp r0, #0x1
    beq .L_0221bf1c
    cmp r0, #0x2
    b .L_0221bf2c
.L_0221bf0c:
    cmp r4, #0x0
    ldrne r2, .L_0221bf70
    ldreq r2, .L_0221bf74
    b .L_0221bf38
.L_0221bf1c:
    cmp r4, #0x0
    ldrne r2, .L_0221bf78
    ldreq r2, .L_0221bf7c
    b .L_0221bf38
.L_0221bf2c:
    cmp r4, #0x0
    ldrne r2, .L_0221bf80
    ldreq r2, .L_0221bf84
.L_0221bf38:
    cmp r2, #0x0
    beq .L_0221bf68
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_0221bf88
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
.L_0221bf68:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0221bf70: .word 0xa302
.L_0221bf74: .word 0xa303
.L_0221bf78: .word 0xe183
.L_0221bf7c: .word 0xe182
.L_0221bf80: .word 0xf503
.L_0221bf84: .word 0xf502
.L_0221bf88: .word gSoundContext
.size func_ov095_0221bed0, . - func_ov095_0221bed0
