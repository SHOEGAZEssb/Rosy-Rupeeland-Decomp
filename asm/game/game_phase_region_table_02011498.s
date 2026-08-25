; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern gGamePhaseRegionInitialArrayAllocationTag
.extern Heap_AllocAlternateEntry
.extern GamePhaseRegion_Init
.extern GamePhaseRegion_Destroy
.extern CxxArray_ConstructWithCookie
.extern gHeapContext

    .global GamePhaseRegionTable_InitWithCount
GamePhaseRegionTable_InitWithCount: ; 0x02011498
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    streq r0, [r5, #0x0]
    streq r0, [r5, #0x4]
    beq L_020114fc
    mov r0, r4, lsl #0x3
    ldr r1, L_02011508
    ldr r3, L_0201150c
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_020114f8
    ldr r1, L_02011510
    mov r2, #0x8
    ldr ip, L_02011514
    str r1, [sp, #0x0]
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
L_020114f8:
    stmia r5, {r0, r4}
L_020114fc:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_02011508: .word gGamePhaseRegionInitialArrayAllocationTag
L_0201150c: .word gHeapContext
L_02011510: .word GamePhaseRegion_Init
L_02011514: .word GamePhaseRegion_Destroy
    .size GamePhaseRegionTable_InitWithCount, . - GamePhaseRegionTable_InitWithCount
