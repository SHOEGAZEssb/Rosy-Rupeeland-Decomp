; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern gGamePhaseRegionResizeArrayAllocationTag
.extern Heap_AllocAlternateEntry
.extern GamePhaseRegion_Init
.extern GamePhaseRegion_Destroy
.extern GamePhaseRegionTable_Clear
.extern func_020c09cc
.extern gHeapContext

    .global GamePhaseRegionTable_Resize
GamePhaseRegionTable_Resize: ; 0x0201166c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq L_0201168c
    bl GamePhaseRegionTable_Clear
L_0201168c:
    mov r0, r4, lsl #0x3
    ldr r1, L_020116d8
    ldr r3, L_020116dc
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_020116cc
    ldr r1, L_020116e0
    mov r2, #0x8
    ldr ip, L_020116e4
    str r1, [sp, #0x0]
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    bl func_020c09cc
L_020116cc:
    stmia r5, {r0, r4}
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_020116d8: .word gGamePhaseRegionResizeArrayAllocationTag
L_020116dc: .word gHeapContext
L_020116e0: .word GamePhaseRegion_Init
L_020116e4: .word GamePhaseRegion_Destroy
    .size GamePhaseRegionTable_Resize, . - GamePhaseRegionTable_Resize
