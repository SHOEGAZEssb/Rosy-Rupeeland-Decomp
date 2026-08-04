; Matching retail form; see src/game/game_phase_state_boundary_transition.c.
.text
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern data_020d5544
.extern data_02105310
.extern func_0200222c
.extern func_020022dc
.extern func_0200b04c
.extern func_0200b294
.extern func_0200efe0
.extern func_020393f4
.extern func_02039e70
.extern func_ov074_0220fda8
.extern gGameWork
.extern gHeapContext
.extern gSceneManager

    .global func_0200ecf0
func_0200ecf0: ; 0x0200ecf0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, L_0200efc4
    add r2, r5, #0x2000
    ldr r0, [r1, #0x0]
    ldr r1, L_0200efc8
    ldr r4, [r2, #0xe80]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, L_0200efcc
    bl func_0200b04c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, L_0200efcc
    bl func_0200b294
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, L_0200efd0
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02039e70
    cmp r0, #0x0
    beq L_0200ed8c
    bl func_02039e70
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_0200ee54
L_0200ed8c:
    ldr ip, [r4, #0xd0]
    mov r2, #0x0
    mov r1, r2
    mov r3, r2
    tst ip, #0x100
    bne L_0200edcc
    tst ip, #0x10000
    bne L_0200edb8
    ldr r0, [r4, #0x230]
    tst r0, #0x980000
    beq L_0200edc0
L_0200edb8:
    mov r0, #0x1
    b L_0200edc4
L_0200edc0:
    mov r0, r2
L_0200edc4:
    cmp r0, #0x0
    moveq r3, #0x1
L_0200edcc:
    cmp r3, #0x0
    beq L_0200ede0
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    moveq r1, #0x1
L_0200ede0:
    cmp r1, #0x0
    beq L_0200ee20
    tst ip, #0x10
    ldreq r1, [r4, #0x24]
    ldreq r0, [r4, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_0200ee20
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne L_0200ee20
    tst ip, #0x4000
    moveq r2, #0x1
L_0200ee20:
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_020393f4
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x64
    cmpne r0, #0x65
    cmpne r0, #0x66
    cmpne r0, #0x7f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
L_0200ee54:
    mov r0, r5
    bl func_0200efe0
    mvn r1, #0x0
    cmp r0, r1
    cmpne r0, #0x0
    beq L_0200efbc
    cmp r0, #0x1
    bne L_0200eec0
    ldr r0, [r5, #0x0]
    ldrsh r0, [r0, #0x14]
    cmp r0, #0x0
    blt L_0200efbc
    bl func_020022dc
    ldr r2, L_0200efd4
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_0200efd8
    ldr r3, L_0200efdc
    mov r0, #0x174
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200eeb8
    mov r1, #0x0
    bl func_ov074_0220fda8
L_0200eeb8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200eec0:
    cmp r0, #0x2
    bne L_0200ef14
    ldr r0, [r5, #0x0]
    ldrsh r0, [r0, #0x16]
    cmp r0, #0x0
    blt L_0200efbc
    bl func_020022dc
    ldr r2, L_0200efd4
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_0200efd8
    ldr r3, L_0200efdc
    mov r0, #0x174
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200ef0c
    mov r1, #0x1
    bl func_ov074_0220fda8
L_0200ef0c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200ef14:
    cmp r0, #0x3
    bne L_0200ef68
    ldr r0, [r5, #0x0]
    ldrsh r0, [r0, #0x18]
    cmp r0, #0x0
    blt L_0200efbc
    bl func_020022dc
    ldr r2, L_0200efd4
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_0200efd8
    ldr r3, L_0200efdc
    mov r0, #0x174
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200ef60
    mov r1, #0x2
    bl func_ov074_0220fda8
L_0200ef60:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200ef68:
    cmp r0, #0x4
    bne L_0200efbc
    ldr r0, [r5, #0x0]
    ldrsh r0, [r0, #0x1a]
    cmp r0, #0x0
    blt L_0200efbc
    bl func_020022dc
    ldr r2, L_0200efd4
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_0200efd8
    ldr r3, L_0200efdc
    mov r0, #0x174
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200efb4
    mov r1, #0x3
    bl func_ov074_0220fda8
L_0200efb4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200efbc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0200efc4: .word gGameWork
L_0200efc8: .word 0x3ee
L_0200efcc: .word data_02105310
L_0200efd0: .word gSceneManager
L_0200efd4: .word 0x4a
L_0200efd8: .word data_020d5544
L_0200efdc: .word gHeapContext
    .size func_0200ecf0, . - func_0200ecf0

