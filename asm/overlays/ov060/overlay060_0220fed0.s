.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern TouchRegion_Notify

.global func_ov060_0220fed0
func_ov060_0220fed0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl TouchRegion_Notify
    ldr r1, [r5, #0x1c]
    cmp r4, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov060_0220fed0, . - func_ov060_0220fed0
