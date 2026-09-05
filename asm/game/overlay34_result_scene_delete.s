.text
; Matching fallback for the portable implementation in src/game/overlay34_runtime_scene.c.
.extern ActorCollection_DispatchType2ThresholdEffects
.extern Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
.extern Heap_Free
.extern PresentationBackedActor_SpawnSplitAmount
.extern PresentationBackedActor_SpawnTripleVariant
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Scene_Destroy
.extern Type7Actor_FindAuxiliaryRecord
.extern VecFx32Object_Destroy
.extern VecFx32Object_InitCopy
.extern data_020e58c4
.extern func_0206e590
.extern gGamePhaseRuntime

.global Overlay34ResultScene_Delete
Overlay34ResultScene_Delete:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r1, .L_0206f17c
    mov r4, r0
    mov r0, #0x0
    str r1, [r4, #0x0]
    bl ActorCollection_DispatchType2ThresholdEffects
    ldr r0, .L_0206f180
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x26c]
    cmp r0, #0x0
    beq .L_0206f160
    mov r1, #0x1
    bl func_0206e590
    ldr r1, .L_0206f180
    add r0, sp, #0x4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, .L_0206f180
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x8
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x10]
    ldr ip, [sp, #0xc]
    mov r3, r2, asr #0xc
    ldr r2, [sp, #0x8]
    mov r1, #0x1
    mov r2, r2, asr #0xc
    rsb r3, r3, ip, asr #0xc
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    mvnlt r1, #0x0
    mullt r1, r0, r1
    movlt r5, #0x1
    movlt r0, r1
    movge r5, #0x0
    bl Type7Actor_FindAuxiliaryRecord
    cmp r5, #0x0
    ldrneh r1, [r0, #0x14]
    ldreqh r1, [r0, #0x16]
    cmp r1, #0x0
    ble .L_0206f158
    ldr r0, [sp, #0x10]
    cmp r1, #0x3e8
    add r0, r0, #0x20000
    str r0, [sp, #0x10]
    add r2, sp, #0x4
    bgt .L_0206f150
    mov r0, r1, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, #0x12c
    bl PresentationBackedActor_SpawnSplitAmount
    b .L_0206f158
.L_0206f150:
    mov r0, #0x12c
    bl PresentationBackedActor_SpawnTripleVariant
.L_0206f158:
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
.L_0206f160:
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0206f17c: .word data_020e58c4
.L_0206f180: .word gGamePhaseRuntime
.size Overlay34ResultScene_Delete, . - Overlay34ResultScene_Delete
