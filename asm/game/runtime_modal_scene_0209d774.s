.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern GX_SetGraphicsMode
.extern GameWork_SetFlag
.extern Graphics3dPresentation_LoadResourceProfile
.extern Heap_Alloc
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Scene_Init
.extern Scene_SetFlags03
.extern Sound_StopAllDirectSequences
.extern data_020f311c
.extern data_020f3148
.extern data_020f3150
.extern data_020f4e14
.extern func_0209d758
.extern func_0209def4
.extern func_020a6320
.extern gDisplayBrightnessPair
.extern gGamePhaseRuntime
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

.global func_0209d774
func_0209d774:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Scene_Init
    ldr r1, .L_0209d8ec
    ldr r0, .L_0209d8f0
    str r1, [r5, #0x0]
    str r4, [r5, #0x28]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    cmp r4, #0x2
    beq .L_0209d7b8
    mov r1, #0x0
    bl Graphics3dPresentation_LoadResourceProfile
    b .L_0209d7c0
.L_0209d7b8:
    mov r1, #0x6
    bl Graphics3dPresentation_LoadResourceProfile
.L_0209d7c0:
    mov r0, #0x0
    bl func_0209d758
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    mov ip, #0x4000000
    ldr r1, [ip, #0x0]
    ldr r0, .L_0209d8f4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1d00
    str r1, [ip, #0x0]
    ldrh r3, [ip, #0x8]
    ldr r1, .L_0209d8f8
    mov r2, #0x4
    bic r3, r3, #0x3
    strh r3, [ip, #0x8]
    ldr r3, .L_0209d8fc
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209d818
    bl func_020a6320
.L_0209d818:
    ldr r1, .L_0209d900
    str r0, [r5, #0x34]
    ldr r3, .L_0209d8fc
    mov r0, #0xc8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209d844
    mov r1, r5
    mov r2, r4
    bl func_0209def4
.L_0209d844:
    str r0, [r5, #0x24]
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    beq .L_0209d88c
    mov r0, r5
    bl Scene_SetFlags03
    ldr r0, .L_0209d8f0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_0209d904
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x38]
.L_0209d88c:
    ldr r0, .L_0209d908
    ldr r1, .L_0209d90c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_0209d910
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0209d910
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0209d914
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_StopAllDirectSequences
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0209d8ec: .word data_020f311c
.L_0209d8f0: .word gGamePhaseRuntime
.L_0209d8f4: .word 0x4bc
.L_0209d8f8: .word data_020f3148
.L_0209d8fc: .word gHeapContext
.L_0209d900: .word data_020f3150
.L_0209d904: .word data_020f4e14
.L_0209d908: .word gGameWork
.L_0209d90c: .word 0x386
.L_0209d910: .word gDisplayBrightnessPair
.L_0209d914: .word gSoundContext
.size func_0209d774, . - func_0209d774
