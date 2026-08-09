.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_0203e494

.global func_ov096_02217868
func_ov096_02217868:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov096_02217868, . - func_ov096_02217868
