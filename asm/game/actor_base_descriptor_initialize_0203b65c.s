; Matching retail form; see src/game/actor_base_descriptor_initialize.c.
.text
.extern data_020f4e18
.extern func_02030acc
.extern func_020313b4
.extern func_020337d4
.extern func_02034260
.extern func_02071ee0
.extern func_02072b68
.extern func_02073fc4
    .global func_0203b65c
    .type func_0203b65c, @function
func_0203b65c: ; 0x0203b65c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r4, r1
    ldr r2, [r2, #0x14]
    mov r5, r0
    blx r2
    ldr r2, [r4, #0x4]
    mvn r0, #0x0
    cmp r2, r0
    ldreq r1, [r4, #0xc]
    cmpeq r1, r0
    ldreq r1, [r4, #0x8]
    cmpeq r1, r0
    beq .L_0203b784
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    bne .L_0203b784
    ldr r1, [r4, #0xc]
    ldr r0, .L_0203b794
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    ldr r3, [r4, #0x8]
    add r0, r5, #0x1f0
    bl func_02071ee0
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldrb r1, [r4, #0x10]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1f0]
    ldr r2, [r5, #0x1f4]
    ldr r3, [r5, #0x1f8]
    bl func_02073fc4
    str r0, [r5, #0x54]
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203b710
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_0203b710:
    ldrb r1, [r4, #0x11]
    ldr r0, [r5, #0x54]
    bl func_02072b68
    ldrsh r3, [r4, #0x24]
    ldrsh r0, [r4, #0x22]
    ldr r2, [r5, #0x54]
    mov r1, #0x2
    strh r0, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r2, [r5, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x54]
    strb r1, [r0, #0x3a]
    ldr r0, [r5, #0x14]
    tst r0, #0x1000000
    ldrne r0, [r5, #0x54]
    movne r1, #0x0
    strneb r1, [r0, #0x3a]
    ldr r0, [r5, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r4, #0x3c]
    ldrne r0, [r5, #0x54]
    strneb r1, [r0, #0x3a]
    ldrb r2, [r4, #0x10]
    mov r0, r5
    add r1, r5, #0x1ec
    bl func_020313b4
.L_0203b784:
    mov r0, r5
    mov r1, r4
    bl func_02034260
    ldmia sp!, {r3, r4, r5, pc}
.L_0203b794: .word data_020f4e18

    .size func_0203b65c, . - func_0203b65c

