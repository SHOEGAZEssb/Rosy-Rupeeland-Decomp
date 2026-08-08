.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_ov039_02204168
    .global func_ov039_02204118
func_ov039_02204118:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r4, r0
    mov r1, #0x8
    sub r9, r1, #0x1
    add r8, r4, #0x88
    add r7, r4, #0xe8
    mov r6, #0x1
    mov r5, #0xc
L_02204138:
    mul r10, r9, r5
    add r0, r8, r10
    add r1, r4, #0xc
    bl func_ov039_02204168
    add r0, r7, r10
    add r1, r4, #0x18
    bl func_ov039_02204168
    add r0, r4, r9, lsl #0x2
    str r6, [r0, #0x28]
    subs r9, r9, #0x1
    bpl L_02204138
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    .size func_ov039_02204118, .-func_ov039_02204118

