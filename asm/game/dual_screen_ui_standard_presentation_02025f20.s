; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern data_020d6b04
.extern DebugSpriteText_Init
.extern func_02025a44
.extern func_02025d1c
.extern func_02025dd8
.extern func_02025e88
.extern func_02025ed4
.extern func_02026174
.extern GamePhaseMetadata_IsAreaBehaviorPermitted

    .global func_02025f20
    .type func_02025f20, @function
func_02025f20: ; 0x02025f20
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_02025a44
    ldr r1, .L_02025fc0
    add r0, r4, #0xc8
    str r1, [r4, #0x0]
    bl DebugSpriteText_Init
    mov r0, #0x1
    str r0, [r4, #0xd0]
    ldr r1, [r4, #0xc4]
    mov r0, r5
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0xc4]
    bl GamePhaseMetadata_IsAreaBehaviorPermitted
    ldr r1, [r4, #0xc4]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x2
    orr r1, r1, r0, lsr #0x1e
    mov r0, r4
    str r1, [r4, #0xc4]
    bl func_02025e88
    mov r0, r4
    bl func_02025ed4
    mov r0, r4
    bl func_02025d1c
    mov r0, r4
    bl func_02025dd8
    mov r0, r4
    ldr r1, [r4, #0xac]
    bl func_02026174
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x1f
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02025fc0: .word data_020d6b04
    .size func_02025f20, . - func_02025f20
