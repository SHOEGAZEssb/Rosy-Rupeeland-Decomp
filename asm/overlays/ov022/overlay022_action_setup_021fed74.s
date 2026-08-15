.text

/* Exact fallback; see src/overlays/ov022/overlay022_action_setup.c. */
.extern Presentation_InterpolateLinear
.extern func_ov046_0220bffc
.extern func_ov046_0220c3bc
.extern func_ov046_0220c410
.extern func_ov046_0220c46c


    .global func_ov022_021fed74
func_ov022_021fed74:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldr r1, [r8, #0x2b4]
    ldr r0, [r8, #0x35c]
    ldr r3, [r1, #0x38]
    ldr r2, [r1, #0xc]
    ldr r1, [r8, #0x358]
    ldr r2, [r3, r2, lsl #0x3]
    ldrsh r5, [r2, #0x0]
    bl func_ov046_0220c3bc
    mov r7, r0
    ldr r0, [r8, #0x35c]
    ldr r1, [r8, #0x358]
    bl func_ov046_0220c410
    mov r4, r0
    ldr r0, [r8, #0x35c]
    mov r1, r5
    bl func_ov046_0220c3bc
    mov r6, r0
    ldr r0, [r8, #0x35c]
    mov r1, r5
    bl func_ov046_0220c410
    mov r9, r0
    ldr r2, [r8, #0x2b4]
    mov r1, r6
    mov r0, r7
    ldr r6, [r2, #0x28]
    ldr r7, [r2, #0x24]
    mov r3, r6
    mov r2, r7
    bl Presentation_InterpolateLinear
    mov r1, r9
    mov r9, r0
    mov r0, r4
    mov r2, r7
    mov r3, r6
    bl Presentation_InterpolateLinear
    mov r2, r0
    ldr r0, [r8, #0x35c]
    mov r1, r9
    bl func_ov046_0220c46c
    add r0, r7, r7, lsr #0x1f
    cmp r6, r0, asr #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r2, #0x0
    ldr r0, [r8, #0x35c]
    mov r1, r5
    mov r3, r2
    bl func_ov046_0220bffc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov022_021fed74, .-func_ov022_021fed74

