; Matching retail form; see src/game/actor_motion_oscillation_sample.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_020c9670
.extern func_020050a4
.global func_020096f0
func_020096f0: ; 0x020096f0
    ldr r3, [r0, #0x8]
    cmp r2, #0x0
    mul r1, r3, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    beq L_02009714
    cmp r2, #0x1
    beq L_0200974c
    bx lr
L_02009714:
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r2, r1, #0x1
    ldr r1, L_0200977c
    mov r2, r2, lsl #0x1
    ldrsh r2, [r1, r2]
    ldmia r0, {r1, r3}
    smull r1, r0, r2, r1
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bx lr
L_0200974c:
    mov r2, r1, asr #0x4
    ldr r1, L_0200977c
    mov r2, r2, lsl #0x2
    ldrsh r2, [r1, r2]
    ldmia r0, {r1, r3}
    smull r1, r0, r2, r1
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bx lr
L_0200977c: .word data_020c9670

    .size func_020096f0, .-func_020096f0

    .global func_02009780
func_02009780: ; 0x02009780
    ldr ip, L_0200978c
    add r0, r0, #0x34
    bx ip
L_0200978c: .word func_020050a4
    .size func_02009780, .-func_02009780

