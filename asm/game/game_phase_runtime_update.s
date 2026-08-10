; Matching retail form; see src/game/game_phase_runtime_update.c for the
; documented portable implementation and recovered behavior.
.text
.extern data_020d4360
.extern data_020f4e14
.extern data_021f38fc
.extern func_020020c4
.extern func_020021c4
.extern func_0200222c
.extern func_020022dc
.extern func_02007868
.extern func_02007908
.extern func_02007a24
.extern func_02008148
.extern GamePhaseRuntime_DispatchActorQueryRequest
.extern func_0200866c
.extern func_02008f34
.extern func_0200c244
.extern func_0200c680
.extern func_0200c8bc
.extern func_0200c9fc
.extern func_0200ecf0
.extern func_02010b64
.extern func_02010e68
.extern func_0201dcec
.extern func_02027654
.extern func_02027f94
.extern func_020338e4
.extern Actor_TrySpawnTerrainGateObject
.extern func_02048bcc
.extern func_0206ec68
.extern func_020755bc
.extern func_02078384
.extern func_020783cc
.extern func_ov059_0220fd20
.extern GameWork_TestFlag
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern gSceneManager
.extern Heap_Alloc
.extern SceneManager_GetCurrent

    .global func_02007430
.type func_02007430, @function
func_02007430:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r1, r4, #0x3000
    ldr r2, [r1, #0xb8]
    tst r2, #0x8
    beq L_02007484
    cmp r4, #0x0
    beq L_0200745c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200745c:
    ldr r1, L_02007838
    ldr r3, L_0200783c
    mov r0, #0x4c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200747c
    bl func_0200c244
L_0200747c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_02007484:
    ldr r1, [r1, #0xe4]
    mvn r0, #0x0
    cmp r1, r0
    beq L_02007548
    mov r0, #0x24
    ldr r1, L_02007838
    ldr r3, L_0200783c
    sub r2, r0, #0x28
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_020074b4
    bl func_0200c680
L_020074b4:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xe4]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_02007540
L_020074c8: ; jump table
    b L_02007540 ; case 0
    b L_02007508 ; case 1
    b L_020074dc ; case 2
    b L_02007540 ; case 3
    b L_020074dc ; case 4
L_020074dc:
    mov r0, #0x38
    ldr r1, L_02007838
    ldr r3, L_0200783c
    sub r2, r0, #0x3c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007540
    add r1, r4, #0x3000
    ldr r1, [r1, #0xe4]
    bl func_0200c9fc
    b L_02007540
L_02007508:
    bl func_020022dc
    ldr r2, L_02007840
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_02007838
    ldr r3, L_0200783c
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007540
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, func_ov064_0220fd20, func_ov065_0220fd20, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
L_02007540:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02007548:
    add r0, r4, #0x2000
    ldr r0, [r0, #0xea4]
    bl func_02007868
    cmp r0, #0x0
    beq L_020075d8
    ldr r0, L_02007844
    ldr r1, L_02007848
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_020075d8
    add r0, r4, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x7
    movs r0, r0, asr #0x1f
    beq L_020075d8
    bl func_020021c4
    bl func_020020c4
    ldr r0, L_02007844
    ldr r1, L_0200784c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_020075b4
    bl func_02027f94
    bl func_02027654
L_020075b4:
    add r0, r4, #0xf0
    add r0, r0, #0x3000
    bl func_02008f34
    cmp r0, #0x0
    beq L_020075d0
    ldr r0, L_02007850
    bl func_020783cc
L_020075d0:
    ldr r0, L_02007850
    bl func_02078384
L_020075d8:
    add r0, r4, #0x3000
    ldrb r1, [r0, #0xcc]
    tst r1, #0x8
    beq L_02007628
    ldr r1, L_02007838
    ldr r3, L_0200783c
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007620
    add r3, r4, #0x3000
    ldr r1, [r3, #0xe0]
    str r1, [sp, #0x0]
    ldr r1, [r3, #0xd0]
    ldr r2, [r3, #0xd4]
    ldr r3, [r3, #0xd8]
    bl func_0200c8bc
L_02007620:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02007628:
    ldr r1, [r0, #0xb8]
    tst r1, #0x10
    beq L_02007648
    bic r2, r1, #0x10
    ldr r1, L_02007854
    str r2, [r0, #0xb8]
    ldr r0, [r1, #0x0]
    bl func_020755bc
L_02007648:
    add r0, r4, #0x3000
    ldr r1, [r0, #0xb8]
    tst r1, #0x20
    beq L_0200766c
    bic r2, r1, #0x20
    ldr r1, L_02007858
    str r2, [r0, #0xb8]
    ldr r0, [r1, #0x0]
    bl func_020755bc
L_0200766c:
    ldr r0, L_02007844
    ldr r1, L_0200785c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200769c
    ldr r0, L_02007860
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r0, #0x0
    movle r5, #0x1
    ble L_020076a0
L_0200769c:
    mov r5, #0x0
L_020076a0:
    cmp r5, #0x0
    bne L_02007720
    ldr r1, [r4, #0x4]
    mov r0, r4
    mov r2, #0x3
    bl func_02007908
    add r0, r4, #0x24
    bl func_0200ecf0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0200866c
    mov r0, r4
    mov r1, #0x0
    bl func_02008148
    mov r0, r4
    mov r1, #0x1
    bl func_02008148
    add r0, r4, #0x37c
    add r0, r0, #0x2c00
    mov r1, #0x1
    bl func_0201dcec
    ldr r1, [r4, #0x4]
    mov r0, r4
    mov r2, #0x3
    bl func_02007a24
    mov r0, r4
    bl GamePhaseRuntime_DispatchActorQueryRequest
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
L_02007720:
    ldr r0, L_02007860
    ldr r0, [r0, #0x0]
    bl func_02010e68
    cmp r5, #0x0
    beq L_020077ac
    add r0, r4, #0x2000
    ldr r0, [r0, #0xea4]
    bl func_020338e4
    add r0, r4, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_0200776c
    ldr r1, [r0, #0x268]
    tst r1, #0x10
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_0200776c
    bl func_02048bcc
L_0200776c:
    bl func_020022dc
    ldr r2, L_02007840
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_02007838
    ldr r3, L_0200783c
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_020077a4
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, func_ov064_0220fd20, func_ov065_0220fd20, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
L_020077a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_020077ac:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldr r0, L_02007864
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    cmp r0, r4
    bne L_02007830
    bl Actor_TrySpawnTerrainGateObject
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    add r0, r4, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x26c]
    cmp r0, #0x0
    beq L_02007830
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq L_02007830
    ldr r1, L_02007838
    ldr r3, L_0200783c
    mov r0, #0x38
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007828
    bl func_0206ec68
L_02007828:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02007830:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02007838: .word data_020d4360
L_0200783c: .word gHeapContext
L_02007840: .word 0x40
L_02007844: .word gGameWork
L_02007848: .word 0x3ee
L_0200784c: .word 0x40f
L_02007850: .word data_021f38fc
L_02007854: .word data_020f4e14
L_02007858: .word gDebugFont
L_0200785c: .word 0x3f5
L_02007860: .word gLupyContext
L_02007864: .word gSceneManager
    .size func_02007430, .-func_02007430
