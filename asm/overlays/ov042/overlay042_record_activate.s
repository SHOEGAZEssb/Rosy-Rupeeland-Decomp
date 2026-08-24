.text

/* Exact fallback for func_ov042_021fd924; see the documented portable C in
 * src/overlays/ov042/overlay042_record_helpers.c. */
.extern genrand_int32
.extern func_ov042_021fda0c
.extern gFx32CosSinTable

    .global func_ov042_021fd924
func_ov042_021fd924:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, [r8, #0xf24]
    mov r4, r1
    mov r7, r2
    cmp r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r8, r0, lsl #0x2
    str r4, [r0, #0xb3c]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    mov r5, r1, lsl #0x1
    add r1, r5, #0x1
    mov r3, r1, lsl #0x1
    ldr r2, .L_021fda08
    mov r1, r5, lsl #0x1
    ldrsh r5, [r2, r1]
    ldr r1, [r8, #0xf24]
    cmp r4, #0x1
    add r1, r8, r1, lsl #0x1
    add r1, r1, #0x900
    strh r0, [r1, #0xac]
    ldrsh r4, [r2, r3]
    mov r6, #0x8
    ldr r1, [r8, #0xf24]
    add r2, r8, #0x4c
    mov r0, #0xc
    mla r0, r1, r0, r2
    mov r1, r7
    moveq r6, #0xc
    bl func_ov042_021fda0c
    ldr r2, [r8, #0xf24]
    mov r0, #0xc
    mla r1, r2, r0, r8
    mul r3, r4, r6
    str r3, [r1, #0x500]
    ldr r1, [r8, #0xf24]
    mul r2, r5, r6
    mla r0, r1, r0, r8
    str r2, [r0, #0x504]
    ldr r0, [r8, #0xf24]
    mov r1, #0x1e
    add r0, r8, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r1, [r0, #0x74]
    ldr r0, [r8, #0xf24]
    sub r1, r1, #0x1f
    add r0, r8, r0, lsl #0x1
    add r0, r0, #0xc00
    strh r1, [r0, #0xcc]
    ldr r0, [r8, #0xf24]
    add r0, r8, r0, lsl #0x2
    ldr r0, [r0, #0xd94]
    str r0, [r8, #0xf24]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021fda08: .word gFx32CosSinTable
    .size func_ov042_021fd924, . - func_ov042_021fd924
