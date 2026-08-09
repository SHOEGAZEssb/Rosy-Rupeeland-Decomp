.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_ov074_02211d34
.extern func_ov074_02211a68

.global func_ov074_0220fd44
func_ov074_0220fd44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov074_02211a68
    ldr r1, .L_0220fd60
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0220fd60: .word data_ov074_02211d34
.size func_ov074_0220fd44, . - func_ov074_0220fd44
