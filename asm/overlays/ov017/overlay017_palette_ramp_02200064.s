    .text
/* Exact fallback; see src/overlays/ov017/overlay017_palette_ramp.c. */
    .extern Presentation_InterpolateLinear
.global Overlay017_UpdatePaletteRamp
Overlay017_UpdatePaletteRamp:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r3, [r7, #0x3cc]
    ldr r0, [r7, #0x3d0]
    ldr r1, [r7, #0x2c4]
    ldr r2, [r7, #0x3c8]
    add r3, r3, r0
    mov r0, #0x18
    bl Presentation_InterpolateLinear
    mov r6, r0
    ldr r3, [r7, #0x3cc]
    ldr r0, [r7, #0x3d0]
    ldr r1, [r7, #0x2c8]
    ldr r2, [r7, #0x3c8]
    add r3, r3, r0
    mov r0, #0x18
    bl Presentation_InterpolateLinear
    mov r5, r0
    ldr r2, [r7, #0x3cc]
    ldr r1, [r7, #0x3d0]
    mov r0, #0x1f
    add r3, r2, r1
    ldr r1, [r7, #0x2cc]
    ldr r2, [r7, #0x3c8]
    bl Presentation_InterpolateLinear
    mov r4, r0
    orr r0, r6, r5, lsl #0x5
    orr r1, r0, r4, lsl #0xa
    add r0, r7, #0x400
    strh r1, [r0, #0x38]
    mov r0, r6
    mov r1, #0x1f
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    mov r9, r0
    mov r0, r5
    mov r1, #0x1f
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    mov r8, r0
    mov r0, r4
    mov r1, #0x1f
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    orr r1, r9, r8, lsl #0x5
    orr r2, r1, r0, lsl #0xa
    mov r0, r6
    add r1, r7, #0x400
    strh r2, [r1, #0x3a]
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    mov r6, r0
    mov r0, r5
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    mov r5, r0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x8
    bl Presentation_InterpolateLinear
    orr r1, r6, r5, lsl #0x5
    orr r1, r1, r0, lsl #0xa
    add r0, r7, #0x400
    strh r1, [r0, #0x3c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size Overlay017_UpdatePaletteRamp, . - Overlay017_UpdatePaletteRamp
