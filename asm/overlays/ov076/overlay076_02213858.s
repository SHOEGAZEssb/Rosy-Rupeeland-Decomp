.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_ov076_02214d08
.extern func_02005058
.extern func_02043e68
.extern func_02073ef8

.global func_ov076_02213858
func_ov076_02213858:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02213898
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x2a0]
    bl func_02073ef8
    ldr r0, [r4, #0x2a4]
    bl func_02073ef8
    add r0, r4, #0x2b8
    bl func_02005058
    add r0, r4, #0x2a8
    bl func_02005058
    mov r0, r4
    bl func_02043e68
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02213898: .word data_ov076_02214d08
.size func_ov076_02213858, . - func_ov076_02213858
