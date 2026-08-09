.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern func_ov050_0220d7ac

.global func_ov050_0220db40
func_ov050_0220db40:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0xc]
    mov r5, r1
    cmp r2, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, [r0, #0x4]
    b .L_0220db78
.L_0220db68:
    ldr r0, [r4, #0x8]
    mov r1, r5
    bl func_ov050_0220d7ac
    ldr r4, [r4, #0x0]
.L_0220db78:
    cmp r4, #0x0
    bne .L_0220db68
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov050_0220db40, . - func_ov050_0220db40
