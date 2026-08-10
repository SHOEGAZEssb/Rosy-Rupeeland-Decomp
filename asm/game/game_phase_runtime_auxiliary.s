; Matching retail form; see src/game/game_phase_runtime_auxiliary.c for
; the documented portable implementation and recovered behavior.
.text
.extern gGamePhaseAreaAuxiliaryObjectAllocationTag
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern GamePhaseRuntime_InitScaledAreaCoordinates
.extern GamePhaseAreaScene_SetOverlayObject
.extern func_0202844c
.extern func_0202852c
.extern func_ov054_0220e400
.extern func_ov056_0220e79c
.extern func_ov056_0220f054
.extern gHeapContext
.extern GX_VBlankIntr
.extern Heap_Alloc
.extern Heap_Free

    .global GamePhaseRuntime_RefreshAreaAuxiliaryObject
.type GamePhaseRuntime_RefreshAreaAuxiliaryObject, @function
GamePhaseRuntime_RefreshAreaAuxiliaryObject:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r0, #0x0
    mov r5, r1
    mov r4, r2
    bl GX_VBlankIntr
    add r0, r6, #0x3000
    ldr r7, [r0, #0xec]
    cmp r7, #0x0
    beq L_02008c10
    beq L_02008bf8
    mov r0, r7
    bl func_ov056_0220e79c
    mov r0, r7
    bl Heap_Free
L_02008bf8:
    mov r1, #0x0
    add r0, r6, #0x3000
    str r1, [r0, #0xec]
    add r0, r6, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetOverlayObject
L_02008c10:
    ldr r0, [r5, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne L_02008cd4
    mov r0, r5
    bl func_0202844c
    cmp r0, #0x0
    beq L_02008cd4
    ldr r2, L_02008ce4
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bl OverlayManager_GetGlobal
    ldr r2, L_02008ce8
    mov r1, #0x1
    bl OverlayManager_LoadOverlay
    ldrsb r0, [r5, #0x4c]
    bl func_0202852c
    mov r7, r0
    ldr r0, L_02008cec
    ldr r1, L_02008cf0
    mov r2, #0x4
    ldr r3, L_02008cf4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02008c9c
    mov r1, r7
    mov r2, r4
    bl func_ov054_0220e400 ; func_ov055_0220e400, func_ov056_0220e400, func_ov057_0220e400, func_ov058_0220e400
L_02008c9c:
    add r1, r6, #0x3000
    str r0, [r1, #0xec]
    add r0, r6, #0x2000
    ldr r0, [r0, #0xfb8]
    ldr r1, [r1, #0xec]
    bl GamePhaseAreaScene_SetOverlayObject
    add r0, sp, #0x0
    mov r1, r6
    mov r2, r5
    bl GamePhaseRuntime_InitScaledAreaCoordinates
    add r0, r6, #0x3000
    ldr r0, [r0, #0xec]
    add r1, sp, #0x0
    bl func_ov056_0220f054
L_02008cd4:
    mov r0, #0x1
    bl GX_VBlankIntr
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_02008ce4: .word 0x4001000
L_02008ce8: .word 0x38
L_02008cec: .word 0x8ac
L_02008cf0: .word gGamePhaseAreaAuxiliaryObjectAllocationTag
L_02008cf4: .word gHeapContext
    .size GamePhaseRuntime_RefreshAreaAuxiliaryObject, .-GamePhaseRuntime_RefreshAreaAuxiliaryObject

