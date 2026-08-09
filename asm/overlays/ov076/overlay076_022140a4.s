.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_ov076_02214b2c
.extern func_0203db80

.global func_ov076_022140a4
func_ov076_022140a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203db80
    ldr r0, .L_022140cc
    mov r1, #0x0
    str r0, [r4, #0x0]
    str r1, [r4, #0x298]
    mov r0, r4
    str r1, [r4, #0x29c]
    ldmia sp!, {r4, pc}
.L_022140cc: .word data_ov076_02214b2c
.size func_ov076_022140a4, . - func_ov076_022140a4
