.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_02204134
.extern PresentationScalar_SetImmediate
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern PresentationList_DeleteAll
.extern func_020b0300
.extern func_ov026_022009dc
.extern func_ov026_02203168


    .global func_ov026_02203b10
func_ov026_02203b10:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x3c
    ldr r5, L_02203cac
    add lr, sp, #0x4
    mov r4, r0
    mov ip, #0x3
L_02203b28:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_02203b28
    ldmia r5, {r0, r1}
    stmia lr, {r0, r1}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_02203b58
    cmp r0, #0x1
    beq L_02203c78
    b L_02203c98
L_02203b58:
    add r0, r4, #0x304
    bl PresentationList_DeleteAll
    mov r0, #0x0
    ldr r2, L_02203cb0
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    ldr r0, L_02203cb4
    mov r3, #0x0
    str r3, [r0, #0x0]
    add r0, r4, #0x1c0
    mvn r1, #0x164
    mov r2, #0xff0
    bl func_ov026_02203168
    ldr r0, [r4, #0x2e8]
    ldr r3, L_02203cb8
    mov r1, #0x1ec
    mov r2, #0x0
    bl Presentation_SetPosition
    ldr r0, [r4, #0x2ec]
    ldr r2, L_02203cbc
    mov r1, #0x1ec
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r1, [r4, #0x160]
    add r0, r1, #0x1c
    ldr r1, [r1, #0x13c]
    mov r1, r1, lsl #0xa
    sub r1, r1, #0x4000
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x160]
    add r1, sp, #0x4
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r5, [r4, #0x168]
    mov r1, #0x1800
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0x10000
    str r0, [r5, #0xb4]
    ldr r1, [r4, #0x158]
    mov r0, #0x8000
    str r0, [r1, #0x38]
    str r0, [r1, #0x34]
    mov r1, #0x0
    ldr r2, [r4, #0x158]
    mov r0, #0x40000
    str r1, [r2, #0x20]
    str r0, [r2, #0x24]
    str r1, [r2, #0x28]
    ldr r0, [r4, #0x17c]
    mov r2, #0x44000
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r4, #0x17c]
    mov r1, #0x10000
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x4000
    add r0, r0, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203c78:
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02203c98
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203ca4
L_02203c98:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203ca4:
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, pc}
L_02203cac: .word data_ov026_02204134
L_02203cb0: .word 0x7fff
L_02203cb4: .word 0x4000358
L_02203cb8: .word 0xfffff3d7
L_02203cbc: .word 0x22e1
.size func_ov026_02203b10, .-func_ov026_02203b10

