.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_ov074_02211d48

.global func_ov074_02211a68
func_ov074_02211a68:
    ldr r2, .L_02211a88
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    bx lr
.L_02211a88: .word data_ov074_02211d48
.size func_ov074_02211a68, . - func_ov074_02211a68
