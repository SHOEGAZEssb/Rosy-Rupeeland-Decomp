; Matching retail form; see src/game/timed_sprite_sampled_arc_variant.c.
.text
.extern Heap_Free
.extern data_020d60ac
.extern func_02005058
.extern func_020050a4
.extern GraphicsSpriteState_SetScreenPositionCulled
.extern VecFx32_Subtract
.extern func_0201e290
.extern func_0201e380
.extern func_0201e3b8

.global func_0201edd0
.type func_0201edd0, @function
func_0201edd0: ; 0x0201edd0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0201e290
    ldr r1, .L_0201ee14
    add r0, r5, #0x8
    str r1, [r5, #0x0]
    ldr r3, [r5, #0x4]
    add r1, r4, #0x10
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldr r2, [r4, #0x30]
    str r2, [r5, #0x28]
    bl func_020050a4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0201ee14: .word data_020d60ac
    .size func_0201edd0, .-func_0201edd0

.global func_0201ee18
.type func_0201ee18, @function
func_0201ee18: ; 0x0201ee18
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ee18, .-func_0201ee18

.global func_0201ee2c
.type func_0201ee2c, @function
func_0201ee2c: ; 0x0201ee2c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ee2c, .-func_0201ee2c

.global func_0201ee48
.type func_0201ee48, @function
func_0201ee48: ; 0x0201ee48
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x28]
    mov r2, r1
    subs r0, r0, #0x1
    str r0, [r4, #0x28]
    bmi .L_0201ee80
    ldr r3, [r4, #0x4]
    ldrh r1, [r3, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0201ee94
.L_0201ee80:
    mov r0, r4
    mov r1, #0x0
    bl func_0201e3b8
    mov r0, #0x1
    b .L_0201eef4
.L_0201ee94:
    bic r1, r1, #0x4
    strh r1, [r3, #0x24]
    add r0, sp, #0x0
    add r1, r4, #0x8
    bl VecFx32_Subtract
    ldr r0, [r4, #0x14]
    ldr r1, [sp, #0x4]
    mov r2, r0, asr #0xc
    ldr r3, [sp, #0x8]
    ldr r0, [r4, #0x4]
    rsb r2, r2, r3, asr #0xc
    mov r1, r1, asr #0xc
    mov r3, #0x8
    bl GraphicsSpriteState_SetScreenPositionCulled
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x8
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r4, #0x1
    add r0, sp, #0x0
    moveq r4, #0x0
    bl func_02005058
    mov r0, r4
.L_0201eef4:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_0201ee48, .-func_0201ee48
