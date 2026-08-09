.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern TouchRegion_BeginPress
.extern func_02072b68

.global func_ov060_0220fe18
func_ov060_0220fe18:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TouchRegion_BeginPress
    ldrb r1, [r4, #0x21]
    ldr r0, [r4, #0x1c]
    bl func_02072b68
    ldr r1, [r4, #0x1c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.size func_ov060_0220fe18, . - func_ov060_0220fe18
