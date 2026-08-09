.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_02044098

.global func_ov076_02214088
func_ov076_02214088:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02044098
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov076_02214088, . - func_ov076_02214088
