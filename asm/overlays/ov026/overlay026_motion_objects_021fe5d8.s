.text

/* Exact fallback; see src/overlays/ov026/overlay026_motion_objects.c. */
.extern data_ov026_02204a08
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern func_02094bf0
.extern func_ov026_021fce00


    .global func_ov026_021fe5d8
func_ov026_021fe5d8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r3
    mov r6, r2
    ldr r3, L_021fe678
    mov r2, #0x3
    mov r4, r0
    bl func_ov026_021fce00
    ldr ip, L_021fe67c
    ldr r3, [sp, #0x10]
    mov r0, r4
    mov r1, r6
    mov r2, r5
    str ip, [r4, #0x0]
    mov ip, #0x0
    str ip, [r4, #0xb0]
    bl Presentation_SetPosition
    add r0, r4, #0x6c
    mov r1, #0x52
    bl PresentationScalar_SetImmediate
    mov r0, r4
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    mov r3, #0x0
    bl func_02094bf0
    add r0, r4, #0x6c
    mov r1, #0x3
    mov r2, #0x148
    bl PresentationScalar_TransitionTo
    add r0, r4, #0x5c
    mov r1, #0x1
    mov r2, #0x8000
    bl PresentationScalar_TransitionTo
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    mov r0, #0x1
    str r0, [r4, #0x88]
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fe678: .word 0x7fff
L_021fe67c: .word data_ov026_02204a08
.size func_ov026_021fe5d8, .-func_ov026_021fe5d8

