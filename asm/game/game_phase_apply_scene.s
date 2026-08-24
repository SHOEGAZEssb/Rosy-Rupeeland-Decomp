; Matching retail form; see src/game/game_phase_apply_scene.c for the
; documented portable implementation and recovered behavior.
.text
.extern Heap_Free
.extern Scene_Destroy
.extern Scene_Init
.extern data_020d5384
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_CreateSecondaryActorSubsystem
.extern GamePhaseRuntime_DestroySecondaryActorSubsystem
.extern GamePhaseRuntime_RefreshAreaAuxiliaryObject
.extern GamePhaseAreaScene_SetEnabled
.extern ActorDescriptorBatch_ApplyCategoryCallback

.global GamePhaseApplyScene_Init
GamePhaseApplyScene_Init:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl Scene_Init
    ldr r1, L_0200c8f0
    mov r0, r7
    str r1, [r7, #0x0]
    str r6, [r7, #0x24]
    str r5, [r7, #0x28]
    str r4, [r7, #0x2c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0200c8f0: .word data_020d5384
.size GamePhaseApplyScene_Init, . - GamePhaseApplyScene_Init

.global GamePhaseApplyScene_Destroy
GamePhaseApplyScene_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size GamePhaseApplyScene_Destroy, . - GamePhaseApplyScene_Destroy

.global GamePhaseApplyScene_DestroyAndFree
GamePhaseApplyScene_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size GamePhaseApplyScene_DestroyAndFree, . - GamePhaseApplyScene_DestroyAndFree

.global GamePhaseApplyScene_Update
GamePhaseApplyScene_Update:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200c94c
    cmp r0, #0x1
    beq L_0200c954
    cmp r0, #0x2
    beq L_0200c970
    b L_0200c9f0
L_0200c94c:
    add r0, r0, #0x1
    str r0, [r4, #0x8]
L_0200c954:
    ldr r0, L_0200c9f8
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_DestroySecondaryActorSubsystem
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b L_0200c9f0
L_0200c970:
    ldr r0, L_0200c9f8
    ldr r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_CreateSecondaryActorSubsystem
    ldr r0, L_0200c9f8
    ldr r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_RefreshAreaAuxiliaryObject
    ldr r0, L_0200c9f8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    cmp r4, #0x0
    beq L_0200c9c8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200c9c8:
    ldr r1, L_0200c9f8
    mov r0, #0x1
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldrb r2, [r1, #0xcc]
    bic r2, r2, #0x8
    strb r2, [r1, #0xcc]
    bl ActorDescriptorBatch_ApplyCategoryCallback
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0200c9f0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200c9f8: .word gGamePhaseRuntime
.size GamePhaseApplyScene_Update, . - GamePhaseApplyScene_Update
