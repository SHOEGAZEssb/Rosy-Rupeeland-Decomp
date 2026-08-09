.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Heap_Free
.extern func_02004b54

.global func_ov060_0220fd68
func_ov060_0220fd68:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02004b54
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov060_0220fd68, . - func_ov060_0220fd68
