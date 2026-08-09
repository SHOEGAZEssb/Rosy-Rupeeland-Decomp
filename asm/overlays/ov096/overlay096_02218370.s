.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern Heap_Free
.extern func_020441ac

.global func_ov096_02218370
func_ov096_02218370:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020441ac
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov096_02218370, . - func_ov096_02218370
