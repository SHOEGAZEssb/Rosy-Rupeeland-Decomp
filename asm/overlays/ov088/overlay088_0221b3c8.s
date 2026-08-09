.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Free
.extern func_ov088_02217e44

.global func_ov088_0221b3c8
func_ov088_0221b3c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov088_02217e44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov088_0221b3c8, . - func_ov088_0221b3c8
