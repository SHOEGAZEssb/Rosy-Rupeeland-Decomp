.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02042408

.global func_ov097_02219d08
func_ov097_02219d08:
    ldr ip, .L_02219d10
    bx ip
.L_02219d10: .word func_02042408
.size func_ov097_02219d08, . - func_ov097_02219d08
