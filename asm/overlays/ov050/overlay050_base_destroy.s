.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern data_ov050_0220e384
.extern func_ov050_0220d8b4

.global func_ov050_0220d894
func_ov050_0220d894:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220d8b0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_ov050_0220d8b4
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220d8b0: .word data_ov050_0220e384
.size func_ov050_0220d894, . - func_ov050_0220d894
