; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern DebugText_BeginFrame
.extern GameWork_SetFlag
.extern func_0201155c
.extern func_0201df64
.extern func_0201e0ec
.extern func_0202d3cc
.extern func_02039ba0
.extern func_0203abb0
.extern func_020a2324
.extern gGameWork

    .global func_0200ea48
func_0200ea48: ; 0x0200ea48
    stmdb sp!, {r4, lr}
    ldr r1, L_0200eb08
    mov r3, #0x0
    ldr r2, [r1, #0x0]
    mov r4, r0
    add r0, r2, #0x200
    strh r3, [r0, #0x28]
    ldr r0, [r1, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    ldr r2, L_0200eb08
    mov r3, #0x0
    ldr r1, [r2, #0x0]
    add r0, r4, #0x2f80
    add r1, r1, #0x200
    strh r3, [r1, #0xc]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x200
    strh r3, [r1, #0xe]
    bl func_0201155c
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201df64
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201e0ec
    bl func_020a2324
    bl func_0203abb0
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200eaec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200eaec:
    add r0, r4, #0x4
    bl func_0202d3cc
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe80]
    bl func_02039ba0
    bl DebugText_BeginFrame
    ldmia sp!, {r4, pc}
L_0200eb08: .word gGameWork
    .size func_0200ea48, . - func_0200ea48

