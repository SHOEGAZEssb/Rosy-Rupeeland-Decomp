.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_0203e494

.global func_ov080_02212bbc
func_ov080_02212bbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov080_02212bbc, . - func_ov080_02212bbc
