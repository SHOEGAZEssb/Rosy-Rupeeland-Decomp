.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_02215290
.extern func_ov081_02213710

.global func_ov081_0221515c
func_ov081_0221515c:
    ldr r1, .L_02215170
    ldr ip, .L_02215174
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bx ip
.L_02215170: .word data_ov081_02215290
.L_02215174: .word func_ov081_02213710
.size func_ov081_0221515c, . - func_ov081_0221515c
