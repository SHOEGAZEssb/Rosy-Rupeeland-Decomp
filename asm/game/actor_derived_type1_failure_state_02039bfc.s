; Matching retail form; see src/game/actor_derived_type1_failure_state.c.
.text
.extern GameWork_SetFlag
.extern func_020338e4
.extern func_02058ce0
.extern gGameWork
.extern gSoundContext

    .global Type1Actor_EnterFailureState
    .type Type1Actor_EnterFailureState, @function
Type1Actor_EnterFailureState: ; 0x02039bfc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020338e4
    mov r1, #0x46
    ldr r0, .L_02039c30
    str r1, [r4, #0x248]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02039c34
    bl GameWork_SetFlag
    ldr r0, .L_02039c38
    ldr r0, [r0, #0x0]
    bl func_02058ce0
    ldmia sp!, {r4, pc}
.L_02039c30: .word gGameWork
.L_02039c34: .word 0x3f5
.L_02039c38: .word gSoundContext
    .size Type1Actor_EnterFailureState, . - Type1Actor_EnterFailureState
