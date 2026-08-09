.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern func_020b5880
.extern gDebugFont

.global func_ov058_0220e68c
func_ov058_0220e68c:
    ldr r1, .L_0220e6a8
    ldr ip, .L_0220e6ac
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x6000
    ldr r1, [r1, #0x0]
    bx ip
.L_0220e6a8: .word gDebugFont
.L_0220e6ac: .word func_020b5880
.size func_ov058_0220e68c, . - func_ov058_0220e68c
