.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern data_ov086_02212e40
.extern func_020440cc

.global func_ov086_02212ae0
func_ov086_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020440cc
    ldr r1, .L_02212afc
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02212afc: .word data_ov086_02212e40
.size func_ov086_02212ae0, . - func_ov086_02212ae0
