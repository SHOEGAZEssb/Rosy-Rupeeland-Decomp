.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212d70
func_ov086_02212d70:
    cmp r1, #0x0
    ldr r1, [r0, #0x288]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
.size func_ov086_02212d70, . - func_ov086_02212d70
