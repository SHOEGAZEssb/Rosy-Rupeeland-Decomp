.text

/* Exact fallback; see src/overlays/ov037/overlay037_presentation_runtime.c for documented portable C. */

    .extern Graphics3DResourceOwner_Destroy
    .extern Heap_Free
    .extern func_02075020
    .extern func_02092418
    .extern GX_SetGraphicsMode
    .extern func_ov048_0220b7b4
    .extern func_020923a0
    .extern func_ov048_0220ba90
    .extern data_ov037_021fee94
    .extern data_020f4e14
    .extern gDebugFont

    .global func_ov037_021fe718
func_ov037_021fe718:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe7cc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq L_021fe74c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe74c:
    ldr r5, [r4, #0x58]
    cmp r5, #0x0
    beq L_021fe768
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_021fe768:
    ldr r0, L_021fe7d0
    ldr r0, [r0, #0x0]
    bl func_02075020
    ldr r0, L_021fe7d4
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x60
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_021fe7d8
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    add r0, r4, #0x94
    strh r2, [r1, #0x0]
    bl func_ov048_0220b7b4
    add r0, r4, #0x60
    bl func_020923a0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe7cc: .word data_ov037_021fee94
L_021fe7d0: .word data_020f4e14
L_021fe7d4: .word gDebugFont
L_021fe7d8: .word 0x4000050
    .size func_ov037_021fe718, .-func_ov037_021fe718

    .global func_ov037_021fe7dc
func_ov037_021fe7dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fe814
    add r0, r4, #0x94
    bl func_ov048_0220ba90
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021fe814:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov037_021fe7dc, .-func_ov037_021fe7dc
