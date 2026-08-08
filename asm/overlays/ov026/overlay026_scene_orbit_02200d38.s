.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_orbit.c. */
.extern data_020c9670
.extern func_020948d4


    .global func_ov026_02200d38
func_ov026_02200d38:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x35c]
    ldr r0, [r4, #0x364]
    ldr r1, L_02200dd4
    add r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r1, [r1, r0]
    str r2, [r4, #0x35c]
    ldr r0, [r4, #0x360]
    rsb r1, r1, #0x0
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    ldr r3, [r4, #0x2e8]
    adc r2, r0, #0x0
    mov r1, r1, lsr #0xc
    add r0, r3, #0xc
    orr r1, r1, r2, lsl #0x14
    bl func_020948d4
    ldr r1, [r4, #0x35c]
    ldr r0, L_02200dd4
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    ldr r0, [r4, #0x360]
    ldr r3, [r4, #0x2e8]
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r2, r0, #0x0
    mov r1, r1, lsr #0xc
    add r0, r3, #0x2c
    orr r1, r1, r2, lsl #0x14
    bl func_020948d4
    ldmia sp!, {r4, pc}
L_02200dd4: .word data_020c9670
.size func_ov026_02200d38, .-func_ov026_02200d38

