.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_02005030

.global func_ov078_02215adc
func_ov078_02215adc:
    ldr ip, .L_02215ae8
    add r1, r1, #0x18
    bx ip
.L_02215ae8: .word func_02005030
.size func_ov078_02215adc, . - func_ov078_02215adc
