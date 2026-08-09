.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e70

.global func_ov094_02217c34
func_ov094_02217c34:
    ldr r2, .L_02217c50
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
.L_02217c50: .word data_ov094_02219e70
.size func_ov094_02217c34, . - func_ov094_02217c34
