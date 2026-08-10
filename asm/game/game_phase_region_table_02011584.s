; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern gDefaultGamePhaseRegion
.extern func_02008354
.extern GamePhaseRegionTable_Resize

    .global GamePhaseRegionTable_SetRegionsFromSentinel
GamePhaseRegionTable_SetRegionsFromSentinel: ; 0x02011584
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    movs r5, r1
    mov r6, r0
    bne L_020115ac
    mov r1, #0x1
    bl GamePhaseRegionTable_Resize
    ldr r0, [r6, #0x0]
    ldr r1, L_02011668
    bl func_02008354
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_020115ac:
    mov r4, #0x0
    mov lr, #0x1
    mov ip, r4
    mov r2, r4
    mov r3, lr
    mov r0, r4
    mov r1, lr
    mov r11, lr
L_020115cc:
    add r7, r5, r4, lsl #0x3
    ldrsh r7, [r7, #0x6]
    add r8, r5, r4, lsl #0x3
    mov r9, r4, lsl #0x3
    add r10, r5, r4, lsl #0x3
    cmp r7, #0x0
    moveq r7, lr
    ldrsh r8, [r8, #0x4]
    movne r7, ip
    ldrsh r9, [r5, r9]
    cmp r8, #0x0
    moveq r8, r3
    movne r8, r2
    cmp r9, #0x0
    moveq r9, r1
    ldrsh r10, [r10, #0x2]
    movne r9, r0
    cmp r10, #0x0
    moveq r10, r11
    movne r10, #0x0
    and r9, r9, r10
    and r8, r8, r9
    tst r7, r8
    addeq r4, r4, #0x1
    beq L_020115cc
    mov r0, r6
    mov r1, r4
    bl GamePhaseRegionTable_Resize
    mov r7, #0x0
    b L_0201165c
L_02011644:
    ldr r0, [r6, #0x0]
    mov r1, r5
    add r0, r0, r7, lsl #0x3
    bl func_02008354
    add r5, r5, #0x8
    add r7, r7, #0x1
L_0201165c:
    cmp r7, r4
    blt L_02011644
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02011668: .word gDefaultGamePhaseRegion
    .size GamePhaseRegionTable_SetRegionsFromSentinel, . - GamePhaseRegionTable_SetRegionsFromSentinel

