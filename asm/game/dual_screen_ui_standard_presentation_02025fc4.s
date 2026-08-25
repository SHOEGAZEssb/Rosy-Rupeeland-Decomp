; Matching retail form; see src/game/dual_screen_ui_standard_presentation.c.
.text
.extern DebugSpriteText_Destroy
.extern DualScreenUiPresentationBase_DestroyAlternateEntry

    .global func_02025fc4
    .type func_02025fc4, @function
func_02025fc4: ; 0x02025fc4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc8
    bl DebugSpriteText_Destroy
    mov r0, r4
    bl DualScreenUiPresentationBase_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02025fc4, . - func_02025fc4
