.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_runtime.c. */
.extern func_020948d4


    .global func_ov026_021ff674
func_ov026_021ff674:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x124]
    add r1, r0, #0x1
    mov r0, r1, asr #0x4
    str r1, [r7, #0x124]
    and r0, r0, #0x1
    str r0, [r7, #0x120]
    ldr r0, [r7, #0x12c]
    tst r0, #0x80
    beq L_021ff70c
    ldr r1, [r7, #0x130]
    mov r0, #0xf6
    add r2, r1, #0x1
    mov r1, r2, asr #0x2
    and r1, r1, #0x1
    add r1, r1, #0x1
    mul r5, r1, r0
    str r2, [r7, #0x130]
    mov r6, #0x0
    mov r4, #0x1
L_021ff6c8:
    add r2, r7, r6, lsl #0x2
    ldr r0, [r2, #0xec]
    mov r1, r5
    str r4, [r0, #0xac]
    ldr r0, [r2, #0xec]
    add r0, r0, #0x6c
    bl func_020948d4
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r0, #0x50]
    add r0, r0, #0x4c
    add r1, r1, #0x1000
    bl func_020948d4
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_021ff6c8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021ff70c:
    mov r2, #0x0
    mov r1, r2
L_021ff714:
    add r0, r7, r2, lsl #0x2
    ldr r0, [r0, #0xec]
    add r2, r2, #0x1
    str r1, [r0, #0xac]
    cmp r2, #0x4
    blt L_021ff714
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov026_021ff674, .-func_ov026_021ff674

