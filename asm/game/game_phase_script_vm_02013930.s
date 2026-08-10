; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern data_021052fc
.extern Type7Actor_ResetMotionAndCooldown

    .global GamePhaseActorScriptVm_ClearFlag01000000AndCleanup
GamePhaseActorScriptVm_ClearFlag01000000AndCleanup: ; 0x02013930
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x84]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x1000000
    str r0, [r1, #0x10]
    ldr r0, [r4, #0x84]
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x2
    bne L_020139b8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x114]
    blx r1
    ldr r0, [r4, #0x84]
    mov r3, #0x0
    ldrb r1, [r0, #0x27e]
    add r1, r1, #0xff
    and r2, r1, #0xff
    cmp r2, #0x1f
    bhi L_02013990
    mov r1, #0x1
    mov r2, r1, lsl r2
    tst r2, #0x90000007
    movne r3, r1
L_02013990:
    cmp r3, #0x0
    beq L_020139c4
    ldr r1, L_020139cc
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0xd4]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    blx r2
    b L_020139c4
L_020139b8:
    cmp r1, #0x7
    bne L_020139c4
    bl Type7Actor_ResetMotionAndCooldown
L_020139c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_020139cc: .word data_021052fc
    .size GamePhaseActorScriptVm_ClearFlag01000000AndCleanup, . - GamePhaseActorScriptVm_ClearFlag01000000AndCleanup

