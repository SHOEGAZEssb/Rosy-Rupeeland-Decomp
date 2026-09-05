.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.
.extern GameWork_SetFlag
.extern Graphics3dPresentation_Clear
.extern Heap_Free
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Scene_Destroy
.extern data_020f311c
.extern data_020f4e14
.extern func_0209e198
.extern func_020a6390
.extern gGamePhaseRuntime
.extern gGameWork

.global func_0209d9c8
func_0209d9c8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0209da70
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r5, [r4, #0x24]
    cmp r5, #0x0
    beq .L_0209d9f4
    mov r0, r5
    bl func_0209e198
    mov r0, r5
    bl Heap_Free
.L_0209d9f4:
    mov r1, #0x0
    ldr r0, .L_0209da74
    str r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    bl Graphics3dPresentation_Clear
    ldr r0, .L_0209da78
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_0209da7c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x38]
    ldr r5, [r4, #0x34]
    cmp r5, #0x0
    beq .L_0209da50
    mov r0, r5
    bl func_020a6390
    mov r0, r5
    bl Heap_Free
.L_0209da50:
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x34]
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0209da70: .word data_020f311c
.L_0209da74: .word gGamePhaseRuntime
.L_0209da78: .word gGameWork
.L_0209da7c: .word data_020f4e14
.size func_0209d9c8, . - func_0209d9c8
