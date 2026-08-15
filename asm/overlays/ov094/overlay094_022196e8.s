.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_ov094_02219c28
.extern data_ov094_02219f14
.extern data_ov094_02219f1c
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_0209189c
.extern func_020918f4
.extern PresentationList_Append
.extern PresentationList_UpdateAndDeleteCompleted
.extern func_ov094_02219234
.extern func_ov094_02219344
.extern gGameWork
.extern gHeapContext

.global func_ov094_022196e8
func_ov094_022196e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x78
    mov r6, r0
    ldr r0, [r6, #0xc]
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_022198a8
    ldr r0, .L_022198cc
    ldr r1, .L_022198d0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0221983c
    ldr r0, .L_022198cc
    ldr r1, .L_022198d0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r7, .L_022198d4
    add r5, sp, #0x8
    mov r4, #0x7
.L_02219738:
    ldmia r7!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_02219738
    add r0, r6, #0x14
    mov r1, #0x1c
    bl func_020918f4
    add r2, sp, #0x8
    ldr r3, [r2, r0, lsl #0x2]
    ldr r0, [r6, #0xc]
    mov r1, r6
    mov r2, #0x1
    and r7, r3, #0xff
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r5, r0
    ldr r0, [r6, #0x10]
    mov r1, r6
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r0, r5
    mov r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    mov r1, r7
    mov r0, r4
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r2, [r5, #0x24]
    ldr r1, .L_022198d8
    ldr r3, .L_022198dc
    orr r2, r2, #0x2
    strh r2, [r5, #0x24]
    ldrh r7, [r4, #0x24]
    mov r0, #0xa8
    mov r2, #0x4
    orr r7, r7, #0x2
    strh r7, [r4, #0x24]
    bl Heap_Alloc
    movs r9, r0
    beq .L_02219830
    add r0, r6, #0x14
    mov r1, #0x0
    mov r2, #0x100
    bl func_0209189c
    mov r8, r0
    ldr r1, [r6, #0x44]
    ldr r2, [r6, #0x48]
    add r0, r6, #0x14
    bl func_0209189c
    mov r7, r0
    add r0, r6, #0x14
    mov r1, #0x8c
    mov r2, #0xb4
    bl func_0209189c
    mov r1, r7, lsl #0xc
    str r1, [sp, #0x0]
    mov r1, r5
    mov r2, r4
    mov r3, r8, lsl #0xc
    str r0, [sp, #0x4]
    mov r0, r9
    bl func_ov094_02219344
    mov r9, r0
.L_02219830:
    mov r1, r9
    add r0, r6, #0x34
    bl PresentationList_Append
.L_0221983c:
    ldr r0, .L_022198cc
    ldr r1, .L_022198e0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02219890
    ldr r0, .L_022198cc
    ldr r1, .L_022198e0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, .L_022198e4
    ldr r3, .L_022198dc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_02219888
    bl func_ov094_02219234
    mov r1, r0
.L_02219888:
    add r0, r6, #0x34
    bl PresentationList_Append
.L_02219890:
    add r0, r6, #0x34
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r6, #0xc]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r6, #0x10]
    bl GraphicsSpriteGroup_AdvanceAnimations
.L_022198a8:
    ldr r0, .L_022198cc
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_022198cc: .word gGameWork
.L_022198d0: .word 0x3d3
.L_022198d4: .word data_ov094_02219c28
.L_022198d8: .word data_ov094_02219f14
.L_022198dc: .word gHeapContext
.L_022198e0: .word 0x3d5
.L_022198e4: .word data_ov094_02219f1c
.size func_ov094_022196e8, . - func_ov094_022196e8
