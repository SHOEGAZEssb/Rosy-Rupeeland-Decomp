; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern Heap_Free
.extern data_020d6b20
.extern AnimationBinding_Destroy
.extern DebugSpriteText_Destroy
.extern DualScreenUiPresentationBase_DestroyAlternateEntry

    .global DualScreenUiIndexedIconPresentation_Destroy
    .type DualScreenUiIndexedIconPresentation_Destroy, @function
DualScreenUiIndexedIconPresentation_Destroy: ; 0x02026308
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0202634c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0xd0]
    cmp r4, #0x0
    beq .L_02026334
    mov r0, r4
    bl AnimationBinding_Destroy
    mov r0, r4
    bl Heap_Free
.L_02026334:
    add r0, r5, #0xc8
    bl DebugSpriteText_Destroy
    mov r0, r5
    bl DualScreenUiPresentationBase_DestroyAlternateEntry
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0202634c: .word data_020d6b20
    .size DualScreenUiIndexedIconPresentation_Destroy, . - DualScreenUiIndexedIconPresentation_Destroy
