    .text
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021e9ac0
    .extern data_ov014_021fd960
    .extern data_ov014_021fd994
    .extern data_ov014_021fd9a8
    .extern data_ov014_021fd9b0
    .extern InventoryRecordCollection_Sort
    .extern SceneInputBase_Init
    .extern TitleCharacterResourceCollection_Init
    .extern TitleCharacterResourceCollection_Append
    .extern func_ov000_021fb728
    .extern Overlay000_Grid_Init
    .extern func_ov000_021fcae8
    .extern func_ov014_021fce00
    .extern func_ov014_021fce14
    .extern func_ov014_021fcf50
    .extern func_ov014_021fd07c
    .extern gDebugFont
    .extern gHeapContext

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_scene_lifecycle.c. */
    .global func_ov014_021fce3c

func_ov014_021fce3c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_021fcf2c
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x7c
    bl func_ov014_021fce00
    mov r0, r4
    bl func_ov014_021fd07c
    add r0, r4, #0x54
    ldr r1, L_021fcf30
    bl TitleCharacterResourceCollection_Append
    mov r0, #0x68
    ldr r1, L_021fcf34
    mov r2, #0x4
    ldr r3, L_021fcf38
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcea0
    ldr r1, L_021fcf3c
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb728
L_021fcea0:
    str r0, [r4, #0x88]
    cmp r5, #0x0
    beq L_021fceb8
    mov r1, r5
    add r0, r4, #0x7c
    bl func_ov014_021fcf50
L_021fceb8:
    ldr r0, L_021fcf40
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl InventoryRecordCollection_Sort
    ldr r1, L_021fcf44
    ldr r3, L_021fcf38
    mov r0, #0x2b0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcef0
    ldr r1, L_021fcf48
    ldr r1, [r1, #0x0]
    bl Overlay000_Grid_Init
L_021fcef0:
    add r1, r4, #0x7c
    mov r2, #0x0
    str r0, [r4, #0x78]
    bl func_ov000_021fcae8
    mov r0, #0x0
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fcf4c
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fcf2c: .word data_ov014_021fd994
L_021fcf30: .word 0x7005
L_021fcf34: .word data_ov014_021fd9a8
L_021fcf38: .word gHeapContext
L_021fcf3c: .word gDebugFont
L_021fcf40: .word data_021e9ac0
L_021fcf44: .word data_ov014_021fd9b0
L_021fcf48: .word data_020f4e14
L_021fcf4c: .word data_ov014_021fd960
    .size func_ov014_021fce3c, . - func_ov014_021fce3c
