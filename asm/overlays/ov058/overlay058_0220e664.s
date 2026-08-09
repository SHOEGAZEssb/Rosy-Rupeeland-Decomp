.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern data_020f4e14
.extern func_020b5880

.global func_ov058_0220e664
func_ov058_0220e664:
    ldr r1, .L_0220e684
    ldr r0, [r0, #0x0]
    ldr r1, [r1, #0x0]
    ldr ip, .L_0220e688
    add r0, r0, #0x6000
    ldr r1, [r1, #0x0]
    mov r2, #0x6000
    bx ip
.L_0220e684: .word data_020f4e14
.L_0220e688: .word func_020b5880
.size func_ov058_0220e664, . - func_ov058_0220e664
