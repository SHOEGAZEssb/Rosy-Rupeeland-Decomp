.text
; Matching fallback for the portable implementation in src/game/modal_geometry.c.

.global func_0209b5e8
func_0209b5e8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r5, [r2, #0x4]
    ldr r0, [r2, #0x8]
    ldmib r1, {r4, lr}
    sub r5, r5, r4
    sub r8, r0, lr
    smull r0, r6, r5, r3
    adds r7, r0, #0x800
    smull r0, r5, r8, r3
    ldr ip, [r1, #0xc]
    ldr r1, [r2, #0xc]
    adc r2, r6, #0x0
    adds r6, r0, #0x800
    mov r0, r7, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    sub r1, r1, ip
    smull r3, r2, r1, r3
    adc r1, r5, #0x0
    mov r5, r6, lsr #0xc
    adds r3, r3, #0x800
    orr r5, r5, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    ldr r6, [sp, #0x18]
    add r0, r0, r4
    str r0, [r6, #0x4]
    add r0, r5, lr
    orr r2, r2, r1, lsl #0x14
    str r0, [r6, #0x8]
    add r0, r2, ip
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_0209b5e8, . - func_0209b5e8
