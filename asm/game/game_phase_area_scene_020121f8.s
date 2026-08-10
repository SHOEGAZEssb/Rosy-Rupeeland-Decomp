; Matching retail form; see src/game/game_phase_area_scene_controls.c.
.text
.extern GXS_SetGraphicsMode
.extern GX_SetBankForSubBG
.extern GamePhaseAreaScene_SetEnabled
.extern func_020aea7c
.extern func_ov056_0220ee78

    .global GamePhaseAreaScene_RestoreSubDisplay
GamePhaseAreaScene_RestoreSubDisplay: ; 0x020121f8
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x4
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02012254
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x20]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
L_02012254:
    add r0, r4, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    beq L_0201228c
    bl func_ov056_0220ee78
    ldr r1, L_0201229c
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
L_0201228c:
    mov r0, r4
    mov r1, #0x1
    bl GamePhaseAreaScene_SetEnabled
    ldmia sp!, {r4, pc}
L_0201229c: .word 0x400100c
    .size GamePhaseAreaScene_RestoreSubDisplay, . - GamePhaseAreaScene_RestoreSubDisplay

