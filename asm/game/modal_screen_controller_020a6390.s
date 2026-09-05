.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern OverlayManager_GetGlobal
.extern OverlayManager_UnloadOverlay

.global func_020a6390
func_020a6390:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4a4]
    cmp r0, #0x0
    beq .L_020a63c8
    beq .L_020a63b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020a63b4:
    mov r0, #0x0
    str r0, [r4, #0x4a4]
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    bl OverlayManager_UnloadOverlay
.L_020a63c8:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_020a6390, . - func_020a6390
