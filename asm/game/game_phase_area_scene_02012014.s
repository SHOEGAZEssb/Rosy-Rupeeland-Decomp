; Matching retail form; see src/game/game_phase_area_scene_runtime.c.
.text
.extern Heap_Alloc
.extern gGamePhaseAreaRegionEffectAllocationTag
.extern data_021052fc
.extern GamePhaseRegionTable_FindContainingRegion
.extern GamePhaseRegionTable_GetRegion
.extern GamePhaseRegionTable_IsRegionEnabled
.extern GamePhaseRegionTable_SetRegionEnabled
.extern PresentationList_AppendObject
.extern FourStageCommandPresentation_Init
.extern gHeapContext

    .global GamePhaseAreaScene_UpdateRegionAtPosition
GamePhaseAreaScene_UpdateRegionAtPosition: ; 0x02012014
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r9, r1
    mov r10, r0
    mov r1, r2, asr #0xc
    mov r0, r9
    mov r2, r3, asr #0xc
    bl GamePhaseRegionTable_FindContainingRegion
    mov r8, r0
    mvn r0, #0x0
    cmp r8, r0
    addne r0, r10, #0x2000
    ldrne r0, [r0, #0xea8]
    movne r0, r0, lsl #0x1b
    cmpne r8, r0, asr #0x1b
    beq L_02012138
    mov r0, r9
    mov r1, r8
    bl GamePhaseRegionTable_GetRegion
    ldrsh r2, [r0, #0x0]
    ldrsh r3, [r0, #0x2]
    ldrsh r1, [r0, #0x4]
    ldrsh r0, [r0, #0x6]
    add r2, r2, r2, lsr #0x1f
    add r3, r3, r3, lsr #0x1f
    add r6, r1, r1, lsr #0x1f
    add r7, r0, r0, lsr #0x1f
    mov r0, r9
    mov r1, r8
    mov r4, r2, asr #0x1
    mov r5, r3, asr #0x1
    mov r6, r6, asr #0x1
    mov r7, r7, asr #0x1
    bl GamePhaseRegionTable_IsRegionEnabled
    cmp r0, #0x0
    bne L_02012110
    ldr r0, [r10, #0x4]
    cmp r0, #0x0
    beq L_02012110
    ldr r1, L_02012144
    ldr r3, L_02012148
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_020120e4
    stmia sp, {r6, r7}
    ldr r1, [r10, #0x4]
    mov r2, r4
    mov r3, r5
    bl FourStageCommandPresentation_Init
    mov r1, r0
L_020120e4:
    ldr r2, [r1, #0x4]
    ldr r0, L_0201214c
    bic r2, r2, #0x3fc
    orr r2, r2, #0xdc
    str r2, [r1, #0x4]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl PresentationList_AppendObject
    add r1, r10, #0x2000
    str r0, [r1, #0xed4]
L_02012110:
    mov r0, r9
    mov r1, r8
    mov r2, #0x1
    bl GamePhaseRegionTable_SetRegionEnabled
    add r0, r10, #0x2000
    ldr r2, [r0, #0xea8]
    and r1, r8, #0x1f
    bic r2, r2, #0x1f
    orr r1, r2, r1
    str r1, [r0, #0xea8]
L_02012138:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02012144: .word gGamePhaseAreaRegionEffectAllocationTag
L_02012148: .word gHeapContext
L_0201214c: .word data_021052fc
    .size GamePhaseAreaScene_UpdateRegionAtPosition, . - GamePhaseAreaScene_UpdateRegionAtPosition

