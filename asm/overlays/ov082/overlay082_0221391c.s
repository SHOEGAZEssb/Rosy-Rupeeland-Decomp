.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_0221391c
func_ov082_0221391c:
    ldr r2, [r0, #0x4]
    smull ip, r3, r2, r1
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x4]
    ldr r2, [r0, #0x8]
    smull ip, r3, r2, r1
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x8]
    ldr r2, [r0, #0xc]
    smull r3, r1, r2, r1
    adds r2, r3, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r0, #0xc]
    bx lr
.size func_ov082_0221391c, . - func_ov082_0221391c
