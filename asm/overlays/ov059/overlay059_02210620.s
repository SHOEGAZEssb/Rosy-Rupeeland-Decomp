.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_0221026c

.global func_ov059_02210620
func_ov059_02210620:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov059_0221026c
    ldrsh r1, [r4, #0x2]
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    ldmia sp!, {r4, pc}
.size func_ov059_02210620, . - func_ov059_02210620
