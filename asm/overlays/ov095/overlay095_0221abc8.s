.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_02005058
.extern Actor_ApplyMotionImpulse
.extern func_ov095_0221a208

.global func_ov095_0221abc8
func_ov095_0221abc8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x260]
    mov r4, r2
    tst r0, #0x8000
    bne .L_0221ac18
    ldr r0, [r5, #0x314]
    mov r0, r0, lsl #0x2
    movs r0, r0, lsr #0x18
    movne r2, #0x1000
    moveq r2, #0x4000
    add r0, sp, #0x0
    bl func_ov095_0221a208
    add r1, sp, #0x0
    mov r0, r5
    mov r2, r4
    bl Actor_ApplyMotionImpulse
    add r0, sp, #0x0
    bl func_02005058
.L_0221ac18:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov095_0221abc8, . - func_ov095_0221abc8
