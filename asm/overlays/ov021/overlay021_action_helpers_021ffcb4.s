    .text
/* Exact fallback; see src/overlays/ov021/overlay021_action_helpers.c. */
    .extern data_ov021_02202f00
    .extern data_ov021_02202f08
.extern RecordDescriptor_IsDiscovered
    .extern SceneSound_PlayPackedEffect
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern Overlay021_Descriptor_GetCategory
    .extern Overlay021_List_GetSelectedRow
    .extern Overlay021_SetTransition

.global Overlay021_BeginSelectedAction
Overlay021_BeginSelectedAction:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_GetSelectedRow
    ldr r0, [r0, #0x0]
    str r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_GetCategory
    cmp r0, #0x1
    bne L_021ffd34
    ldr r0, [r4, #0x2bc]
    ldr r0, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x2
    blt L_021ffd34
    mov r0, #0x1
    str r0, [r4, #0x3e0]
    ldr r0, [r4, #0x2bc]
    bl RecordDescriptor_IsDiscovered
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [r4, #0x3dc]
    ldr r1, L_021ffd54
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    ldmia sp!, {r4, pc}
L_021ffd34:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_021ffd58
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    ldmia sp!, {r4, pc}
L_021ffd54: .word data_ov021_02202f08
L_021ffd58: .word data_ov021_02202f00
    .size Overlay021_BeginSelectedAction, . - Overlay021_BeginSelectedAction
