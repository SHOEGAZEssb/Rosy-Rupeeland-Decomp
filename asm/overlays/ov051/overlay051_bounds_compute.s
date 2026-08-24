.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_shared_recovery.c.
.extern gFx32CosSinTable

.global func_ov051_0220d7bc
func_ov051_0220d7bc:
    ldr r3, [r0, #0x8]
    cmp r2, #0x0
    mul r1, r3, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    beq .L_0220d7e0
    cmp r2, #0x1
    beq .L_0220d818
    bx lr
.L_0220d7e0:
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r2, r1, #0x1
    ldr r1, .L_0220d848
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
.L_0220d818:
    mov r2, r1, asr #0x4
    ldr r1, .L_0220d848
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
.L_0220d848: .word gFx32CosSinTable
.size func_ov051_0220d7bc, . - func_ov051_0220d7bc
