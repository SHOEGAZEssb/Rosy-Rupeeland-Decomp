; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern DualLayerTileRenderer_FillTileRectangle

    .global func_02026fbc
    .type func_02026fbc, @function
func_02026fbc: ; 0x02026fbc
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x18]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02027138
.L_02026fd8: ; jump table
    b .L_02026fe8 ; case 0
    b .L_02027040 ; case 1
    b .L_02027098 ; case 2
    b .L_020270f0 ; case 3
.L_02026fe8:
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    cmp r0, #0x4
    ble .L_02027138
    ldr r1, [r4, #0x10]
    ldr r0, .L_02027144
    str r1, [sp, #0x0]
    ldr r2, [r4, #0x14]
    mov r1, #0x1
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x20]
    ldr r2, [r4, #0x8]
    ldr r3, [r4, #0xc]
    bl DualLayerTileRenderer_FillTileRectangle
    ldr r1, [r4, #0x18]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L_02027138
.L_02027040:
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    cmp r0, #0x4
    ble .L_02027138
    ldr r1, [r4, #0x10]
    ldr r0, .L_02027148
    str r1, [sp, #0x0]
    ldr r2, [r4, #0x14]
    mov r1, #0x1
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x20]
    ldr r2, [r4, #0x8]
    ldr r3, [r4, #0xc]
    bl DualLayerTileRenderer_FillTileRectangle
    ldr r1, [r4, #0x18]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L_02027138
.L_02027098:
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    cmp r0, #0x4
    ble .L_02027138
    ldr r1, [r4, #0x10]
    ldr r0, .L_0202714c
    str r1, [sp, #0x0]
    ldr r2, [r4, #0x14]
    mov r1, #0x1
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x20]
    ldr r2, [r4, #0x8]
    ldr r3, [r4, #0xc]
    bl DualLayerTileRenderer_FillTileRectangle
    ldr r1, [r4, #0x18]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    b .L_02027138
.L_020270f0:
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    cmp r0, #0x4
    ble .L_02027138
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    str r1, [sp, #0x0]
    ldr r2, [r4, #0x14]
    mov r1, #0x1
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x20]
    ldr r2, [r4, #0x8]
    ldr r3, [r4, #0xc]
    bl DualLayerTileRenderer_FillTileRectangle
    mov r0, #0x1
    b .L_0202713c
.L_02027138:
    mov r0, #0x0
.L_0202713c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_02027144: .word 0x1fd
.L_02027148: .word 0x1fe
.L_0202714c: .word 0x1ff
    .size func_02026fbc, . - func_02026fbc
