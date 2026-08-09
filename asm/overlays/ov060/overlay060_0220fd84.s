.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern func_02072b68
.extern func_ov060_0220fdd8
.extern func_ov060_0220fdf8

.global func_ov060_0220fd84
func_ov060_0220fd84:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    str r1, [r5, #0x1c]
    strb r2, [r5, #0x20]
    strb r3, [r5, #0x21]
    ldrb r1, [r5, #0x20]
    ldr r0, [r5, #0x1c]
    bl func_02072b68
    add r0, r5, #0x14
    bl func_ov060_0220fdf8
    mov r4, r0
    add r0, r5, #0x14
    bl func_ov060_0220fdd8
    ldr r1, [r5, #0x1c]
    strh r0, [r1, #0x2c]
    strh r4, [r1, #0x2e]
    ldr r1, [r5, #0x1c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov060_0220fd84, . - func_ov060_0220fd84
