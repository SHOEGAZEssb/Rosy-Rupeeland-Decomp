.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214368
.extern func_ov085_02213bd0

.global func_ov085_02213ffc
func_ov085_02213ffc:
    ldr r1, .L_02214010
    ldr ip, .L_02214014
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bx ip
.L_02214010: .word data_ov085_02214368
.L_02214014: .word func_ov085_02213bd0
.size func_ov085_02213ffc, . - func_ov085_02213ffc
