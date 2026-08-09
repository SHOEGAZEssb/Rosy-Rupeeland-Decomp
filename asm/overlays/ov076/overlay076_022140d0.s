.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_0203e494

.global func_ov076_022140d0
func_ov076_022140d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov076_022140d0, . - func_ov076_022140d0
