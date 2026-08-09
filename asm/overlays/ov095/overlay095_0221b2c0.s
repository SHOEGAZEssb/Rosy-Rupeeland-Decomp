.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Free
.extern func_02005058
.extern func_0203e494

.global func_ov095_0221b2c0
func_ov095_0221b2c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x29c
    bl func_02005058
    mov r0, r4
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov095_0221b2c0, . - func_ov095_0221b2c0
