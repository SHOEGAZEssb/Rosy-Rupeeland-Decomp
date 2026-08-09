.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_0204330c

.global func_ov080_02212f78
func_ov080_02212f78:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204330c
    mov r0, #0x0
    strh r0, [r4, #0xda]
    ldmia sp!, {r4, pc}
.size func_ov080_02212f78, . - func_ov080_02212f78
