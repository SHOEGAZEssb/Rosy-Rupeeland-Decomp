.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern Heap_Alloc
.extern Overlay052Scene_Init
.extern Overlay052Scene_UpdateMessageMenu
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern data_020f3310
.extern gHeapContext

.global func_020a6320
func_020a6320:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl OverlayManager_GetGlobal
    ldr r2, .L_020a6384
    mov r1, #0x0
    bl OverlayManager_LoadOverlay
    ldr r1, .L_020a6388
    ldr r3, .L_020a638c
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020a6360
    mov r1, #0x0
    mov r2, r1
    bl Overlay052Scene_Init
.L_020a6360:
    str r0, [r4, #0x4a4]
    bl Overlay052Scene_UpdateMessageMenu
    mov r1, #0x0
    str r1, [r4, #0x4b8]
    str r1, [r4, #0x0]
    str r1, [r4, #0x8]
    mov r0, r4
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.L_020a6384: .word 0x34
.L_020a6388: .word data_020f3310
.L_020a638c: .word gHeapContext
.size func_020a6320, . - func_020a6320
