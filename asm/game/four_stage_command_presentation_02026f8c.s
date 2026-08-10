; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern func_0201e28c

    .global FourStageCommandPresentation_Destroy
    .type FourStageCommandPresentation_Destroy, @function
FourStageCommandPresentation_Destroy: ; 0x02026f8c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size FourStageCommandPresentation_Destroy, . - FourStageCommandPresentation_Destroy
