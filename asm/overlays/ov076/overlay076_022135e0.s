.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern VecFx32Object_Init
.extern func_020adc90

.global func_ov076_022135e0
func_ov076_022135e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl VecFx32Object_Init
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
.size func_ov076_022135e0, . - func_ov076_022135e0
