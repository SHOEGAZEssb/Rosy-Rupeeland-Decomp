.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb70
.extern DisplayBrightness_IsMainTransitionComplete
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern RecordDescriptor_GetMessage
.extern func_02091bac
.extern func_02091bd0
.extern func_02091c7c
.extern func_02091cf0
.extern DisplayBrightness_StartMaskedTransitions
.extern func_ov023_021fd9d0
.extern func_ov023_021fe77c
.extern func_ov023_021fe804
.extern func_ov023_021fe88c
.extern func_ov045_0220c274
.extern Overlay045Graphics_SetUniformValue
.extern gDebugFont


    .global func_ov023_021ff0a4
func_ov023_021ff0a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021ff288
L_021ff0bc: ; jump table
    b L_021ff0cc ; case 0
    b L_021ff10c ; case 1
    b L_021ff1a8 ; case 2
    b L_021ff204 ; case 3
L_021ff0cc:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    add r0, r4, #0xdc
    mov r2, #0x8
    mov r1, #0x4
    str r2, [sp, #0x0]
    add r0, r0, #0x400
    sub r2, r1, #0x84
    mov r3, #0x0
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff10c:
    add r0, r4, #0xdc
    add r0, r0, #0x400
    mov r1, #0x1
    bl func_02091c7c
    mov r1, r0
    ldr r0, [r4, #0x4bc]
    bl func_ov045_0220c274
    add r0, r4, #0xdc
    add r0, r0, #0x400
    mov r1, #0x1
    mov r2, #0x200
    mov r3, #0x180
    bl func_02091bd0
    mov r1, r0
    ldr r0, [r4, #0x4bc]
    bl Overlay045Graphics_SetUniformValue
    add r0, r4, #0xdc
    add r0, r0, #0x400
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021ff288
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff288
    ldr r0, [r4, #0x394]
    ldr r5, [r0, #0x0]
    ldr r1, [r5, #0xc]
    mov r0, r5
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    mov r2, r5
    bl func_ov023_021fe804
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff288
L_021ff1a8:
    bl func_ov023_021fe88c
    cmp r0, #0x0
    beq L_021ff288
    ldr r0, L_021ff298
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    add r0, r4, #0xdc
    mov r1, #0x8
    mov r2, #0x0
    str r1, [sp, #0x0]
    add r0, r0, #0x400
    sub r3, r2, #0x80
    mov r1, #0x5
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff288
L_021ff204:
    add r0, r4, #0xdc
    add r0, r0, #0x400
    mov r1, #0x1
    bl func_02091c7c
    mov r1, r0
    ldr r0, [r4, #0x4bc]
    bl func_ov045_0220c274
    add r0, r4, #0xdc
    add r0, r0, #0x400
    mov r1, #0x1
    mov r2, #0x180
    mov r3, #0x200
    bl func_02091bd0
    mov r1, r0
    ldr r0, [r4, #0x4bc]
    bl Overlay045Graphics_SetUniformValue
    add r0, r4, #0xdc
    add r0, r0, #0x400
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021ff288
    ldr r0, [r4, #0x4bc]
    cmp r0, #0x0
    beq L_021ff270
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff270:
    mov r0, #0x0
    ldr r1, L_021ff29c
    str r0, [r4, #0x4bc]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
L_021ff288:
    mov r0, r4
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff298: .word gDebugFont
L_021ff29c: .word data_ov023_021ffb70
.size func_ov023_021ff0a4, .-func_ov023_021ff0a4

