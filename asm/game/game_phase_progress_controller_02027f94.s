; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern __register_global_object
.extern data_02105634
.extern data_02105638
.extern data_02105644
.extern GamePhaseProgressController_Init
.extern GamePhaseProgressController_Destroy

    .global GamePhaseProgress_GetOrCreateGlobal
    .type GamePhaseProgress_GetOrCreateGlobal, @function
GamePhaseProgress_GetOrCreateGlobal: ; 0x02027f94
    stmdb sp!, {r3, lr}
    ldr r0, .L_02027fd8
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_02027fd0
    ldr r0, .L_02027fdc
    bl GamePhaseProgressController_Init
    ldr r0, .L_02027fdc
    ldr r1, .L_02027fe0
    ldr r2, .L_02027fe4
    bl __register_global_object
    ldr r0, .L_02027fd8
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_02027fd0:
    ldr r0, .L_02027fdc
    ldmia sp!, {r3, pc}
.L_02027fd8: .word data_02105634
.L_02027fdc: .word data_02105644
.L_02027fe0: .word GamePhaseProgressController_Destroy
.L_02027fe4: .word data_02105638
    .size GamePhaseProgress_GetOrCreateGlobal, . - GamePhaseProgress_GetOrCreateGlobal

