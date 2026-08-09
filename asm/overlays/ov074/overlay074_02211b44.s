.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern Heap_Free

.global func_ov074_02211b44
func_ov074_02211b44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov074_02211b44, . - func_ov074_02211b44
