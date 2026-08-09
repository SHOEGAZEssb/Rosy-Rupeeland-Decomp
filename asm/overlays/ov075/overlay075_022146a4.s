.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02005058
.extern func_0203b61c

.global func_ov075_022146a4
func_ov075_022146a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x20c
    bl func_02005058
    mov r0, r4
    bl func_0203b61c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov075_022146a4, . - func_ov075_022146a4
