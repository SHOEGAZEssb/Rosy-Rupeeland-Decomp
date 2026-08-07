    .text
    .extern data_020f4e18
    .extern func_02071e04
    .extern func_02071adc
/* Exact register-order fallback; see src/overlays/ov012/overlay012_transform_resource_set.c. */
    .global func_ov012_021fceb4
func_ov012_021fceb4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    ldr r1, [r5, #4]
    cmp r1, #0
    beq L_021fced8
    ldr r0, L_021fcef0
    ldr r0, [r0]
    bl func_02071e04
L_021fced8:
    ldr r0, L_021fcef0
    mov r1, r4
    ldr r0, [r0]
    bl func_02071adc
    str r0, [r5, #4]
    ldmia sp!, {r3, r4, r5, pc}
L_021fcef0:
    .word data_020f4e18
    .size func_ov012_021fceb4, . - func_ov012_021fceb4
