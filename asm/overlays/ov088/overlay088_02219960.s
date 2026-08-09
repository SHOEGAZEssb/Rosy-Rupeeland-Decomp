.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02033a6c

.global func_ov088_02219960
func_ov088_02219960:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_02033a6c
    add r0, r4, #0x200
    cmp r5, #0x0
    ldrh r1, [r0, #0x1a]
    beq .L_022199d4
    bic r1, r1, #0x10
    strh r1, [r0, #0x1a]
    ldr r1, [r4, #0x224]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x228]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x22c]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x258]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x14
    b .L_02219a24
.L_022199d4:
    orr r1, r1, #0x10
    strh r1, [r0, #0x1a]
    ldr r1, [r4, #0x22c]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x224]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x228]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x14
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x258]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x14
.L_02219a24:
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov088_02219960, . - func_ov088_02219960
