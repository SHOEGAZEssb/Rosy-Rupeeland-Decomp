.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern VecFx32Object_Init
.extern func_020adc90

.global Overlay064VecFx32_Divide
Overlay064VecFx32_Divide:
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
.size Overlay064VecFx32_Divide, . - Overlay064VecFx32_Divide
