.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern TemporaryObject_NoOpDestructor

.global func_ov060_0220fd54
func_ov060_0220fd54:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TemporaryObject_NoOpDestructor
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov060_0220fd54, . - func_ov060_0220fd54
