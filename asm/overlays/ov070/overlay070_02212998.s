.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern Heap_Free

.global func_ov070_02212998
func_ov070_02212998:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov070_02212998, . - func_ov070_02212998
