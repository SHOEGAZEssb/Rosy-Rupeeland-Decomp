; Matching retail form; see src/game/actor_resource_variant_apply.c.
.text
.extern data_02105310
.extern func_0200afd0
.extern func_0201b124
.extern func_0201b180
.extern func_0201b1e0
.extern func_0201b228
.extern Actor_SavePrimaryAttachmentState
.extern func_020337d4
.extern gGameWork

    .global Actor_SetResourceVariant
    .type Actor_SetResourceVariant, @function
Actor_SetResourceVariant: ; 0x02032aec
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x128
    mov r5, r0
    mov r4, r1
    strb r4, [r5, #0xe8]
    ldr r1, [r5, #0x10]
    tst r1, #0x40
    beq .L_02032b10
    bl Actor_SavePrimaryAttachmentState
.L_02032b10:
    cmp r4, #0x0
    beq .L_02032b30
    ldr r1, [r5, #0x10]
    ldr r0, .L_02032bc8
    orr r2, r1, #0x100
    mov r1, r5
    str r2, [r5, #0x10]
    bl func_0200afd0
.L_02032b30:
    mov r0, r5
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne .L_02032b80
    ldr r0, .L_02032bcc
    add r1, r5, r4, lsl #0x2
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x180]
    add r0, sp, #0x94
    mov r1, r5
    add r3, r3, #0x3cc
    bl func_0201b124
    add r1, sp, #0x94
    add r0, r5, #0xec
    bl func_0201b180
    add r0, sp, #0x94
    bl func_0201b1e0
    b .L_02032bb8
.L_02032b80:
    ldr r0, .L_02032bcc
    add r1, r5, r4, lsl #0x2
    ldr r0, [r0, #0x0]
    ldr r2, [r1, #0x180]
    add r3, r0, #0x1cc
    add r0, sp, #0x0
    mov r1, r5
    add r3, r3, #0x400
    bl func_0201b124
    add r1, sp, #0x0
    add r0, r5, #0xec
    bl func_0201b180
    add r0, sp, #0x0
    bl func_0201b1e0
.L_02032bb8:
    add r0, r5, #0xec
    bl func_0201b228
    add sp, sp, #0x128
    ldmia sp!, {r3, r4, r5, pc}
.L_02032bc8: .word data_02105310
.L_02032bcc: .word gGameWork
    .size Actor_SetResourceVariant, . - Actor_SetResourceVariant
