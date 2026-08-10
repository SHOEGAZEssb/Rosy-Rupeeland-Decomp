; Matching retail form; see src/game/game_phase_state_configuration.c.
.text
.extern func_0200e780
.extern func_02038e50
.extern ActorInteractionRuntime_Start

    .global func_0200e714
func_0200e714: ; 0x0200e714
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    str r5, [r4, #0x0]
    bl func_0200e780
    ldr r1, [r5, #0x24]
    mov r0, #0x0
    blx r1
    bl ActorInteractionRuntime_Start
    ldr r0, [r5, #0x0]
    sub r0, r0, #0x2
    cmp r0, #0x2
    add r0, r4, #0x2000
    movls r1, #0x1
    ldr r0, [r0, #0xe80]
    movhi r1, #0x0
    bl func_02038e50
    ldr r0, [r4, #0x0]
    ldrsh r0, [r0, #0x12]
    cmp r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0200e714, . - func_0200e714

