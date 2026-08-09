.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_display_recovery.c.
.extern func_ov048_0220b9a0

.global func_ov048_0220ba90
func_ov048_0220ba90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    bl func_ov048_0220b9a0
    ldr r0, [r4, #0x0]
    ldr r1, .L_0220bad0
    cmp r0, #0x0
    ldreq r0, [r1, #0x0]
    biceq r0, r0, #0x1f00
    orreq r0, r0, #0x1000
    streq r0, [r1, #0x0]
    ldrne r0, [r1, #0x0]
    bicne r0, r0, #0x1f00
    orrne r0, r0, #0x400
    strne r0, [r1, #0x0]
    ldmia sp!, {r4, pc}
.L_0220bad0: .word 0x4001000
.size func_ov048_0220ba90, . - func_ov048_0220ba90
