.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_ov080_0221375c

.global func_ov080_022136f4
func_ov080_022136f4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r2, r4, #0x200
    ldrh r2, [r2, #0xa0]
    mov r5, r1
    cmp r2, #0x0
    beq .L_0221371c
    cmp r2, #0x1
    beq .L_02213730
    ldmia sp!, {r3, r4, r5, pc}
.L_0221371c:
    ldr r2, [r4, #0x10]
    orr r2, r2, #0x1f0000
    str r2, [r4, #0x10]
    bl func_ov080_0221375c
    ldmia sp!, {r3, r4, r5, pc}
.L_02213730:
    ldr r2, [r4, #0x10]
    orr r2, r2, #0x1f0000
    str r2, [r4, #0x10]
    bl func_ov080_0221375c
    ldr r0, [r4, #0x10]
    cmp r5, #0x0
    orreq r0, r0, #0x80000
    streq r0, [r4, #0x10]
    bicne r0, r0, #0x80000
    strne r0, [r4, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov080_022136f4, . - func_ov080_022136f4
