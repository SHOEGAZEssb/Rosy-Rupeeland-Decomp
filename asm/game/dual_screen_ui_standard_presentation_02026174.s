; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern DebugSpriteText_SetTextResource
.extern GamePhaseMetadata_GetTextResourceId
.extern GamePhaseMetadata_IsAreaBehaviorPermitted

    .global func_02026174
    .type func_02026174, @function
func_02026174: ; 0x02026174
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    mov r0, r4
    str r4, [r5, #0xac]
    bl GamePhaseMetadata_IsAreaBehaviorPermitted
    ldr r1, [r5, #0xc4]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x2
    orr r1, r1, r0, lsr #0x1e
    mov r0, r4
    str r1, [r5, #0xc4]
    bl GamePhaseMetadata_GetTextResourceId
    mov r1, r0, lsl #0x10
    add r0, r5, #0xc8
    mov r1, r1, lsr #0x10
    bl DebugSpriteText_SetTextResource
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02026174, . - func_02026174
