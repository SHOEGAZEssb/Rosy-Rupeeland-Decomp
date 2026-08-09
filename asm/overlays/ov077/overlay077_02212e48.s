.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern func_02043340

.global func_ov077_02212e48
func_ov077_02212e48:
    ldr ip, .L_02212e50
    bx ip
.L_02212e50: .word func_02043340
.size func_ov077_02212e48, . - func_ov077_02212e48
