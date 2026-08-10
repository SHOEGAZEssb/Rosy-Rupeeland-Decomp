.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Actor_SnapshotTransientState

.global func_ov095_0221b2e8
func_ov095_0221b2e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_SnapshotTransientState
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x4
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.size func_ov095_0221b2e8, . - func_ov095_0221b2e8
