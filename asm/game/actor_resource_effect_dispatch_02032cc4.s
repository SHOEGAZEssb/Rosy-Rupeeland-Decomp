; Matching retail form; see src/game/actor_resource_effect_dispatch.c.
.text
.extern data_02105310
.extern func_0200aef4
.extern func_0201b124
.extern func_0201b1e0
.extern func_020337d4
.extern gGameWork

    .global Actor_AssignPrimaryResourceWithEffect
    .type Actor_AssignPrimaryResourceWithEffect, @function
Actor_AssignPrimaryResourceWithEffect: ; 0x02032cc4
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x128
    mov r5, r0
    mov r4, r1
    str r4, [r5, #0x180]
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne .L_02032d20
    ldr r1, .L_02032d5c
    add r0, sp, #0x94
    ldr r3, [r1, #0x0]
    mov r1, r5
    mov r2, r4
    add r3, r3, #0x3cc
    bl func_0201b124
    ldr r0, .L_02032d60
    add r1, sp, #0x94
    bl func_0200aef4
    add r0, sp, #0x94
    bl func_0201b1e0
    b .L_02032d54
.L_02032d20:
    ldr r1, .L_02032d5c
    add r0, sp, #0x0
    ldr r2, [r1, #0x0]
    mov r1, r5
    add r3, r2, #0x1cc
    mov r2, r4
    add r3, r3, #0x400
    bl func_0201b124
    ldr r0, .L_02032d60
    add r1, sp, #0x0
    bl func_0200aef4
    add r0, sp, #0x0
    bl func_0201b1e0
.L_02032d54:
    add sp, sp, #0x128
    ldmia sp!, {r3, r4, r5, pc}
.L_02032d5c: .word gGameWork
.L_02032d60: .word data_02105310
    .size Actor_AssignPrimaryResourceWithEffect, . - Actor_AssignPrimaryResourceWithEffect
