.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08

.global func_ov079_022136b8
func_ov079_022136b8:
    mov r1, #0x3
    strh r1, [r0, #0xd6]
    ldr r1, [r0, #0x2a0]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strne r1, [r0, #0x2a0]
    bxne lr
    ldr r1, .L_022136fc
    ldr r3, [r1, #0x90]
    ldr r2, [r1, #0x94]
    str r3, [r0, #0x298]
    str r2, [r0, #0x29c]
    ldr r2, [r1, #0x38]
    ldr r1, [r1, #0x3c]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
    bx lr
.L_022136fc: .word data_ov079_02213b08
.size func_ov079_022136b8, . - func_ov079_022136b8
