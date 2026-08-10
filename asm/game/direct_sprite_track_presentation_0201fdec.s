; Matching retail form; see src/game/direct_sprite_track_presentation.c.
.text
.extern func_02005058
.extern VecFx32_Subtract
.extern func_02056f00

.global func_0201fdec
    .type func_0201fdec, @function
func_0201fdec: ; 0x0201fdec
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r0, [r4, #0x14]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    bne .L_0201fe60
    ldr r2, [r4, #0x18]
    add r0, sp, #0x0
    add r1, r4, #0x1c
    bl VecFx32_Subtract
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r1, r0, asr #0xc
    ldr r2, [r4, #0x14]
    add r0, sp, #0x10
    strh r1, [r2, #0x2c]
    mov r1, r3, asr #0xc
    strh r1, [r2, #0x2e]
    bl func_02005058
    mov r0, #0x0
.L_0201fe60:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size func_0201fdec, .-func_0201fdec
