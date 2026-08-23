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
.global func_0201e054
func_0201e054: ; 0x0201e054
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    ldr r4, [r6, #0x4]
    b L_0201e080
L_0201e068:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e080:
    cmp r4, #0x0
    bne L_0201e068
    ldr r4, [r6, #0x14]
    b L_0201e0a8
L_0201e090:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r4, [r4, #0x0]
L_0201e0a8:
    cmp r4, #0x0
    bne L_0201e090
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    ldrneb r1, [r0, #0x50a]
    cmpne r1, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    mov r1, #0x0
    beq L_0201e0dc
    mov r2, #0x1
    bl func_020a23a8
    ldmia sp!, {r4, r5, r6, pc}
L_0201e0dc:
    mov r2, r1
    bl func_020a2348
    ldmia sp!, {r4, r5, r6, pc}


.size func_0201e054, . - func_0201e054
