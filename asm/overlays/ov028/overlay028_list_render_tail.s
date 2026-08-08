.text

/* Exact fallback; see src/overlays/ov028/overlay028_list_render.c. */
.extern func_ov028_021fd390
.extern func_ov028_021fd420
.extern func_ov028_021fd468

.global func_ov028_021fd5e0
func_ov028_021fd5e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x44]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fd660
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd658
    mov r0, #0x18
    mul r1, r3, r0
    ldr r0, [r4, #0x4]
    rsb r1, r1, #0x1c
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov028_021fd420
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl func_ov028_021fd390
    mov r0, r4
    bl func_ov028_021fd468
L_021fd658:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd660:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov028_021fd5e0, .-func_ov028_021fd5e0

.global func_ov028_021fd668
func_ov028_021fd668:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov028_021fd668, .-func_ov028_021fd668
