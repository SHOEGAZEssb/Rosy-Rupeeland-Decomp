; Matching retail form; see src/game/actor_derived_type1_failure_state.c.
.text
.extern GameWork_TestFlag
.extern func_02010b64
.extern func_02039bfc
.extern gGameWork
.extern gLupyContext

    .global func_02039bb0
    .type func_02039bb0, @function
func_02039bb0: ; 0x02039bb0
    stmdb sp!, {r4, lr}
    ldr r1, .L_02039bf0
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02039bf4
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, .L_02039bf8
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r0, r4
    bl func_02039bfc
    ldmia sp!, {r4, pc}
.L_02039bf0: .word gGameWork
.L_02039bf4: .word 0x3f5
.L_02039bf8: .word gLupyContext
    .size func_02039bb0, . - func_02039bb0
