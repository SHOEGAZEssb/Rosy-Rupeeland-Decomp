; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global FourStageCommandPresentation_Destroy
    .type FourStageCommandPresentation_Destroy, @function
FourStageCommandPresentation_Destroy: ; 0x02026f8c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size FourStageCommandPresentation_Destroy, . - FourStageCommandPresentation_Destroy
