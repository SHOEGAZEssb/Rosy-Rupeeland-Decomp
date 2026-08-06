; Matching retail form; see src/game/tracked_resource_actor_derived_collision.c.
.extern data_02105310
.extern func_02005030
.extern func_02005058
.extern func_0200b04c
.extern func_0200b2c0
.extern func_0202d494
.extern func_020328d0
.extern func_020337d4
.extern func_02050260
.extern func_02050560
.text
    .global func_02050d0c
func_02050d0c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, .L_02050e24
    mov r4, r1
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02050d8c
    cmp r4, #0x0
    beq .L_02050d8c
    ldr r1, [r4, #0x24]
    ldr r0, [r5, #0x24]
    subs r0, r1, r0
    bpl .L_02050d8c
    add r0, sp, #0x0
    add r1, r5, #0x38
    bl func_02005030
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r5, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_020328d0
    mov r0, r4
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0x0
    bl func_02005058
.L_02050d8c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl func_0200b2c0
    add r1, r5, #0x100
    mov r0, #0x8000
    ldrh r2, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r3, #0x0
    and r0, r2, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    ldr r0, [r5, #0x10]
    ldr r2, .L_02050e28
    orr r0, r0, #0x1f0000
    str r0, [r5, #0x10]
    strh r3, [r1, #0xf8]
    ldr r1, [r5, #0x14]
    mov r0, r5
    and r1, r1, r2
    str r1, [r5, #0x14]
    bl func_020337d4
    mov r1, r5
    bl func_0202d494
    cmp r4, #0x0
    beq .L_02050e1c
    ldr r1, [r4, #0x24]
    ldr r0, [r5, #0x24]
    subs r0, r1, r0
    bpl .L_02050e1c
    mov r0, r5
    bl func_02050260
    mov r0, r5
    mov r1, r4
    bl func_02050560
.L_02050e1c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02050e24: .word data_02105310
.L_02050e28: .word 0xff7fffbf
    .size func_02050d0c, . - func_02050d0c

