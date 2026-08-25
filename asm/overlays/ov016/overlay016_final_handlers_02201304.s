    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern GameWork_ClearFlag
    .extern Overlay016_UpdateScene
    .extern gGameWork
.global Overlay016_UpdateTerminalState
Overlay016_UpdateTerminalState:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02201320
    cmp r0, #0x1
    b L_02201350
L_02201320:
    ldr r0, [r4, #0x478]
    cmp r0, #0x0
    beq L_0220133c
    ldr r0, L_02201360
    mov r1, #0x3a8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
L_0220133c:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201350:
    mov r0, r4
    bl Overlay016_UpdateScene
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02201360: .word gGameWork
    .size Overlay016_UpdateTerminalState, . - Overlay016_UpdateTerminalState

