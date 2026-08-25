; Matching retail form; see src/game/presentation_base_teardown.c.
.text
.extern FieldEffect_DestroyBase
.global DisplayFadePresentation_Destroy
    .type DisplayFadePresentation_Destroy, @function
DisplayFadePresentation_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size DisplayFadePresentation_Destroy, .-DisplayFadePresentation_Destroy
