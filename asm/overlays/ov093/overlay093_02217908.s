.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov093_022187f0
.extern data_ov093_022189e0
.extern AnimationResource_Init
.extern GraphicsSpriteState_Configure
.extern GraphicsSpriteState_Create
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern Type7Actor_SetActorEnabled
.extern func_0204d3d8
.extern GraphicsSpriteGroup_CreateState
.extern gHeapContext

.global func_ov093_02217908
func_ov093_02217908:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0204d3d8
    ldr r1, .L_02217ac0
    ldr r3, .L_02217ac4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217944
    ldr r1, .L_02217ac8
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02217944:
    mov r5, r0
    str r0, [r4, #0x200]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, #0x1
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    mov r1, #0x0
    str r0, [r4, #0x204]
    mov r0, #0x6
    stmia sp, {r0, r1}
    ldr r0, [r4, #0x204]
    mov r2, r1
    mov r3, r1
    bl GraphicsSpriteState_Configure
    ldr r1, .L_02217ac0
    ldr r3, .L_02217ac4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022179b4
    ldr r1, .L_02217acc
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_022179b4:
    str r0, [r4, #0x20c]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r3, #0x0
    str r3, [sp, #0x0]
    mov r1, #0x6
    stmib sp, {r1, r3}
    ldr r1, [r4, #0x20c]
    mov r2, #0x1
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x210]
    mov r0, r4
    ldr r5, [r4, #0x200]
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, #0x1
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x208]
    mov r0, #0x6
    mov r2, #0x0
    str r0, [sp, #0x0]
    str r2, [sp, #0x4]
    ldr r0, [r4, #0x208]
    mov r1, #0x1
    mov r3, r2
    bl GraphicsSpriteState_Configure
    ldr r0, .L_02217ad0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02217a48
    mov r1, #0x0
    bl Type7Actor_SetActorEnabled
.L_02217a48:
    mov r9, #0x0
    ldr r7, .L_02217ad4
    mov r8, #0x1
    mov r6, #0x6
    mov r11, r9
    mov r5, #0x14
.L_02217a60:
    ldr r10, [r4, #0x200]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    str r8, [sp, #0x0]
    ldmib r10, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    add r1, r4, r9, lsl #0x2
    str r0, [r1, #0x214]
    stmia sp, {r6, r11}
    mla r10, r9, r5, r7
    ldr r0, [r1, #0x214]
    ldr r1, [r10, #0x10]
    mov r2, r11
    mov r3, r11
    bl GraphicsSpriteState_Configure
    add r0, r4, r9, lsl #0x2
    ldr r1, [r10, #0x4]
    add r9, r9, #0x1
    str r1, [r0, #0x228]
    cmp r9, #0x5
    blt .L_02217a60
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217ac0: .word data_ov093_022189e0
.L_02217ac4: .word gHeapContext
.L_02217ac8: .word 0x23a8
.L_02217acc: .word 0x10a6
.L_02217ad0: .word data_021052fc
.L_02217ad4: .word data_ov093_022187f0
.size func_ov093_02217908, . - func_ov093_02217908
