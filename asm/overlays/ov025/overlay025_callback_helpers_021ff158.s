.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */
.extern func_020954e0
.extern func_020954f4
.extern gSoundContext
.extern Sound_Play


    .global func_ov025_021ff158
func_ov025_021ff158:
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    cmp r2, #0x0
    beq L_021ff174
    cmp r2, #0x1
    beq L_021ff194
    b L_021ff1bc
L_021ff174:
    ldr r1, [r1, #0x4]
    cmp r1, #0x0
    beq L_021ff188
    bl func_020954e0
    b L_021ff18c
L_021ff188:
    bl func_020954f4
L_021ff18c:
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021ff194:
    ldr r0, [r1, #0x4]
    ldr r1, L_021ff1c4
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021ff1bc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021ff1c4: .word gSoundContext
.size func_ov025_021ff158, .-func_ov025_021ff158

