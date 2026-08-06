; Matching retail form; see src/game/actor_mode_nibble_contact_flags.c.
.text
.extern GameWork_TestFlag
.extern gGameWork
    .global func_0203c578
    .type func_0203c578, @function
func_0203c578: ; 0x0203c578
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, .L_0203c658
    mov r6, r0
    mov r5, r1
    ldr r0, [r3, #0x0]
    ldr r1, .L_0203c65c
    mov r4, r2
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r6, #0x200
    ldrh r0, [r0, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203c5e4
    mov r0, #0x1
    str r0, [r6, #0x10c]
    ldrh r0, [r5, #0x4e]
    str r0, [r6, #0x110]
    ldr r0, [r5, #0x1f8]
    ldrsh r0, [r0, #0x0]
    str r0, [r6, #0x114]
    ldmia sp!, {r4, r5, r6, pc}
.L_0203c5e4:
    cmp r4, #0x0
    beq .L_0203c620
    add r3, r6, #0x200
    ldrh r4, [r3, #0x8]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    mov r1, r4, lsl #0x14
    mov r1, r1, lsr #0x14
    orr r1, r1, #0x2
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x14
    and r4, r4, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r4, r0
    strh r0, [r3, #0x8]
.L_0203c620:
    add r3, r6, #0x200
    ldrh r4, [r3, #0x8]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    mov r1, r4, lsl #0x14
    mov r1, r1, lsr #0x14
    orr r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x14
    and r4, r4, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r4, r0
    strh r0, [r3, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.L_0203c658: .word gGameWork
.L_0203c65c: .word 0x438
    .size func_0203c578, . - func_0203c578

    .global func_0203c660
    .type func_0203c660, @function
func_0203c660: ; 0x0203c660
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, .L_0203c740
    mov r6, r0
    mov r5, r1
    ldr r0, [r3, #0x0]
    ldr r1, .L_0203c744
    mov r4, r2
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r6, #0x200
    ldrh r0, [r0, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203c6cc
    mov r0, #0x1
    str r0, [r6, #0x10c]
    ldrh r0, [r5, #0x4e]
    str r0, [r6, #0x110]
    ldr r0, [r5, #0x1fc]
    ldrsh r0, [r0, #0x0]
    str r0, [r6, #0x114]
    ldmia sp!, {r4, r5, r6, pc}
.L_0203c6cc:
    cmp r4, #0x0
    beq .L_0203c708
    add r3, r6, #0x200
    ldrh r4, [r3, #0x8]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    mov r1, r4, lsl #0x14
    mov r1, r1, lsr #0x14
    orr r1, r1, #0x2
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x14
    and r4, r4, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r4, r0
    strh r0, [r3, #0x8]
.L_0203c708:
    add r3, r6, #0x200
    ldrh r4, [r3, #0x8]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    mov r1, r4, lsl #0x14
    mov r1, r1, lsr #0x14
    orr r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x14
    and r4, r4, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r4, r0
    strh r0, [r3, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.L_0203c740: .word gGameWork
.L_0203c744: .word 0x438
    .size func_0203c660, . - func_0203c660


