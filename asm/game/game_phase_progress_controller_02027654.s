; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37ec
.extern data_020c37f0
.extern gActorRuntimeFlags
.extern func_02027788
.extern func_02027d7c
.extern ActorRuntimeFlags_Test

    .global func_02027654
    .type func_02027654, @function
func_02027654: ; 0x02027654
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02027678
    cmp r0, #0x1
    beq .L_020276a8
    cmp r0, #0x2
    ldmia sp!, {r4, pc}
.L_02027678:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r4, #0xc]
    add r0, r0, #0x1
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_020276a8:
    ldr r0, .L_0202777c
    mov r1, #0x100
    bl ActorRuntimeFlags_Test
    ldr r0, [r4, #0x28]
    add r0, r0, #0x1
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x0]
    subs r0, r0, #0x1
    str r0, [r4, #0x0]
    ldreq r1, [r4, #0x10]
    cmpeq r1, #0x2
    bne .L_020276f4
    mov r0, r4
    bl func_02027788
    cmp r0, #0x0
    beq .L_020276f4
    mov r0, r4
    bl func_02027d7c
    ldmia sp!, {r4, pc}
.L_020276f4:
    ldr r1, .L_02027780
    mov r0, #0x3c
    ldr r1, [r1, #0x0]
    ldr r2, [r4, #0x0]
    mul r0, r1, r0
    cmp r2, r0
    bhs .L_02027738
    ldr r1, [r4, #0x10]
    cmp r1, #0x1
    bne .L_02027738
    mov r0, r4
    bl func_02027788
    cmp r0, #0x0
    ldrne r0, [r4, #0x10]
    addne r0, r0, #0x1
    strne r0, [r4, #0x10]
    ldmneia sp!, {r4, pc}
.L_02027738:
    ldr r1, .L_02027784
    mov r0, #0x3c
    ldr r1, [r1, #0x0]
    ldr r2, [r4, #0x0]
    mul r0, r1, r0
    cmp r2, r0
    ldmhsia sp!, {r4, pc}
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_02027788
    cmp r0, #0x0
    ldrne r0, [r4, #0x10]
    addne r0, r0, #0x1
    strne r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_0202777c: .word gActorRuntimeFlags
.L_02027780: .word data_020c37ec
.L_02027784: .word data_020c37f0
    .size func_02027654, . - func_02027654

