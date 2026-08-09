.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02004fe0
.extern func_020adc90

.global func_ov075_022168a8
func_ov075_022168a8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl func_02004fe0
    ldr r0, [r5, #0x4]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0x4]
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0x8]
    ldr r0, [r5, #0xc]
    mov r1, r4
    bl func_020adc90
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov075_022168a8, . - func_ov075_022168a8
