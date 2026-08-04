; Matching retail form; see src/game/actor_runtime_scene_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern GameWork_TestFlag
.extern func_02072b68
.extern func_02038e38
.extern func_0200b2c0
.extern func_0204b5d8
.extern func_0200ba00
.extern func_02007f0c
.extern func_02030b58
.extern data_020d448c
.extern data_021052fc
.extern gGameWork
.global func_0200b2d0
func_0200b2d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Scene_Init
    ldr r1, L_0200b408
    mov r0, r5
    str r1, [r5, #0x0]
    str r4, [r5, #0x24]
    bl Scene_SetFlags03
    mov r0, #0x2
    ldr r1, L_0200b40c
    str r0, [r5, #0x4]
    ldr r0, L_0200b410
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x2000
    ldr r1, L_0200b414
    ldr r4, [r2, #0xea4]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b364
    ldr r0, L_0200b410
    ldr r1, L_0200b418
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b364
    ldr r0, [r4, #0x54]
    ldrb r1, [r0, #0x38]
    bl func_02072b68
    ldr r0, [r4, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x20
    strh r0, [r1, #0x24]
L_0200b364:
    ldr r1, [r4, #0x230]
    mov r0, r4
    bic r1, r1, #0x4
    str r1, [r4, #0x230]
    bl func_02038e38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldr r0, L_0200b40c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_0200b3d0
    bl func_0204b5d8
L_0200b3d0:
    mov r0, r5
    bl func_0200ba00
    ldr r0, L_0200b40c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, #0x0
    bl func_02030b58
    ldr r0, L_0200b410
    mov r1, #0x410
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0200b408: .word data_020d448c
L_0200b40c: .word data_021052fc
L_0200b410: .word gGameWork
L_0200b414: .word 0x3f3
L_0200b418: .word 0x403
.size func_0200b2d0, . - func_0200b2d0

