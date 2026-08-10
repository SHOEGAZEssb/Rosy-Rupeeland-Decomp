; Matching retail form; see src/game/actor_collision_overlap.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200ab18
.extern func_0200ab30
.extern func_0200ab48
.extern Actor_GetCollisionBounds
.global func_0200a970
func_0200a970: ; 0x0200a970
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x34
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl Actor_GetCollisionBounds
    bl func_0200ab18
    mov r8, r0, lsl #0xc
    mov r0, r7
    bl Actor_GetCollisionBounds
    bl func_0200ab30
    mov r2, r0, lsl #0xc
    ldr r3, [r7, #0x2c]
    add r1, r8, r8, lsr #0x1f
    sub r1, r3, r1, asr #0x1
    add r1, r6, r1
    ldr r3, [r4, #0x8]
    add r2, r2, r2, lsr #0x1f
    cmp r1, r3
    ldr ip, [r7, #0x30]
    add r3, r1, r8
    sub r2, ip, r2, asr #0x1
    add r2, r5, r2
    add r8, r2, r0, lsl #0xc
    str r1, [sp, #0x14]
    str r3, [sp, #0x1c]
    str r2, [sp, #0x18]
    str r8, [sp, #0x20]
    bge L_0200aa0c
    ldr r0, [r4, #0x0]
    cmp r3, r0
    ble L_0200aa0c
    ldr ip, [r4, #0xc]
    cmp r2, ip
    bge L_0200aa0c
    ldr ip, [r4, #0x4]
    cmp r8, ip
    bgt L_0200aa24
L_0200aa0c:
    str r9, [sp, #0x24]
    str r9, [sp, #0x28]
    str r9, [sp, #0x2c]
    str r9, [sp, #0x30]
    mov r0, #0x0
    b L_0200aa94
L_0200aa24:
    cmp r1, r0
    movgt r0, r1
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x4]
    cmp r2, r0
    movle r2, r0
    str r2, [sp, #0x28]
    ldr r0, [r4, #0x8]
    ldr r2, [sp, #0x24]
    cmp r3, r0
    movge r3, r0
    str r3, [sp, #0x2c]
    ldr r0, [r4, #0xc]
    cmp r8, r0
    movge r8, r0
    ldr r0, [sp, #0x2c]
    str r8, [sp, #0x30]
    cmp r2, r0
    moveq r3, #0x1
    ldr r2, [sp, #0x28]
    ldr r0, [sp, #0x30]
    movne r3, #0x0
    cmp r2, r0
    moveq r0, #0x1
    movne r0, #0x0
    orrs r0, r3, r0
    moveq r0, #0x1
    movne r0, #0x0
L_0200aa94:
    cmp r0, #0x0
    beq L_0200ab0c
    ldr r0, [sp, #0x24]
    mov r3, #0x0
    cmp r1, r0
    orreq r0, r3, #0x1
    andeq r3, r0, #0xff
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x2c]
    add r4, sp, #0x24
    cmp r1, r0
    orreq r0, r3, #0x2
    andeq r3, r0, #0xff
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x28]
    mov r2, r5
    cmp r1, r0
    orreq r0, r3, #0x4
    andeq r3, r0, #0xff
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x20]
    str r4, [sp, #0x0]
    cmp r1, r0
    orreq r0, r3, #0x8
    andeq r3, r0, #0xff
    mov r0, r7
    mov r1, r6
    bl func_0200ab48
    mov r0, #0x1
    b L_0200ab10
L_0200ab0c:
    mov r0, #0x0
L_0200ab10:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    .size func_0200a970, .-func_0200a970
