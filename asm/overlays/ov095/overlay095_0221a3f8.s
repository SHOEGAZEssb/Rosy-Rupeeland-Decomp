.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov095_0221a418
.extern func_ov095_0221a878

.global func_ov095_0221a3f8
func_ov095_0221a3f8:
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0x319]
    cmp r2, #0x0
    bne .L_0221a410
    bl func_ov095_0221a418
    ldmia sp!, {r3, pc}
.L_0221a410:
    bl func_ov095_0221a878
    ldmia sp!, {r3, pc}
.size func_ov095_0221a3f8, . - func_ov095_0221a3f8
