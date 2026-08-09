.text

    .global func_ov044_0220bb48
func_ov044_0220bb48:
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    ldrne r0, [r0, #0x20]
    andne r0, r0, r1
    moveq r0, #0x0
    bx lr
.size func_ov044_0220bb48, . - func_ov044_0220bb48
