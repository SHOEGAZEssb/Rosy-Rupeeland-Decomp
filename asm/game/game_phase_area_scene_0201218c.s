; Matching retail form; see src/game/game_phase_area_scene_runtime.c.
.text
.extern func_ov056_0220ed9c

    .global GamePhaseAreaScene_Update
GamePhaseAreaScene_Update: ; 0x0201218c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2000
    ldr r0, [r0, #0xea8]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_020121d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
L_020121d0:
    add r0, r4, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    beq L_020121e4
    bl func_ov056_0220ed9c
L_020121e4:
    ldr r0, L_020121f4
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_020121f4: .word 0x5000400
    .size GamePhaseAreaScene_Update, . - GamePhaseAreaScene_Update

