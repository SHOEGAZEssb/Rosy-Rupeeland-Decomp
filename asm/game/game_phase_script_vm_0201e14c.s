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
.extern gGamePhaseRuntime
.global RuntimePresentationManager_BroadcastSlot1C
RuntimePresentationManager_BroadcastSlot1C: ; 0x0201e14c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    ldr r4, [r6, #0x4]
    b L_0201e178
L_0201e160:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e178:
    cmp r4, #0x0
    bne L_0201e160
    ldr r4, [r6, #0x14]
    b L_0201e1a0
L_0201e188:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e1a0:
    cmp r4, #0x0
    bne L_0201e188
    ldmia sp!, {r4, r5, r6, pc}


.size RuntimePresentationManager_BroadcastSlot1C, . - RuntimePresentationManager_BroadcastSlot1C
