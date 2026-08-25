    .text
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern data_ov013_021fece8
    .extern data_ov013_021fed38
    .extern data_ov013_021fed40
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern DisplayBrightness_IsSubTransitionComplete
    .extern SceneInputBase_Update
    .extern func_ov013_021fce04
    .extern Overlay013_PopulateScene
    .extern func_ov013_021fda40
    .extern Overlay013_UpdateSceneRuntime
    .extern gGameWork

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_phase_handlers.c. */
    .global Overlay013_UpdateSetupPhase

Overlay013_UpdateSetupPhase:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fe168
    cmp r1, #0x1
    beq L_021fe1d0
    b L_021fe268
L_021fe168:
    bl Overlay013_PopulateScene
    ldr r0, [r4, #0x97c]
    cmp r0, #0x0
    bne L_021fe180
    mov r0, r4
    bl func_ov013_021fda40
L_021fe180:
    ldr r0, L_021fe278
    ldr r1, L_021fe27c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r1, [r4, #0x84]
    mvnne r0, #0xff
    strne r0, [r1, #0x18]
    movne r0, #0x0
    strne r0, [r1, #0x1c]
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe268
L_021fe1d0:
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021fe1e4
    mov r1, #0x0
    bl SceneInputBase_Update
L_021fe1e4:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fe268
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_021fe268
    ldr r0, [r4, #0x974]
    cmp r0, #0x0
    beq L_021fe21c
    ldr r1, L_021fe280
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe268
L_021fe21c:
    ldr r0, L_021fe278
    ldr r1, L_021fe27c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fe258
    ldr r0, L_021fe278
    ldr r1, L_021fe27c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021fe284
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    b L_021fe268
L_021fe258:
    ldr r1, L_021fe288
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
L_021fe268:
    mov r0, r4
    bl Overlay013_UpdateSceneRuntime
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe278: .word gGameWork
L_021fe27c: .word 0x3bd
L_021fe280: .word data_ov013_021fece8
L_021fe284: .word data_ov013_021fed40
L_021fe288: .word data_ov013_021fed38
    .size Overlay013_UpdateSetupPhase, . - Overlay013_UpdateSetupPhase
