.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02005058
.extern func_0203e494

.global func_ov084_02213890
func_ov084_02213890:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x298
    bl func_02005058
    mov r0, r4
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov084_02213890, . - func_ov084_02213890
