.text
.extern func_02092c8c
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_ov044_0220bd98
.extern func_02095940
.extern func_ov044_0220c5c0
.extern func_ov044_0220c6dc
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern Heap_Alloc
.extern func_ov015_021fce58
.extern func_ov044_0220c880
.extern func_02091fb0
.extern func_020925f8
.extern func_ov044_0220c3e4
.extern func_ov044_0220c610
.extern func_ov044_0220c440
.extern func_ov044_0220bba4
.extern func_ov044_0220c700
.extern GameWork_TestFlag
.extern func_ov044_0220be38
.extern data_020f4e14
.extern data_ov044_0220d358
.extern gHeapContext
.extern gGameWork
.extern data_ov044_0220d2c8
.extern data_ov044_0220d2c0

    .global func_ov044_0220cf60
func_ov044_0220cf60:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_0220d1ec
.L_0220cf78:
    b .L_0220cf94
    b .L_0220cfb4
    b .L_0220d04c
    b .L_0220d07c
    b .L_0220d0b4
    b .L_0220d114
    b .L_0220d1cc
.L_0220cf94:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
.L_0220cfb4:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220d040
    ldr r0, [r4, #0x228]
    bl func_ov044_0220bd98
    ldr r5, [r0, #0xc]
    add r0, r4, #0x17c
    bl func_02095940
    mov r0, r4
    bl func_ov044_0220c5c0
    mov r0, r4
    bl func_ov044_0220c6dc
    ldr r0, .L_0220d1f4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, #0x304
    ldr r1, .L_0220d1f8
    mov r2, #0x4
    ldr r3, .L_0220d1fc
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220d018
    mov r2, r5
    mov r1, #0x0
    bl func_ov015_021fce58
.L_0220d018:
    str r0, [r4, #0x23c]
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220d1ec
.L_0220d040:
    mov r0, r4
    bl func_ov044_0220c880
    b .L_0220d1ec
.L_0220d04c:
    ldr r0, [r4, #0x23c]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220d1ec
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220d1ec
.L_0220d07c:
    ldr r0, [r4, #0x23c]
    mov r1, #0x1
    bl func_02091fb0
    cmp r0, #0x0
    beq .L_0220d1ec
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220d1ec
.L_0220d0b4:
    ldr r0, [r4, #0x23c]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220d1ec
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_0220d0f0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220d0f0:
    mov r1, #0x0
    str r1, [r4, #0x23c]
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b .L_0220d1ec
.L_0220d114:
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    cmp r1, #0x1
    beq .L_0220d13c
    cmp r1, #0x2
    beq .L_0220d168
    cmp r1, #0x3
    beq .L_0220d178
    b .L_0220d1ec
.L_0220d13c:
    ldr r0, .L_0220d1f4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, #0x1c
    str r0, [r4, #0x48]
    bl func_020925f8
    mov r0, r4
    bl func_ov044_0220c3e4
    mov r0, r4
    bl func_ov044_0220c610
    b .L_0220d1ec
.L_0220d168:
    bl func_ov044_0220c440
    ldr r0, [r4, #0x228]
    bl func_ov044_0220bba4
    b .L_0220d1ec
.L_0220d178:
    bl func_ov044_0220c700
    ldr r0, .L_0220d200
    mov r1, #0x3b0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220d1a8
    ldr r1, .L_0220d204
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    b .L_0220d1ec
.L_0220d1a8:
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220d1ec
.L_0220d1cc:
    bl func_ov044_0220c880
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220d1ec
    ldr r1, .L_0220d208
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
.L_0220d1ec:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0220d1f4: .word data_020f4e14
.L_0220d1f8: .word data_ov044_0220d358
.L_0220d1fc: .word gHeapContext
.L_0220d200: .word gGameWork
.L_0220d204: .word data_ov044_0220d2c8
.L_0220d208: .word data_ov044_0220d2c0
.size func_ov044_0220cf60, . - func_ov044_0220cf60
