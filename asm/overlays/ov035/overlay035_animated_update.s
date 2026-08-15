.text

/* Exact fallback; see src/overlays/ov035/overlay035_animated_object.c for documented portable C. */

    .extern PresentationScalar_SetImmediate
    .extern Presentation_UpdateScript
    .extern func_020956a4
    .extern data_020c9670


    .global func_ov035_021fdbe0
func_ov035_021fdbe0: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xa0]
    cmp r0, #0x2
    beq L_021fdc00
    cmp r0, #0x3
    beq L_021fdc64
    b L_021fdcc8
L_021fdc00:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    ldr r0, [r4, #0xac]
    subne r0, r0, #0x200
    addeq r0, r0, #0x200
    str r0, [r4, #0xac]
    ldr r1, [r4, #0xac]
    add r0, r4, #0x5c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r4, #0xac]
    bl PresentationScalar_SetImmediate
    ldr r1, [r4, #0xac]
    ldr r0, L_021fdce4
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    ldr r3, [r4, #0xa8]
    add r0, r4, #0x1c
    mov r2, r1, lsl #0x9
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    add r1, r3, r1, asr #0xc
    bl PresentationScalar_SetImmediate
    b L_021fdcc8
L_021fdc64:
    ldr r0, [r4, #0xac]
    ldr r1, L_021fdce4
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, lsl #0x12
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r1, [r1, r0]
    str r2, [r4, #0xac]
    add r0, r4, #0x5c
    bl PresentationScalar_SetImmediate
    ldr r1, [r4, #0xac]
    ldr r0, L_021fdce4
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    ldr r3, [r4, #0xa8]
    add r0, r4, #0x1c
    mov r2, r1, lsl #0x9
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    add r1, r3, r1, asr #0xc
    bl PresentationScalar_SetImmediate
L_021fdcc8:
    mov r0, r4
    bl Presentation_UpdateScript
    mov r5, r0
    mov r0, r4
    bl func_020956a4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fdce4: .word data_020c9670
.size func_ov035_021fdbe0, .-func_ov035_021fdbe0

