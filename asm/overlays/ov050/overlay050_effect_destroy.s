.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern func_02005058
.extern func_02074038

.global func_ov050_0220d6b0
func_ov050_0220d6b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0x0]
    bl func_02074038
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0x0]
    bl func_02074038
    add r0, r4, #0x18
    bl func_02005058
    add r0, r4, #0x8
    bl func_02005058
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov050_0220d6b0, . - func_ov050_0220d6b0
