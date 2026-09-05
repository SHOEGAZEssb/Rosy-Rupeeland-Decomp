.text
; Matching fallback for the portable implementation in src/game/modal_geometry.c.

.global func_0209b58c
func_0209b58c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, [r1, #0x4]
    ldr r4, [r2, #0x4]
    ldr r0, [r1, #0x8]
    ldr r1, [r2, #0x8]
    sub r2, r4, ip
    sub r5, r1, r0
    smull r1, lr, r2, r3
    adds r4, r1, #0x800
    smull r2, r1, r5, r3
    adc r3, lr, #0x0
    adds r2, r2, #0x800
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    ldr r3, [sp, #0x10]
    add r1, r4, ip
    str r1, [r3, #0x4]
    add r0, r2, r0
    str r0, [r3, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_0209b58c, . - func_0209b58c
