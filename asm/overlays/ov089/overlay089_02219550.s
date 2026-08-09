.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern func_02005030

.global func_ov089_02219550
func_ov089_02219550:
    ldr ip, .L_0221955c
    add r1, r1, #0x18
    bx ip
.L_0221955c: .word func_02005030
.size func_ov089_02219550, . - func_ov089_02219550
