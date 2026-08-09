.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_020593dc
.extern gSoundContext

.global func_ov095_0221c184
func_ov095_0221c184:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov r3, r0
    ldr r0, [r3, #0x1fc]
    ldrh r2, [r0, #0x1e]
    cmp r2, #0x0
    beq .L_0221c1c4
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_0221c1cc
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
.L_0221c1c4:
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_0221c1cc: .word gSoundContext
.size func_ov095_0221c184, . - func_ov095_0221c184
