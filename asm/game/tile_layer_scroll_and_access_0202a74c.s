; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern gTileLayerArrayAllocationTag
.extern Heap_AllocAlternateEntry
.extern OwnedTileBuffer_Clear
.extern gHeapContext

    .global OwnedTileBuffer_Resize
    .type OwnedTileBuffer_Resize, @function
OwnedTileBuffer_Resize: ; 0x0202a74c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_0202a768
    bl OwnedTileBuffer_Clear
.L_0202a768:
    ldr r1, .L_0202a784
    ldr r3, .L_0202a788
    mov r0, r4, lsl #0x1
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    stmia r5, {r0, r4}
    ldmia sp!, {r3, r4, r5, pc}
.L_0202a784: .word gTileLayerArrayAllocationTag
.L_0202a788: .word gHeapContext
    .size OwnedTileBuffer_Resize, . - OwnedTileBuffer_Resize

