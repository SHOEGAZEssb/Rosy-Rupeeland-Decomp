; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern MI_CpuCopy8
.extern OwnedTileBuffer_Resize
.extern func_0202b5fc
.extern func_0202b60c
.extern func_0202b648
.extern func_0202b728

    .global TileLayer_LoadSourceTileSection
    .type TileLayer_LoadSourceTileSection, @function
TileLayer_LoadSourceTileSection: ; 0x0202a78c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    add r0, sp, #0x0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0202b5fc
    add r0, sp, #0x0
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_0202b648
    ldr r1, [sp, #0x4]
    add r0, r7, #0x8
    add r0, r0, #0x1000
    mov r1, r1, lsr #0x1
    bl OwnedTileBuffer_Resize
    add r0, sp, #0x0
    bl func_0202b728
    add r1, r7, #0x1000
    ldr r1, [r1, #0x8]
    ldr r2, [sp, #0x4]
    bl MI_CpuCopy8
    add r0, sp, #0x0
    bl func_0202b60c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size TileLayer_LoadSourceTileSection, . - TileLayer_LoadSourceTileSection

