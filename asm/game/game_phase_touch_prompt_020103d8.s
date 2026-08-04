; Matching retail form; see src/game/game_phase_touch_prompt_runtime.c.
.text
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern func_0201054c
.extern func_02010724
.extern func_020107bc
.extern func_02039408
.extern func_02039428
.extern func_020740a4
.extern func_020954c0
.extern func_020954d4
.extern gSceneManager
.global func_020103d8
func_020103d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq L_02010510
    ldr r1, L_02010518
    ldr r0, L_0201051c
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r5, [r1, #0xea4]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x9
    bgt L_02010434
    bge L_02010468
    cmp r0, #0x2
    bgt L_02010468
    cmp r0, #0x1
    blt L_02010468
    beq L_0201043c
    cmp r0, #0x2
    b L_02010468
L_02010434:
    cmp r0, #0x12
    b L_02010468
L_0201043c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    mov r0, r4
    beq L_02010460
    bl func_020107bc
    b L_02010470
L_02010460:
    bl func_0201054c
    b L_02010470
L_02010468:
    mov r0, r4
    bl func_02010724
L_02010470:
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x18]
    bl func_020740a4
    ldr r0, [r5, #0x230]
    tst r0, #0x800
    beq L_020104f4
    mov r0, r5
    bl func_02039408
    cmp r0, #0x0
    beq L_020104c4
    ldr r0, [r4, #0x1c]
    bl func_020954d4
    cmp r0, #0x3
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x3
    bl func_020954c0
    b L_02010510
L_020104c4:
    mov r0, r5
    bl func_02039428
    cmp r0, #0x0
    beq L_02010510
    ldr r0, [r4, #0x1c]
    bl func_020954d4
    cmp r0, #0x1
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x1
    bl func_020954c0
    b L_02010510
L_020104f4:
    ldr r0, [r4, #0x1c]
    bl func_020954d4
    cmp r0, #0x0
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    bl func_020954c0
L_02010510:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02010518: .word data_021052fc
L_0201051c: .word gSceneManager
    .size func_020103d8, . - func_020103d8

