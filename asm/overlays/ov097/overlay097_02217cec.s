.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_ov078_0221361c

.global func_ov097_02217cec
func_ov097_02217cec:
    ldr ip, .L_02217cf4
    bx ip
.L_02217cf4: .word func_ov078_0221361c
.size func_ov097_02217cec, . - func_ov097_02217cec
