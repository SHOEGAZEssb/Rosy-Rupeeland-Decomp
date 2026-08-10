; Matching retail form; see src/game/interaction_timing_state.c.
.text
.extern data_0210576c
.global InteractionTimingState_Reset
.type InteractionTimingState_Reset, @function
.global InteractionTimingState_Tick
.type InteractionTimingState_Tick, @function
InteractionTimingState_Reset: ; 0x02045004
    ldr r0, .L_02045024
    mov r1, #0x0
    strb r1, [r0, #0x3]
    strb r1, [r0, #0x1]
    strh r1, [r0, #0x4]
    strb r1, [r0, #0x0]
    strb r1, [r0, #0x2]
    bx lr
.L_02045024: .word data_0210576c

.size InteractionTimingState_Reset, . - InteractionTimingState_Reset
InteractionTimingState_Tick: ; 0x02045028
    ldr r0, .L_02045054
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x4]
    ldr r0, .L_02045054
    ldrb r1, [r0, #0x2]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneb r1, [r0, #0x2]
    bx lr
.L_02045054: .word data_0210576c
.size InteractionTimingState_Tick, . - InteractionTimingState_Tick
