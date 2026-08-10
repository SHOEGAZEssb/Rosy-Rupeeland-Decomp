.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov073_02210be4
.extern data_ov073_02210c0c
.extern data_ov073_02210c14
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern AnimationResource_Init
.extern GamePhaseRuntime_GetActorCollection
.extern func_0201e250
.extern AuxiliaryTimedSpritePresentation_Init
.extern ActorCollection_GetSpriteOwner
.extern func_ov073_022100b4
.extern gHeapContext

.global func_ov073_02210710
func_ov073_02210710:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r9, r0
    mov r4, r1
    mov r8, r2
    mov r7, r3
    ldr r6, [sp, #0x48]
    ldr r5, [sp, #0x60]
    bl func_0201e250
    ldr r1, .L_022108e8
    ldrsh r0, [sp, #0x58]
    str r1, [r9, #0x0]
    str r4, [r9, #0x10]
    strh r0, [r9, #0x18]
    mov r0, #0x0
    strh r0, [r9, #0x1a]
    cmp r5, #0x0
    bne .L_022107e4
    add r0, sp, #0x1c
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl VecFx32Object_InitComponents
    ldr r1, .L_022108ec
    ldr r3, .L_022108f0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_022107dc
    ldr r0, .L_022108f4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldr r3, .L_022108f8
    mov r2, r0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    sub r1, r1, #0x4
    str r1, [sp, #0xc]
    mov r1, #0x1
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    mov r0, r4
    sub r3, r3, #0x1
    add r1, sp, #0x1c
    bl AuxiliaryTimedSpritePresentation_Init
.L_022107dc:
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
.L_022107e4:
    ldr r1, .L_022108fc
    ldr r3, .L_022108f0
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210810
    ldr r1, [sp, #0x4c]
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    bl AnimationResource_Init
.L_02210810:
    ldr r1, .L_022108fc
    str r0, [r9, #0x14]
    cmp r5, #0x0
    ldr r3, .L_022108f0
    mov r0, #0x40
    mov r2, #0x4
    addeq r6, r6, #0x30000
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210878
    ldrsh r2, [sp, #0x58]
    str r6, [sp, #0x0]
    mov r1, #0x20000
    str r1, [sp, #0x4]
    ldr r1, [sp, #0x5c]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    str r5, [sp, #0x10]
    mov r1, #0x6
    str r1, [sp, #0x14]
    mov r1, #0x0
    str r1, [sp, #0x18]
    ldr r1, [r9, #0x14]
    mov r2, r8
    mov r3, r7
    bl func_ov073_022100b4
.L_02210878:
    ldr r1, .L_022108fc
    str r0, [r9, #0x8]
    ldr r3, .L_022108f0
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022108d8
    ldrsh r2, [sp, #0x58]
    str r6, [sp, #0x0]
    mov r1, #0x18000
    str r1, [sp, #0x4]
    ldr r1, [sp, #0x5c]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    str r5, [sp, #0x10]
    mov r1, #0x4
    str r1, [sp, #0x14]
    mov r1, #0x1
    str r1, [sp, #0x18]
    ldr r1, [r9, #0x14]
    mov r2, r8
    mov r3, r7
    bl func_ov073_022100b4
.L_022108d8:
    str r0, [r9, #0xc]
    mov r0, r9
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_022108e8: .word data_ov073_02210be4
.L_022108ec: .word data_ov073_02210c0c
.L_022108f0: .word gHeapContext
.L_022108f4: .word data_021052fc
.L_022108f8: .word 0x1645
.L_022108fc: .word data_ov073_02210c14
.size func_ov073_02210710, . - func_ov073_02210710
