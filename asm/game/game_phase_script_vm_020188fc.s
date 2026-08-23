; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.extern gCPoint2DS16VTable
.global CPoint2DS16_InitFromRectangle
CPoint2DS16_InitFromRectangle:
    ldr r3, L_02018954
    mov r2, #0x0
    str r3, [r0, #0x0]
    strh r2, [r0, #0x4]
    strh r2, [r0, #0x6]
    ldrsh r3, [r1, #0x0]
    ldrsh r2, [r1, #0x4]
    sub r2, r2, r3
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    add r2, r2, r2, lsr #0x1f
    add r2, r3, r2, asr #0x1
    strh r2, [r0, #0x4]
    ldrsh r2, [r1, #0x2]
    ldrsh r1, [r1, #0x6]
    sub r1, r1, r2
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    add r1, r1, r1, lsr #0x1f
    add r1, r2, r1, asr #0x1
    strh r1, [r0, #0x6]
    bx lr
L_02018954: .word gCPoint2DS16VTable
.size CPoint2DS16_InitFromRectangle, . - CPoint2DS16_InitFromRectangle
