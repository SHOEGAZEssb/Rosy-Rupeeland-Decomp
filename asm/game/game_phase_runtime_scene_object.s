; Matching retail form; see src/game/game_phase_runtime_scene_object.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_020d4378
.extern func_02025acc
.extern func_02025f20
.extern func_020261bc
.extern gHeapContext
.extern Heap_Alloc
.extern OS_Halt

    .global GamePhaseRuntime_RecreateDualScreenUiPresentation
.type GamePhaseRuntime_RecreateDualScreenUiPresentation, @function
GamePhaseRuntime_RecreateDualScreenUiPresentation:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    add r0, r5, #0x3000
    ldr r0, [r0, #0xe8]
    mov r6, r1
    mov r4, r2
    cmp r0, #0x0
    beq L_02008d34
    beq L_02008d28
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02008d28:
    add r0, r5, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xe8]
L_02008d34:
    cmp r6, #0x0
    beq L_02008d4c
    cmp r6, #0x1
    cmpne r6, #0x2
    beq L_02008dd0
    b L_02008e00
L_02008d4c:
    ldr r0, [r4, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne L_02008d90
    ldr r1, L_02008e08
    ldr r3, L_02008e0c
    mov r0, #0xd4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02008d84
    mov r1, r4
    bl func_02025f20
L_02008d84:
    add r1, r5, #0x3000
    str r0, [r1, #0xe8]
    ldmia sp!, {r4, r5, r6, pc}
L_02008d90:
    cmp r0, #0x2
    bne L_02008dc8
    ldr r1, L_02008e08
    ldr r3, L_02008e0c
    mov r0, #0xd8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02008dbc
    mov r1, r4
    bl func_020261bc
L_02008dbc:
    add r1, r5, #0x3000
    str r0, [r1, #0xe8]
    ldmia sp!, {r4, r5, r6, pc}
L_02008dc8:
    bl OS_Halt
    ldmia sp!, {r4, r5, r6, pc}
L_02008dd0:
    ldr r1, L_02008e08
    ldr r3, L_02008e0c
    mov r0, #0xc8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02008df4
    mov r1, r4
    bl func_02025acc
L_02008df4:
    add r1, r5, #0x3000
    str r0, [r1, #0xe8]
    ldmia sp!, {r4, r5, r6, pc}
L_02008e00:
    bl OS_Halt
    ldmia sp!, {r4, r5, r6, pc}
L_02008e08: .word data_020d4378
L_02008e0c: .word gHeapContext
    .size GamePhaseRuntime_RecreateDualScreenUiPresentation, .-GamePhaseRuntime_RecreateDualScreenUiPresentation

