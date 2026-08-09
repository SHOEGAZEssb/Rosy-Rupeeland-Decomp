.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern func_02005030

.global func_ov079_02213944
func_ov079_02213944:
    ldr ip, .L_02213950
    add r1, r1, #0x18
    bx ip
.L_02213950: .word func_02005030
.size func_ov079_02213944, . - func_ov079_02213944
