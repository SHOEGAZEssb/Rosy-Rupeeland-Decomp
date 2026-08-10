.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_021052fc
.extern ActorDerivedRuntime_UpdateFrame

.global func_ov088_0221b558
func_ov088_0221b558:
    ldr r1, .L_0221b5a8
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    cmp r1, #0x0
    beq .L_0221b594
    ldr r1, [r1, #0x230]
    tst r1, #0x20000
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    ldrne r1, [r0, #0x10]
    bicne r1, r1, #0x10000
    strne r1, [r0, #0x10]
    bne .L_0221b5a0
.L_0221b594:
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x10000
    str r1, [r0, #0x10]
.L_0221b5a0:
    ldr ip, .L_0221b5ac
    bx ip
.L_0221b5a8: .word data_021052fc
.L_0221b5ac: .word ActorDerivedRuntime_UpdateFrame
.size func_ov088_0221b558, . - func_ov088_0221b558
