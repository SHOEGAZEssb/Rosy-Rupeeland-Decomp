; Matching retail form; see src/game/randomized_sprite_particle.c.
.text
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern genrand_int32

    .global func_02028860
    .type func_02028860, @function
func_02028860: ; 0x02028860
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r1
    mov r1, r3
    mov r4, r0
    mov r5, r2
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x20]
    add r0, r4, #0x10
    bl VecFx32Object_InitCopy
    add r0, r4, #0x20
    bl VecFx32Object_Init
    add r0, r4, #0x30
    bl VecFx32Object_Init
    str r6, [r4, #0x44]
    mov r0, #0x0
    str r0, [r4, #0x48]
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r2, [r4, #0x4]
    sub r0, r0, #0x10
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x44]
    add r1, r5, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r1, [sp, #0x24]
    str r0, [r4, #0x40]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x40]
    mov r1, #0x64
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x40]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x40]
    strh r1, [r0, #0x28]
    bl genrand_int32
    mov ip, r0
    ldr r2, .L_02028958
    mov r1, #0x0
    sub r3, r1, #0x1000
    and r2, ip, r2
    sub r2, r3, r2
    add r0, sp, #0x0
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r4, #0x20
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x190
    str r0, [r4, #0x48]
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02028958: .word 0x7ff
    .size func_02028860, . - func_02028860

