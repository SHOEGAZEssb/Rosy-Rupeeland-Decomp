.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214350
.extern func_ov085_02213bd0

.global func_ov085_02213ab4
func_ov085_02213ab4:
    mov r1, #0x2
    strh r1, [r0, #0xd6]
    ldr r2, [r0, #0xd0]
    ldr r1, .L_02213adc
    orr r2, r2, #0x1000
    str r2, [r0, #0xd0]
    ldr ip, .L_02213ae0
    mov r3, #0x78
    ldmia r1, {r1, r2}
    bx ip
.L_02213adc: .word data_ov085_02214350
.L_02213ae0: .word func_ov085_02213bd0
.size func_ov085_02213ab4, . - func_ov085_02213ab4
