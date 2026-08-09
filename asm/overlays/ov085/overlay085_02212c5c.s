.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214390
.extern func_ov085_022131b4
.extern func_ov085_02213bd0

.global func_ov085_02212c5c
func_ov085_02212c5c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02212c88
    mov r4, r0
    ldmia r1, {r1, r2}
    mov r3, #0x78
    bl func_ov085_02213bd0
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x210]
    bl func_ov085_022131b4
    ldmia sp!, {r4, pc}
.L_02212c88: .word data_ov085_02214390
.size func_ov085_02212c5c, . - func_ov085_02212c5c
