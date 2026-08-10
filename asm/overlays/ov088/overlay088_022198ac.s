.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Actor_RequestAttachmentActivation

.global func_ov088_022198ac
func_ov088_022198ac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    bl Actor_RequestAttachmentActivation
    cmp r5, #0x0
    beq .L_02219910
    ldr r1, [r4, #0x224]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x228]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x22c]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x258]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    b .L_02219958
.L_02219910:
    ldr r1, [r4, #0x22c]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x224]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x228]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r1, [r4, #0x258]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
.L_02219958:
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov088_022198ac, . - func_ov088_022198ac
