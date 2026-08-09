.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02005030

.global func_ov088_0221b5c0
func_ov088_0221b5c0:
    ldr ip, .L_0221b5cc
    add r1, r1, #0x18
    bx ip
.L_0221b5cc: .word func_02005030
.size func_ov088_0221b5c0, . - func_ov088_0221b5c0
