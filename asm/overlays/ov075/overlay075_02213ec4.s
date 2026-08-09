.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_020c9670
.extern func_020064b8

.global func_ov075_02213ec4
func_ov075_02213ec4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r3
    mov r1, r2
    mov r2, r5
    mov r4, r0
    bl func_020064b8
    mov r0, r5, lsl #0x13
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_02213f04
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    ldr r1, [r4, #0xc]
    add r0, r1, r0, lsl #0x6
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.L_02213f04: .word data_020c9670
.size func_ov075_02213ec4, . - func_ov075_02213ec4
