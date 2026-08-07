    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_runtime.c. */
    .extern data_020f4e18
    .extern func_02071adc
    .extern func_02071e04
.global func_ov017_021fd7f8
func_ov017_021fd7f8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    beq L_021fd81c
    ldr r0, L_021fd834
    ldr r0, [r0, #0x0]
    bl func_02071e04
L_021fd81c:
    ldr r0, L_021fd834
    mov r1, r4
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd834: .word data_020f4e18
    .size func_ov017_021fd7f8, . - func_ov017_021fd7f8

