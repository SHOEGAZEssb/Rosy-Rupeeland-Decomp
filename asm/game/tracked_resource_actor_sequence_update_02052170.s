; Matching retail form; see src/game/tracked_resource_actor_sequence_update.c.
.extern func_020349b8
.extern func_02051e04
.text
    .global func_02052170
func_02052170:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r1, r4, #0x100
    ldrh r1, [r1, #0xf0]
    mov r1, r1, lsl #0x11
    movs r5, r1, lsr #0x11
    bne .L_020521a4
    ldrb r1, [r4, #0x4b]
    tst r1, #0xf
    beq .L_020521a4
    ldr r1, .L_020521dc
    mov r2, #0x0
    bl func_020349b8
.L_020521a4:
    mov r0, r4
    bl func_02051e04
    cmp r5, #0x0
    addeq r0, r4, #0x100
    ldreqh r0, [r0, #0xf0]
    moveq r0, r0, lsl #0x11
    moveq r0, r0, lsr #0x11
    cmpeq r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, .L_020521e0
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    ldmia sp!, {r3, r4, r5, pc}
.L_020521dc: .word 0x4283
.L_020521e0: .word 0x4282
    .size func_02052170, . - func_02052170
