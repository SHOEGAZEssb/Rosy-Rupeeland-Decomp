; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern Graphics3dPresentation_Clear
.extern Graphics3dPresentation_Disable
.extern Graphics3dPresentation_Enable
.extern GX_SetGraphicsMode
.extern gFieldEffectListVtable
.extern data_021052fc
.global FieldEffectList_DestroyAndFree
FieldEffectList_DestroyAndFree: ; 0x0201e228
    stmdb sp!, {r4, lr}
    ldr r1, L_0201e24c
    mov r4, r0
    str r1, [r4, #0x0]
    bl FieldEffectList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201e24c: .word gFieldEffectListVtable


.size FieldEffectList_DestroyAndFree, . - FieldEffectList_DestroyAndFree
