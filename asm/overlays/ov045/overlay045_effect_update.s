.text
.extern Presentation_AdvanceTransitions

.global func_ov045_0220b7a0
func_ov045_0220b7a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Presentation_AdvanceTransitions
    ldr r2, [r4, #0x10]
    ldr r3, [r4, #0x20]
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r0, r3, asr #0xb
    add r0, r3, r0, lsr #0x14
    ldr r2, [r4, #0x9c]
    mov r1, r1, asr #0xc
    strh r1, [r2, #0x2c]
    mov r0, r0, asr #0xc
    strh r0, [r2, #0x2e]
    ldr r1, [r4, #0x80]
    ldr r0, [r4, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov045_0220b7a0, . - func_ov045_0220b7a0
