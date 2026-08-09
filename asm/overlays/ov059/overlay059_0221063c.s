.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern TouchRegion_BeginPress
.extern func_02072b68

.global func_ov059_0221063c
func_ov059_0221063c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TouchRegion_BeginPress
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1c]
    and r1, r1, #0xff
    bl func_02072b68
    ldmia sp!, {r4, pc}
.size func_ov059_0221063c, . - func_ov059_0221063c
