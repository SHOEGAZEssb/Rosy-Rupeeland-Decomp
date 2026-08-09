.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_ov049_0220c3d8

.global func_ov069_02210988
func_ov069_02210988:
    ldr ip, .L_02210998
    add r0, r0, #0x54
    add r0, r0, #0x400
    bx ip
.L_02210998: .word func_ov049_0220c3d8
.size func_ov069_02210988, . - func_ov069_02210988
