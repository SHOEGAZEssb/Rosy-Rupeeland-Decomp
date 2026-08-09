.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern data_020f4e14
.extern func_020b5880

.global func_ov058_0220e63c
func_ov058_0220e63c:
    ldr r1, .L_0220e65c
    ldr ip, .L_0220e660
    ldr r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r0, [r2, #0x0]
    add r1, r1, #0x6000
    mov r2, #0x6000
    bx ip
.L_0220e65c: .word data_020f4e14
.L_0220e660: .word func_020b5880
.size func_ov058_0220e63c, . - func_ov058_0220e63c
