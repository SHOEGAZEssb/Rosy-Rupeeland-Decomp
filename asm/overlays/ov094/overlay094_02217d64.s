.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern Heap_Alloc
.extern data_ov094_02219f04
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_0209189c
.extern func_020918f4
.extern PresentationList_Append
.extern PresentationList_UpdateAndDeleteCompleted
.extern func_ov094_022177e0
.extern gGameWork
.extern gHeapContext

.global func_ov094_02217d64
func_ov094_02217d64:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    ldr r1, .L_02217e88
    mov r8, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x200
    ldrsh r1, [r0, #0x2]
    cmp r1, #0x0
    movlt r0, #0x1
    blt .L_02217e80
    ldrgt r0, [r8, #0x24]
    addgt r0, r0, #0x1
    strgt r0, [r8, #0x24]
    cmpgt r0, r1
    ble .L_02217e64
    mov r0, #0x0
    str r0, [r8, #0x24]
    ldr r0, [r8, #0xc]
    mov r1, r8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r6, r0
    ldr r0, [r8, #0x10]
    mov r1, r8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r5, r0
    ldr r1, .L_02217e8c
    ldr r3, .L_02217e90
    mov r0, #0xbc
    mov r2, #0x4
    bl Heap_Alloc
    movs r7, r0
    beq .L_02217e58
    add r0, r8, #0x28
    mov r1, #0x4
    bl func_020918f4
    mov r4, r0
    add r0, r8, #0x28
    mov r1, #0x80
    mov r2, #0x100
    bl func_0209189c
    mov r10, r0
    add r0, r8, #0x28
    mov r1, #0x1000
    bl func_020918f4
    mov r9, r0
    add r0, r8, #0x28
    mov r1, #0x1a4
    mov r2, #0x1e0
    bl func_0209189c
    str r10, [sp, #0x0]
    mov r1, r9, lsl #0x4
    str r1, [sp, #0x4]
    mov r1, r6
    mov r2, r5
    mov r3, r4, lsl #0x1
    str r0, [sp, #0x8]
    mov r0, r7
    bl func_ov094_022177e0
    mov r7, r0
.L_02217e58:
    mov r1, r7
    add r0, r8, #0x14
    bl PresentationList_Append
.L_02217e64:
    add r0, r8, #0x14
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r8, #0xc]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r8, #0x10]
    bl GraphicsSpriteGroup_AdvanceAnimations
    mov r0, #0x0
.L_02217e80:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_02217e88: .word gGameWork
.L_02217e8c: .word data_ov094_02219f04
.L_02217e90: .word gHeapContext
.size func_ov094_02217d64, . - func_ov094_02217d64
