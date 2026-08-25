    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Overlay017_RenderScene
.global Overlay017_UpdateFinalState
Overlay017_UpdateFinalState:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    beq L_02201368
    cmp r1, #0x1
    b L_02201378
L_02201368:
    add r1, r1, #0x1
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x8]
L_02201378:
    bl Overlay017_RenderScene
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size Overlay017_UpdateFinalState, . - Overlay017_UpdateFinalState
