.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern Heap_Free
.extern SceneManager_SetUpdateEnabled
.extern Scene_Destroy
.extern data_ov059_02211b7c
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern DebugSpriteText_Destroy
.extern SplineMover_Destroy
.extern func_0201140c
.extern func_ov059_02210968
.extern func_ov059_02210ba4
.extern gLupyContext
.extern gSceneManager

.global func_ov059_022111d4
func_ov059_022111d4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02211270
    mov r5, r0
    ldr r0, .L_02211274
    str r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_0201140c
    ldr r4, [r5, #0x3c]
    cmp r4, #0x0
    beq .L_02211210
    mov r0, r4
    bl func_ov059_02210ba4
    mov r0, r4
    bl Heap_Free
.L_02211210:
    ldr r4, [r5, #0x48]
    cmp r4, #0x0
    beq .L_0221122c
    mov r0, r4
    bl func_ov059_02210968
    mov r0, r4
    bl Heap_Free
.L_0221122c:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    ldr r0, .L_02211278
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl SceneManager_SetUpdateEnabled
    add r0, r5, #0x54
    bl SplineMover_Destroy
    add r0, r5, #0x40
    bl DebugSpriteText_Destroy
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02211270: .word data_ov059_02211b7c
.L_02211274: .word gLupyContext
.L_02211278: .word gSceneManager
.size func_ov059_022111d4, . - func_ov059_022111d4
