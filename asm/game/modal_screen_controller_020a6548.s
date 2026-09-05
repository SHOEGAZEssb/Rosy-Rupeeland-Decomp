.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern GXx_SetMasterBrightness_
.extern Overlay052Scene_LoadSubScreenResources
.extern gDisplayBrightnessPair

.global func_020a6548
func_020a6548:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_020a659c
    mvn r1, #0xf
    bl GXx_SetMasterBrightness_
    mov r0, #0x2
    str r0, [r4, #0x8]
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x4a4]
    bl Overlay052Scene_LoadSubScreenResources
    mov r2, #0x0
    ldr r0, .L_020a65a0
    mov r1, #0x1
    str r2, [r4, #0x0]
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0xa
    bl DisplayBrightness_StartTransition
    ldmia sp!, {r4, pc}
.L_020a659c: .word 0x400106c
.L_020a65a0: .word gDisplayBrightnessPair
.size func_020a6548, . - func_020a6548
