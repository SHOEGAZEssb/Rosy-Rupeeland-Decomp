.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_0203b61c

.global func_ov088_0221b528
func_ov088_0221b528:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203b61c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov088_0221b528, . - func_ov088_0221b528
