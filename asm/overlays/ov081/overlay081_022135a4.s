.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_022152b8
.extern func_ov081_02213710

.global func_ov081_022135a4
func_ov081_022135a4:
    mov r1, #0x2
    strh r1, [r0, #0xd6]
    ldr r2, [r0, #0xd0]
    ldr r1, .L_022135cc
    orr r2, r2, #0x1000
    str r2, [r0, #0xd0]
    ldr ip, .L_022135d0
    mov r3, #0x78
    ldmia r1, {r1, r2}
    bx ip
.L_022135cc: .word data_ov081_022152b8
.L_022135d0: .word func_ov081_02213710
.size func_ov081_022135a4, . - func_ov081_022135a4
