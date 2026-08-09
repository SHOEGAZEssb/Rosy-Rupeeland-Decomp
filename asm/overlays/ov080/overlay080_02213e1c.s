.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_02033f4c
.extern func_020befec

.global func_ov080_02213e1c
func_ov080_02213e1c:
    stmdb sp!, {r3, lr}
    bl func_02033f4c
    mov r1, #0x3
    bl func_020befec
    ldmia sp!, {r3, pc}
.size func_ov080_02213e1c, . - func_ov080_02213e1c
