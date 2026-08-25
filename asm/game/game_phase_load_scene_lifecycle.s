; Matching retail form; see src/game/game_phase_load_scene_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern Heap_Free
.extern Scene_Destroy
.extern Scene_Init
.extern Scene_SetFlags03
.extern gGamePhaseLoadSceneVTable
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern func_02092364
.extern func_020923a0
.extern gGamePhaseCurrencyHud

    .global GamePhaseLoadScene_Init
GamePhaseLoadScene_Init: ; 0x0200cf00
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl Scene_Init
    ldr r1, L_0200cfa4
    add r0, r4, #0x40
    str r1, [r4, #0x0]
    bl func_02092364
    add r0, r4, #0x74
    bl OverlaySlot_Init
    add r0, r4, #0x80
    bl OverlaySlot_Init
    add r0, r4, #0x8c
    bl OverlaySlot_Init
    mov r0, #0x9
    str r0, [r4, #0x4]
    str r6, [r4, #0x2c]
    str r5, [r4, #0x30]
    mov r1, #0x0
    str r1, [r4, #0x24]
    str r1, [r4, #0x28]
    str r1, [r4, #0x38]
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x3c]
    bl Scene_SetFlags03
    ldr r0, L_0200cfa8
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0xb0]
    tst r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    ldr r0, L_0200cfac
    str r1, [r4, #0x34]
    ldrh r1, [r0, #0x0]
    mov r0, r4
    and r1, r1, #0x8000
    mov r1, r1, asr #0xf
    str r1, [r4, #0x98]
    ldmia sp!, {r4, r5, r6, pc}
L_0200cfa4: .word gGamePhaseLoadSceneVTable
L_0200cfa8: .word gGamePhaseCurrencyHud
L_0200cfac: .word 0x4000304
    .size GamePhaseLoadScene_Init, . - GamePhaseLoadScene_Init

    .global GamePhaseLoadScene_Destroy
GamePhaseLoadScene_Destroy: ; 0x0200cfb0
    stmdb sp!, {r4, lr}
    ldr r1, L_0200d010
    mov r4, r0
    str r1, [r4, #0x0]
    mov r0, #0x0
    str r0, [r4, #0x38]
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0200cfe0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_0200cfe0:
    add r0, r4, #0x8c
    bl OverlaySlot_Destroy
    add r0, r4, #0x80
    bl OverlaySlot_Destroy
    add r0, r4, #0x74
    bl OverlaySlot_Destroy
    add r0, r4, #0x40
    bl func_020923a0
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200d010: .word gGamePhaseLoadSceneVTable
    .size GamePhaseLoadScene_Destroy, . - GamePhaseLoadScene_Destroy

    .global GamePhaseLoadScene_FreeStorage
GamePhaseLoadScene_FreeStorage: ; 0x0200d014
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseLoadScene_FreeStorage, . - GamePhaseLoadScene_FreeStorage

    .global GamePhaseLoadScene_DestroyAndFree
GamePhaseLoadScene_DestroyAndFree: ; 0x0200d028
    stmdb sp!, {r4, lr}
    ldr r1, L_0200d090
    mov r4, r0
    str r1, [r4, #0x0]
    mov r0, #0x0
    str r0, [r4, #0x38]
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0200d058
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_0200d058:
    add r0, r4, #0x8c
    bl OverlaySlot_Destroy
    add r0, r4, #0x80
    bl OverlaySlot_Destroy
    add r0, r4, #0x74
    bl OverlaySlot_Destroy
    add r0, r4, #0x40
    bl func_020923a0
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200d090: .word gGamePhaseLoadSceneVTable
    .size GamePhaseLoadScene_DestroyAndFree, . - GamePhaseLoadScene_DestroyAndFree
