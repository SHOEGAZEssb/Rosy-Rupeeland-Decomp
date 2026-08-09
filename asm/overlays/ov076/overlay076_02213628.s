.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_020adc90

.global func_ov076_02213628
func_ov076_02213628:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    bl func_020adc90
    str r0, [r5, #0x4]
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_020adc90
    str r0, [r5, #0x8]
    ldr r0, [r5, #0xc]
    mov r1, r4
    bl func_020adc90
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov076_02213628, . - func_ov076_02213628
