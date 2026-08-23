.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_runtime.c. */
.extern Sound_StopEffect
.extern gSoundContext
.extern Sound_Play


    .global func_ov026_021ff730
func_ov026_021ff730:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r1, [r4, #0x0]
    mov r5, r0
    str r1, [r5, #0x128]
    cmp r1, #0x0
    beq L_021ff758
    cmp r1, #0x1
    beq L_021ff79c
    b L_021ff7e4
L_021ff758:
    ldr r0, [r4, #0x4]
    tst r0, #0x1
    beq L_021ff784
    ldr r0, [r5, #0x12c]
    tst r0, #0x1
    bne L_021ff784
    ldr r0, L_021ff7ec
    mov r1, #0x22
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
L_021ff784:
    ldr r2, [r5, #0x12c]
    ldr r1, [r4, #0x4]
    mov r0, #0x2
    orr r1, r2, r1
    str r1, [r5, #0x12c]
    ldmia sp!, {r3, r4, r5, pc}
L_021ff79c:
    ldr r0, [r4, #0x4]
    tst r0, #0x1
    beq L_021ff7c8
    ldr r0, [r5, #0x12c]
    tst r0, #0x1
    beq L_021ff7c8
    ldr r0, L_021ff7ec
    mov r1, #0x22
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopEffect
L_021ff7c8:
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x12c]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r5, #0x12c]
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
L_021ff7e4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_021ff7ec: .word gSoundContext
.size func_ov026_021ff730, .-func_ov026_021ff730

