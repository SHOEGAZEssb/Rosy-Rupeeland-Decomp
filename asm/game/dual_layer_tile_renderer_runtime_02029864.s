; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern GameFile_Destroy
.extern GameFile_Init
.extern GameFile_Open
.extern data_020de970
.extern func_02005284
.extern func_020052b0
.extern func_02005354
.extern func_020af7e8
.extern func_020af838
.extern func_020b44e8
.extern func_020b581c

    .global func_02029864
    .type func_02029864, @function
func_02029864: ; 0x02029864
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x60
    mov r5, r0
    ldrb r0, [r5, #0x31]
    cmp r0, #0x0
    moveq r4, #0x20
    movne r4, #0x40
    bl func_020b44e8
    add r0, sp, #0x0
    bl func_02005284
    add r0, sp, #0x14
    bl GameFile_Init
    ldr r1, .L_02029910
    add r0, sp, #0x14
    bl GameFile_Open
    ldr r3, [r5, #0x1c]
    add r0, sp, #0x0
    add r1, sp, #0x14
    ldmia r3, {r2, r3}
    bl func_02005354
    ldrb r0, [r5, #0x30]
    cmp r0, #0x1
    beq .L_020298cc
    cmp r0, #0x2
    beq .L_020298e4
    b .L_020298f8
.L_020298cc:
    bl func_020af838
    mov r1, r0
    ldr r0, [sp, #0x4]
    mov r2, r4, lsl #0xa
    bl func_020b581c
    b .L_020298f8
.L_020298e4:
    bl func_020af7e8
    mov r1, r0
    ldr r0, [sp, #0x4]
    mov r2, r4, lsl #0xa
    bl func_020b581c
.L_020298f8:
    add r0, sp, #0x14
    bl GameFile_Destroy
    add r0, sp, #0x0
    bl func_020052b0
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
.L_02029910: .word data_020de970
    .size func_02029864, . - func_02029864

