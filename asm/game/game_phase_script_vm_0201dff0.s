; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern func_020a2324
.extern func_020a2348
.extern func_020a23a8
.extern GX_SetGraphicsMode
.extern gFieldEffectListVtable
.extern data_021052fc
.global RuntimePresentationManager_NotifyScreenModeChanged
RuntimePresentationManager_NotifyScreenModeChanged: ; 0x0201dff0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    ldr r4, [r6, #0x4]
    b L_0201e01c
L_0201e004:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x14]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e01c:
    cmp r4, #0x0
    bne L_0201e004
    ldr r4, [r6, #0x14]
    b L_0201e044
L_0201e02c:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x14]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e044:
    cmp r4, #0x0
    bne L_0201e02c
    ldmia sp!, {r4, r5, r6, pc}


.size RuntimePresentationManager_NotifyScreenModeChanged, . - RuntimePresentationManager_NotifyScreenModeChanged
