; Matching retail form; see src/game/ballistic_sprite_particle.c.
.text
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02073fc4
.extern func_02074038
.extern func_020be4e4
.extern func_020bf1f8
.extern genrand_int32

.global func_02023890
    .type func_02023890, @function
func_02023890: ; 0x02023890
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x24
    mov r6, r1
    mov r4, r0
    mov r1, r3
    mov r5, r2
    bl func_02005030
    add r0, r4, #0x10
    bl func_02004fe0
    ldr r2, [sp, #0x38]
    mov r1, #0x0
    str r2, [r4, #0x24]
    str r1, [r4, #0x28]
    strh r1, [r4, #0x2c]
    strh r1, [r4, #0x2e]
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    mov r0, r6
    bl func_02073fc4
    str r0, [r4, #0x20]
    bl genrand_int32
    mov r1, #0x7
    bl func_020bf1f8
    ldr r0, [r4, #0x20]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x20]
    ldr r0, [sp, #0x3c]
    ldrh r1, [r2, #0x24]
    cmp r0, #0x0
    orr r0, r1, #0x2
    strh r0, [r2, #0x24]
    bne .L_02023970
    bl genrand_int32
    mov r5, r0
    bl genrand_int32
    mov r1, r5, lsl #0x18
    mov r1, r1, lsr #0x14
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x14
    add r1, r1, #0x800
    add r0, sp, #0x14
    rsb r1, r1, #0x0
    sub r2, r2, #0x4800
    mov r3, #0x0
    bl func_0200500c
    add r1, sp, #0x14
    add r0, r4, #0x10
    bl func_020050a4
    add r0, sp, #0x14
    bl func_02005058
    bl func_020be4e4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x14
    b .L_020239c4
.L_02023970:
    bl genrand_int32
    mov r5, r0
    bl genrand_int32
    mov r1, r5, lsl #0x18
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x14
    mov r1, r1, lsr #0x14
    add r0, sp, #0x4
    add r1, r1, #0x800
    sub r2, r2, #0x4800
    mov r3, #0x0
    bl func_0200500c
    add r1, sp, #0x4
    add r0, r4, #0x10
    bl func_020050a4
    add r0, sp, #0x4
    bl func_02005058
    bl func_020be4e4
    and r0, r0, #0xff
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x4
.L_020239c4:
    strh r0, [r4, #0x2e]
    bl genrand_int32
    mov r1, #0xf
    bl func_020bf1f8
    add r1, r1, #0xf
    mov r0, r4
    str r1, [r4, #0x30]
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, pc}
    .size func_02023890, . - func_02023890
