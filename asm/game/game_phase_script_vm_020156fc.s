; Matching retail form; see src/game/game_phase_script_vm_debug_object_opcodes.c.
.text
.extern Heap_Alloc
.extern data_020d5b2c
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern func_0201d9e4
.extern func_0201da20
.extern Actor_GetCollection
.extern func_ov059_0220fd20
.extern gHeapContext

    .global GamePhaseActorScriptVm_CreateOverlay61DebugObject
GamePhaseActorScriptVm_CreateOverlay61DebugObject: ; 0x020156fc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r5, #0x84]
    bl Actor_GetCollection
    mov r1, r4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    bl func_0201da20
    mov r5, r0
    mov r0, r6
    bl func_0201d9e4
    mov r4, r0
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    ldr r2, L_02015790
    bl OverlayManager_LoadOverlay
    mov r0, #0x3c
    ldr r1, L_02015794
    mov r2, #0x4
    ldr r3, L_02015798
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02015788
    mov r1, r4
    mov r2, r5
    mov r3, r7
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, Overlay064Scene_Construct, func_ov065_0220fd20, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
L_02015788:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02015790: .word 0x3d
L_02015794: .word data_020d5b2c
L_02015798: .word gHeapContext
    .size GamePhaseActorScriptVm_CreateOverlay61DebugObject, . - GamePhaseActorScriptVm_CreateOverlay61DebugObject

