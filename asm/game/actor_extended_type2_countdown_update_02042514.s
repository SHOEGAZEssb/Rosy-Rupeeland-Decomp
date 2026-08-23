; Matching retail form; see src/game/actor_extended_type2_countdown_update.c.
.text
.extern data_020e6d3c
.extern Actor_PlayHorizontalSpatialSound
.global ActorExtendedType2_UpdateActiveCountdown
.type ActorExtendedType2_UpdateActiveCountdown, @function
ActorExtendedType2_UpdateActiveCountdown: ; 0x02042514
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    tst r2, #0x2
    beq .L_02042544
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02042548
.L_02042544:
    mov r0, #0x0
.L_02042548:
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10c]
    blx r1
    ldr r0, [r5, #0x1fc]
    subs r4, r0, r4
    bpl .L_0204259c
    mov r0, r5
    ldr r1, [r0, #0x0]
    mov r4, #0x0
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_020425c4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x104]
    blx r1
    b .L_020425c4
.L_0204259c:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_020425cc
    ldr r0, .L_020425d0
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    cmp r1, r0
    beq .L_020425c4
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_020425c4:
    str r4, [r5, #0x1fc]
    ldmia sp!, {r3, r4, r5, pc}
.L_020425cc: .word data_020e6d3c
.L_020425d0: .word 0xffff
.size ActorExtendedType2_UpdateActiveCountdown, . - ActorExtendedType2_UpdateActiveCountdown
