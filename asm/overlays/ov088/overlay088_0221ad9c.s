.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221ad9c
func_ov088_0221ad9c:
    cmp r1, #0x0
    addne r0, r0, #0x200
    ldrneh r1, [r0, #0x1a]
    bicne r1, r1, #0x1000
    strneh r1, [r0, #0x1a]
    bxne lr
    add r1, r0, #0x200
    ldrh r2, [r1, #0x1a]
    orr r2, r2, #0x1000
    strh r2, [r1, #0x1a]
    ldr r1, [r0, #0x258]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    bx lr
.size func_ov088_0221ad9c, . - func_ov088_0221ad9c
