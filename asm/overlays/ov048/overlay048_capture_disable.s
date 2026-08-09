.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_geometry_recovery.c.

.global func_ov048_0220bc28
func_ov048_0220bc28:
    ldr r0, .L_0220bc38
    mov r1, #0x0
    str r1, [r0, #0x0]
    bx lr
.L_0220bc38: .word 0x40004a8
.size func_ov048_0220bc28, . - func_ov048_0220bc28
