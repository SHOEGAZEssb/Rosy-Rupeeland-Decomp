.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern Overlay052Scene_SetMessageById
.extern Overlay052Scene_UpdateMessageMenu
.extern func_020a65a4
.extern gDisplayBrightnessPair

.global func_020a681c
func_020a681c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x4a8]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_020a6894
    ldr r0, [r4, #0x4a4]
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_020a6858
    tst r2, #0x100
    beq .L_020a6894
.L_020a6858:
    and r1, r2, #0xff
    add r1, r1, #0x2
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl Overlay052Scene_SetMessageById
    mov r2, #0x0
.L_020a6874:
    add r1, r4, r2, lsl #0x2
    ldr r0, [r1, #0x4ac]
    add r2, r2, #0x1
    str r0, [r1, #0x4a8]
    cmp r2, #0x3
    blt .L_020a6874
    mvn r0, #0x0
    str r0, [r4, #0x4b4]
.L_020a6894:
    ldr r0, [r4, #0x4a4]
    bl Overlay052Scene_UpdateMessageMenu
    cmp r0, #0x1
    ldreq r0, [r4, #0x4b8]
    cmpeq r0, #0x0
    bne .L_020a68cc
    ldr r0, .L_020a68d8
    mov r1, #0x1
    str r1, [r4, #0x4b8]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
.L_020a68cc:
    mov r0, r4
    bl func_020a65a4
    ldmia sp!, {r4, pc}
.L_020a68d8: .word gDisplayBrightnessPair
.size func_020a681c, . - func_020a681c
