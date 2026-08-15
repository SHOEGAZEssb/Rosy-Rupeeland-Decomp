.text
; Matching fallback for the portable implementation in src/overlays/ov047/overlay047_matrix_recovery.c.
.extern Presentation_InterpolateSmoothStep
.extern Presentation_InterpolateEaseInQuadratic

.global func_ov047_0220baa8
func_ov047_0220baa8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r1, [r6, #0x24]
    ldr r0, [r6, #0x28]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    add r3, r1, #0x1
    str r3, [r6, #0x24]
    ldr r2, [r6, #0x28]
    ldr r1, [r6, #0x20]
    add r0, r2, r2, lsr #0x1f
    cmp r1, #0xe
    mov r4, r0, asr #0x1
    sub r5, r3, r0, asr #0x1
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bae8:
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    b .L_0220bb4c
    b .L_0220bc40
    b .L_0220bd08
    b .L_0220bd1c
    b .L_0220bd30
    b .L_0220bd44
    b .L_0220bd58
    b .L_0220bd6c
    b .L_0220bd80
    b .L_0220bd94
    b .L_0220bb24
    b .L_0220bc18
    b .L_0220bb24
    b .L_0220bc18
.L_0220bb24:
    add r0, r4, #0x1
    cmp r3, r0
    bne .L_0220bb4c
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r6, #0x2c]
    ldrne r0, [r6, #0x24]
    subne r0, r0, #0x1
    strne r0, [r6, #0x24]
.L_0220bb4c:
    ldr r3, [r6, #0x24]
    cmp r3, r4
    bge .L_0220bbb8
    mov r0, #0x180
    rsb r0, r0, #0x0
    mov r2, r4
    add r1, r0, #0x140
    bl Presentation_InterpolateSmoothStep
    mov r5, r0
    ldr r3, [r6, #0x24]
    mov r2, r4
    mov r0, #0x180
    mov r1, #0x40
    bl Presentation_InterpolateSmoothStep
    ldr r1, [r6, #0x8]
    add r1, r5, r1
    str r1, [r6, #0x10]
    ldr r1, [r6, #0xc]
    add r1, r5, r1
    str r1, [r6, #0x14]
    ldr r1, [r6, #0x8]
    add r1, r0, r1
    str r1, [r6, #0x18]
    ldr r1, [r6, #0xc]
    add r0, r0, r1
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bbb8:
    mov r2, r4
    mov r3, r5
    mvn r0, #0x3f
    mov r1, #0x0
    bl Presentation_InterpolateSmoothStep
    mov r7, r0
    mov r2, r4
    mov r3, r5
    mov r0, #0x40
    mov r1, #0x0
    bl Presentation_InterpolateSmoothStep
    ldr r1, [r6, #0x8]
    add r1, r7, r1
    str r1, [r6, #0x10]
    ldr r1, [r6, #0xc]
    add r1, r7, r1
    str r1, [r6, #0x14]
    ldr r1, [r6, #0x8]
    add r1, r0, r1
    str r1, [r6, #0x18]
    ldr r1, [r6, #0xc]
    add r0, r0, r1
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bc18:
    add r0, r4, #0x1
    cmp r3, r0
    bne .L_0220bc40
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r6, #0x2c]
    ldrne r0, [r6, #0x24]
    subne r0, r0, #0x1
    strne r0, [r6, #0x24]
.L_0220bc40:
    ldr r3, [r6, #0x24]
    cmp r3, r4
    bge .L_0220bca8
    mov r0, #0x0
    mov r2, r4
    sub r1, r0, #0x40
    bl Presentation_InterpolateSmoothStep
    mov r5, r0
    ldr r3, [r6, #0x24]
    mov r2, r4
    mov r0, #0x0
    mov r1, #0x40
    bl Presentation_InterpolateSmoothStep
    ldr r1, [r6, #0x8]
    add r1, r5, r1
    str r1, [r6, #0x10]
    ldr r1, [r6, #0xc]
    add r1, r5, r1
    str r1, [r6, #0x14]
    ldr r1, [r6, #0x8]
    add r1, r0, r1
    str r1, [r6, #0x18]
    ldr r1, [r6, #0xc]
    add r0, r0, r1
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bca8:
    mvn r0, #0x3f
    mov r2, r4
    mov r3, r5
    sub r1, r0, #0x140
    bl Presentation_InterpolateSmoothStep
    mov r7, r0
    mov r2, r4
    mov r3, r5
    mov r0, #0x40
    mov r1, #0x180
    bl Presentation_InterpolateSmoothStep
    ldr r1, [r6, #0x8]
    add r1, r7, r1
    str r1, [r6, #0x10]
    ldr r1, [r6, #0xc]
    add r1, r7, r1
    str r1, [r6, #0x14]
    ldr r1, [r6, #0x8]
    add r1, r0, r1
    str r1, [r6, #0x18]
    ldr r1, [r6, #0xc]
    add r0, r0, r1
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd08:
    mov r0, #0x0
    mov r1, #0x100
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd1c:
    mov r0, #0x100
    mov r1, #0x0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x10]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd30:
    mov r0, #0x0
    mov r1, #0xc0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd44:
    mov r0, #0xc0
    mov r1, #0x0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd58:
    mov r0, #0x0
    mov r1, #0x100
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x10]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd6c:
    mov r0, #0x100
    mov r1, #0x0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd80:
    mov r0, #0x0
    mov r1, #0xc0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220bd94:
    mov r0, #0xc0
    mov r1, #0x0
    bl Presentation_InterpolateEaseInQuadratic
    str r0, [r6, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov047_0220baa8, . - func_ov047_0220baa8
