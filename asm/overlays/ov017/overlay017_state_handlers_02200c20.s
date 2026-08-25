    .text
/* Exact fallback; see src/overlays/ov017/overlay017_state_handlers.c. */
    .extern data_ov017_02201550
    .extern data_ov017_022016e0
    .extern SceneSound_StopPackedEffect
    .extern Overlay017_HideSpritePool
    .extern Overlay017_SetCallbackDescriptor
    .extern Overlay017_UpdateScene
    .extern Overlay017_RenderScene
.global Overlay017_UpdateExitState
Overlay017_UpdateExitState:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne L_02200c98
    ldr r0, L_02200cb0
    ldr r1, [r0, #0x0]
    add r2, r1, #0x1
    str r2, [r0, #0x0]
    ldr r1, [r0, #0x8]
    cmp r2, r1
    bge L_02200c5c
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    bne L_02200c98
L_02200c5c:
    ldr r0, [r4, #0x254]
    bl Overlay017_HideSpritePool
    ldr r1, L_02200cb4
    mov r0, r4
    bl SceneSound_StopPackedEffect
    ldr r0, [r4, #0x440]
    cmp r0, #0x0
    beq L_02200c88
    ldr r1, L_02200cb8
    mov r0, r4
    bl SceneSound_StopPackedEffect
L_02200c88:
    ldr r1, L_02200cbc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay017_SetCallbackDescriptor
L_02200c98:
    mov r0, r4
    bl Overlay017_UpdateScene
    mov r0, r4
    bl Overlay017_RenderScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200cb0: .word data_ov017_022016e0
L_02200cb4: .word 0x4114
L_02200cb8: .word 0x4115
L_02200cbc: .word data_ov017_02201550
    .size Overlay017_UpdateExitState, . - Overlay017_UpdateExitState
