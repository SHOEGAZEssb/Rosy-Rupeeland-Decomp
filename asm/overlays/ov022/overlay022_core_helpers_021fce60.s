    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern Presentation_AdvanceTransitions
    .extern func_ov022_021fceb0

.global func_ov022_021fce60
func_ov022_021fce60:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Presentation_AdvanceTransitions
    ldr r2, [r4, #0x10]
    ldr r3, [r4, #0x20]
    mov r1, r2, asr #0xb
    add r2, r2, r1, lsr #0x14
    mov r0, r3, asr #0xb
    add r1, r3, r0, lsr #0x14
    ldr r3, [r4, #0x9c]
    mov r2, r2, asr #0xc
    mov r0, r4
    strh r2, [r3, #0x2c]
    mov r1, r1, asr #0xc
    strh r1, [r3, #0x2e]
    bl func_ov022_021fceb0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov022_021fce60, . - func_ov022_021fce60
